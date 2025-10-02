#include "Out.h"
#include "CompilerIncludePath.h"
#include "Consumer.h"
#include <sqlite3.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/Error.h>
#include <filesystem>
#include <fstream>
#include <mutex>
#include <clang/AST/ExprObjC.h>
#include <thread>

namespace
{

sqlite3* Db { nullptr };

struct LastResort
{
    ~LastResort()
    {
        Dcp::CloseOutStream();
    }
};

LastResort x;

std::string ToAbsolutePath(const std::string& Path)
{
    if (Path.empty())
    {
        return Path;
    }
    if (Path[0] == '/')
    {
        return Path;
    }

    return std::filesystem::absolute(Path).string();
}

int ExecTrivial(const char* Sql)
{
    char* Err = nullptr;

    constexpr int MaxRetries = 200;
    constexpr int WaitMs = 1;

    int Attempts = 0;

    int Rc = SQLITE_OK;
    while (Attempts < MaxRetries)
    {
         Rc = sqlite3_exec(Db, Sql, nullptr, nullptr, &Err);

        if (Rc == SQLITE_OK)
        {
            return Rc;
        }

        if (Rc == SQLITE_BUSY || Rc == SQLITE_LOCKED)
        {
            std::this_thread::sleep_for(std::chrono::milliseconds(WaitMs));
            ++Attempts;
            continue;
        }

        llvm::errs() << "SQL error: " << Err << "\n";
        llvm::errs().flush();
        PRIVATE_DCP_FAIL_BOILERPLATE()
        sqlite3_free(Err);

        return Rc;
    }

    llvm::errs() << "SQL error on: " << Sql << " with code " << Rc << ".\n";
    llvm::errs().flush();
    PRIVATE_DCP_FAIL_BOILERPLATE()

    return Rc;
}

int ExecStmt(sqlite3_stmt* Stmt)
{
    constexpr int MaxRetries = 200;
    constexpr int WaitMs = 1;

    int Attempts = 0;

    int Rc = SQLITE_OK;
    while (Attempts < MaxRetries)
    {
        Rc = sqlite3_step(Stmt);

        if (Rc == SQLITE_DONE)
        {
            return SQLITE_OK;
        }

        if (Rc == SQLITE_ROW)
        {
            return SQLITE_ROW;
        }

        if (Rc == SQLITE_BUSY || Rc == SQLITE_LOCKED)
        {
            std::this_thread::sleep_for(std::chrono::milliseconds(WaitMs));
            ++Attempts;
            continue;
        }

        if (Rc == SQLITE_MISUSE)
        {
            llvm::errs() << "SQL misuse error: " << sqlite3_errmsg(Db) << "\n";
            llvm::errs().flush();
            PRIVATE_DCP_FAIL_BOILERPLATE()
            return Rc;
        }

        llvm::errs() << "SQL error on stmt with code " << Rc << ".\n";
        llvm::errs().flush();
        PRIVATE_DCP_FAIL_BOILERPLATE()

        return Rc;
    }

    llvm::errs() << "SQL error on stmt with code " << Rc << ".\n";
    llvm::errs().flush();
    PRIVATE_DCP_FAIL_BOILERPLATE()

    return Rc;
}

} /* ~Namespace <Anonymous> */

bool Dcp::InitializeOutStream()
{
    if (!std::filesystem::exists(IrPath))
    {
        if (!std::filesystem::create_directories(std::filesystem::path(IrPath).parent_path()))
        {
            llvm::errs() << "Failed to create directory [" << IrPath << "].\n";
            return false;
        }
    }

    if (!std::filesystem::is_directory(IrPath))
    {
        llvm::errs() << "Path [" << IrPath << "] is not a directory.\n";
        return false;
    }

    const std::filesystem::path DbPath = std::filesystem::path(IrPath) / "ir.db";
    if (!std::filesystem::exists(DbPath))
    {
        std::ofstream outFile(DbPath);
        if (!outFile)
        {
            llvm::errs() << "Failed to create file [" << DbPath << "].\n";
            return false;
        }
        outFile.close();
    }

    if (const int Rc = sqlite3_open(DbPath.c_str(), &Db); Rc != SQLITE_OK)
    {
        llvm::errs() << "Can't open database [" << DbPath << "].\n";
        llvm::errs() << "Can't open database [" << sqlite3_errmsg(Db) << "].\n";
        sqlite3_close(Db);

        return false;
    }

    ExecTrivial("PRAGMA journal_mode=WAL;");
    sqlite3_busy_timeout(Db, 5'000);

#define PRIVATE_DCP_REPORT_SQL_ERROR()                         \
    if (const int rc = ExecTrivial(Sql); rc != SQLITE_OK)      \
    {                                                          \
        llvm::errs() << "Unresolved SQL error encountered.\n"; \
                                                               \
        return false;                                          \
    }

    // Translations
    {
        const char* Sql = "CREATE TABLE IF NOT EXISTS Translations ("
                          "Identifier TEXT NOT NULL UNIQUE PRIMARY KEY"
                          ");";

        PRIVATE_DCP_REPORT_SQL_ERROR()
    }

    // Compiler-Include paths
    {
        const char* Sql = "CREATE TABLE IF NOT EXISTS CompilerIncludePaths ("
                          "Identifier TEXT NOT NULL,"
                          "Path TEXT NOT NULL,"
                          "\"Group\" INTEGER NOT NULL,"
                          "PRIMARY KEY (Identifier, Path),"
                          "FOREIGN KEY (Identifier) REFERENCES Translations(Identifier) ON DELETE CASCADE"
                          ");";

        PRIVATE_DCP_REPORT_SQL_ERROR()
    }

    // Include directive
    {
        const char* Sql = "CREATE TABLE IF NOT EXISTS IncludeDirectives ("
                          "What TEXT NOT NULL,"
                          "Source TEXT NOT NULL,"
                          "Line INTEGER NOT NULL,"
                          "Native TEXT NOT NULL,"
                          "bForeign INTEGER NOT NULL DEFAULT 0,"
                          "PRIMARY KEY (Source, Line)"
                          ");";

        PRIVATE_DCP_REPORT_SQL_ERROR()
    }

    // Macro definitions
    {
        const char* Sql = "CREATE TABLE IF NOT EXISTS Macros ("
                          "Identifier TEXT NOT NULL,"
                          "Source TEXT NOT NULL,"
                          "Line INTEGER NOT NULL,"
                          "Column INTEGER NOT NULL,"
                          "bFunctionLike INTEGER NOT NULL,"
                          "Definition TEXT,"
                          "Params TEXT,"
                          "PRIMARY KEY (Source, Line)"
                          ");";

        PRIVATE_DCP_REPORT_SQL_ERROR()
    }

    // Seen macro definitions
    {
        const char* Sql = "CREATE TABLE IF NOT EXISTS SeenMacros ("
                          "Identifier TEXT NOT NULL,"
                          "Source TEXT NOT NULL,"
                          "bFunctionLike INTEGER NOT NULL,"
                          "Definition TEXT,"
                          "Params TEXT,"
                          "PRIMARY KEY (Identifier, Source)"
                          ");";

        PRIVATE_DCP_REPORT_SQL_ERROR()
    }

    // Typedefs
    const char* Sql = "CREATE TABLE IF NOT EXISTS Typedefs ("
            "Identifier TEXT NOT NULL,"
            "Source TEXT NOT NULL,"
            "Line INTEGER NOT NULL ,"
            "Column INTEGER NOT NULL,"
            "What TEXT,"
            "Type TEXT,"
            "bNoTag INTEGER NOT NULL DEFAULT 0,"
            "NoTagLine INTEGER,"
            "NoTagColumn INTEGER,"
            "RNoTagLine INTEGER,"
            "RNoTagColumn INTEGER,"
            "PRIMARY KEY (Identifier, Source)"
            ");"; {
        PRIVATE_DCP_REPORT_SQL_ERROR()
    }

    // Records
    {
        const char* Sql = "CREATE TABLE IF NOT EXISTS Records ("
                          "Identifier TEXT NOT NULL,"
                          "Source TEXT NOT NULL,"
                          "Line INTEGER NOT NULL,"
                          "Column INTEGER NOT NULL,"
                          "RBraceLine INTEGER NOT NULL,"
                          "RBraceColumn INTEGER NOT NULL,"
                          "Type TEXT NOT NULL,"
                          "Enum TEXT,"
                          "PRIMARY KEY (Identifier, Source)"
                          ");";

        PRIVATE_DCP_REPORT_SQL_ERROR()
    }

    // Decls
    {
        const char* Sql = "CREATE TABLE IF NOT EXISTS Decls ("
                          "Identifier TEXT NOT NULL,"
                          "Source TEXT NOT NULL,"
                          "Line INTEGER NOT NULL,"
                          "Column INTEGER,"
                          "bStatic INTEGER,"
                          "bExtern INTEGER,"
                          "bDef INTEGER NOT NULL,"
                          "PRIMARY KEY (Identifier, Source, Line)"
                          ");";

        PRIVATE_DCP_REPORT_SQL_ERROR()
    }

    // Functions
    {
        const char* Sql = "CREATE TABLE IF NOT EXISTS Functions ("
                          "Identifier TEXT NOT NULL,"
                          "Source TEXT NOT NULL,"
                          "Line INTEGER NOT NULL,"
                          "Column INTEGER NOT NULL,"
                          "RBraceLine INTEGER NOT NULL,"
                          "RBraceColumn INTEGER NOT NULL,"
                          "bStatic INTEGER NOT NULL DEFAULT 0,"
                          "Params TEXT,"
                          "Ret TEXT NOT NULL,"
                          "PRIMARY KEY (Identifier, Source, Line)"
                          ");";

        PRIVATE_DCP_REPORT_SQL_ERROR()
    }

    // Refs
    {
        const char* Sql = "CREATE TABLE IF NOT EXISTS Refs ("
                          "Identifier TEXT NOT NULL,"
                          "Source TEXT NOT NULL,"
                          "Line INTEGER NOT NULL,"
                          "Column INTEGER NOT NULL,"
                          "Type TEXT NOT NULL DEFAULT 'record',"
                          "Ref TEXT NOT NULL,"
                          "bStrong INTEGER NOT NULL,"
                          "PRIMARY KEY (Identifier, Source, Line, Column, Ref)"
                          ");";

        PRIVATE_DCP_REPORT_SQL_ERROR()
    }

    // Variables
    {
        const char* Sql = "CREATE TABLE IF NOT EXISTS Variables ("
                          "Identifier TEXT NOT NULL,"
                          "Source TEXT NOT NULL,"
                          "Line INTEGER NOT NULL,"
                          "Column INTEGER NOT NULL,"
                          "Type TEXT NOT NULL,"
                          "bStatic INTEGER NOT NULL DEFAULT 0,"
                          "bExtern INTEGER NOT NULL DEFAULT 0,"
                          "Init TEXT,"
                          "PRIMARY KEY (Identifier, Source, Line, Column)"
                          ");";

        PRIVATE_DCP_REPORT_SQL_ERROR()
    }

#undef PRIVATE_DCP_REPORT_SQL_ERROR

    return true;
}

void Dcp::CloseOutStream()
{
    if (Db)
    {
        sqlite3_close(Db);
        Db = nullptr;
    }

    return;
}

#define PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()                         \
    if (const int rc = ExecTrivial(Sql.c_str()); rc != SQLITE_OK) \
    {                                                             \
        llvm::errs() << "Unresolved SQL error encountered.\n";    \
                                                                  \
        return;                                                   \
    }

#define PRIVATE_DCP_EXECUTE_TRIVIAL_SQL_CONTINUE() \
    if (const int rc = ExecTrivial(Sql.c_str()); rc != SQLITE_OK) \
    {                                                             \
        llvm::errs() << "Unresolved SQL error encountered.\n";    \
                                                                  \
        continue;                                                 \
    }

void Dcp::PutToIntermediate(const llvm::StringRef& File, const std::vector<CompilerIncludePath>& Include)
{
    {
        const std::string Sql = "INSERT OR IGNORE INTO Translations (Identifier) VALUES ('" + File.str() + "');";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()
    }

    for (auto& I : Include)
    {
        const std::string Sql = "INSERT OR IGNORE INTO CompilerIncludePaths (Identifier, Path, \"Group\") VALUES ('" +
                                 ToAbsolutePath(File.str()) + "', '" + ToAbsolutePath(I.Path) + "'," + std::to_string(I.Group) + ");";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL_CONTINUE()
    }

    return;
}

void Dcp::PutToIntermediate(const std::map<std::string, std::vector<MyIncludeDirective>>& Files)
{
    for (auto& [Id, Ds] : Files)
    {
        for (const auto& D : Ds)
        {
            dcp_check( Id == D.Source )

            const std::string Sql = "INSERT OR IGNORE INTO IncludeDirectives (What, Source, Line, Native, bForeign) VALUES ('" +
                                    D.Identifier + "', '" + ToAbsolutePath(D.Source) + "', " + std::to_string(D.Line) + ", '" +
                                    D.Native + "', " + (IsModuleHeader(D.Identifier) ? "0" : "1") + ");";

            PRIVATE_DCP_EXECUTE_TRIVIAL_SQL_CONTINUE()

            continue;
        }

        continue;
    }

    return;
}

void Dcp::PutToIntermediate(const std::map<std::string, std::vector<MyMacroInfo>>& Files)
{
    // We can make this better, who cares rn.
    std::vector<MyMacroInfo> SeenMacros;
    for (const auto& [_, Macros] : Files)
    {
        for (const auto& M : Macros)
        {
            if
            (
                std::find_if(
                SeenMacros.begin(), SeenMacros.end(),
                [&M](const MyMacroInfo& SeenMacro) { return SeenMacro.Identifier == M.Identifier; }) != SeenMacros.end()
            )
            {
                continue;
            }

            SeenMacros.emplace_back(M);

            continue;
        }

        continue;
    }

    const char* Sql_Macros =
        "INSERT OR IGNORE INTO Macros "
        "(Identifier, Source, Line, Column, bFunctionLike, Definition, Params) "
        "VALUES (?, ?, ?, ?, ?, ?, ?);";

    sqlite3_stmt* Stmt_Macros = nullptr;
    if (sqlite3_prepare_v2(Db, Sql_Macros, -1, &Stmt_Macros, nullptr) != SQLITE_OK)
    {
        llvm::errs() << "Failed to prepare statement: " << sqlite3_errmsg(Db) << "\n";
        llvm::errs().flush();
        PRIVATE_DCP_FAIL_BOILERPLATE()
        return;;
    }

    const char* Sql_SeenMacros =
        "INSERT OR IGNORE INTO SeenMacros "
        "(Identifier, Source, bFunctionLike, Definition, Params) "
        "VALUES (?, ?, ?, ?, ?);";

    sqlite3_stmt* Stmt_SeenMacros = nullptr;
    if (sqlite3_prepare_v2(Db, Sql_SeenMacros, -1, &Stmt_SeenMacros, nullptr) != SQLITE_OK)
    {
        llvm::errs() << "Failed to prepare statement: " << sqlite3_errmsg(Db) << "\n";
        llvm::errs().flush();
        PRIVATE_DCP_FAIL_BOILERPLATE()
        return;
    }

    if (ExecTrivial("BEGIN IMMEDIATE;") != SQLITE_OK)
    {
        llvm::errs() << "Failed to begin transaction: " << sqlite3_errmsg(Db) << "\n";
        llvm::errs().flush();
        PRIVATE_DCP_FAIL_BOILERPLATE()
        return;
    }

    for (const auto& [Id, Ms] : Files)
    {
        for (const auto& M : Ms)
        {
            dcp_check( Id == M.Source )

            M.ExpandAndFollowSourceLocation();

            int rc;

            if (M.bFunctionLike)
            {
                std::string ParamsStr;
                for (const auto& Param : M.Params)
                {
                    if (!ParamsStr.empty())
                    {
                        ParamsStr += ", ";
                    }

                    ParamsStr += Param;

                    continue;
                }

                sqlite3_bind_text(Stmt_Macros, 1, M.Identifier.c_str(), -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(Stmt_Macros, 2, ToAbsolutePath(M.Source).c_str(), -1, SQLITE_TRANSIENT);
                sqlite3_bind_int(Stmt_Macros,  3, M.Line);
                sqlite3_bind_int(Stmt_Macros,  4, M.Column);
                sqlite3_bind_int(Stmt_Macros,  5, 1);
                sqlite3_bind_text(Stmt_Macros, 6, M.Definition.c_str(), -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(Stmt_Macros, 7, ParamsStr.c_str(), -1, SQLITE_TRANSIENT);

                rc = sqlite3_step(Stmt_Macros);
            }
            else
            {
                dcp_check( M.Params.empty() )

                sqlite3_bind_text(Stmt_Macros, 1, M.Identifier.c_str(), -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(Stmt_Macros, 2, ToAbsolutePath(M.Source).c_str(), -1, SQLITE_TRANSIENT);
                sqlite3_bind_int(Stmt_Macros,  3, M.Line);
                sqlite3_bind_int(Stmt_Macros,  4, M.Column);
                sqlite3_bind_int(Stmt_Macros,  5, 0);
                sqlite3_bind_text(Stmt_Macros, 6, M.Definition.c_str(), -1, SQLITE_TRANSIENT);
                sqlite3_bind_null(Stmt_Macros, 7);

                rc = sqlite3_step(Stmt_Macros);
            }

            dcp_check( rc == SQLITE_DONE )
            sqlite3_reset(Stmt_Macros);

            continue;
        }

        continue;
    }

    for (const auto& [F, _] : Files)
    {
        for (const MyMacroInfo& M : SeenMacros)
        {
            int rc;

            if (M.bFunctionLike)
            {
                std::string ParamsStr;
                for (const auto& Param : M.Params)
                {
                    if (!ParamsStr.empty())
                    {
                        ParamsStr += ", ";
                    }

                    ParamsStr += Param;

                    continue;
                }

                sqlite3_bind_text(Stmt_SeenMacros, 1, M.Identifier.c_str(), -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(Stmt_SeenMacros, 2, ToAbsolutePath(F).c_str(), -1, SQLITE_TRANSIENT);
                sqlite3_bind_int(Stmt_SeenMacros,  3, 1);
                sqlite3_bind_text(Stmt_SeenMacros, 4, M.Definition.c_str(), -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(Stmt_SeenMacros, 5, ParamsStr.c_str(), -1, SQLITE_TRANSIENT);

                rc = sqlite3_step(Stmt_SeenMacros);
            }
            else
            {
                dcp_check( M.Params.empty() )

                sqlite3_bind_text(Stmt_SeenMacros, 1, M.Identifier.c_str(), -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(Stmt_SeenMacros, 2, ToAbsolutePath(F).c_str(), -1, SQLITE_TRANSIENT);
                sqlite3_bind_int(Stmt_SeenMacros,  3, 0);
                sqlite3_bind_text(Stmt_SeenMacros, 4, M.Definition.c_str(), -1, SQLITE_TRANSIENT);
                sqlite3_bind_null(Stmt_SeenMacros, 5);

                rc = sqlite3_step(Stmt_SeenMacros);
            }

            dcp_check( rc == SQLITE_DONE )
            sqlite3_reset(Stmt_SeenMacros);
        }

        continue;
    }

    if (ExecTrivial("COMMIT;") != SQLITE_OK)
    {
        llvm::errs() << "Failed to commit transaction: " << sqlite3_errmsg(Db) << "\n";
        llvm::errs().flush();
        PRIVATE_DCP_FAIL_BOILERPLATE()
        return;
    }

    sqlite3_finalize(Stmt_Macros);
    sqlite3_finalize(Stmt_SeenMacros);

    return;
}

void Dcp::PutToIntermediate(const MyDecl& InDecl)
{
    const std::string Sql =
        "INSERT OR IGNORE INTO Decls ("
        "Identifier, Source, Line, Column, bStatic, bExtern, bDef"
        ") VALUES ('" + InDecl.Identifier + "', '" + ToAbsolutePath(InDecl.Source) + "', " +
        std::to_string(InDecl.Line) + ", " + std::to_string(InDecl.Column) + ", " +
        (InDecl.bStatic == EDeclBool::True ? "1" : (InDecl.bStatic == EDeclBool::False ? "0" : "NULL")) + ", " +
        (InDecl.bExtern == EDeclBool::True ? "1" : (InDecl.bExtern == EDeclBool::False ? "0" : "NULL")) + ", " +
        (InDecl.bDef ? "1" : "0") + ");";

    PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()

    return;
}

void Dcp::PutToIntermediate(const MyTypeDef& InTypeDef)
{
    if (InTypeDef.bNoTag)
    {
        dcp_check( InTypeDef.What.empty() )

        const std::string Sql = "INSERT OR IGNORE INTO Typedefs ("
                                "Identifier, Source, Line, Column, Type, bNoTag, NoTagLine, NoTagColumn, RNoTagLine, RNoTagColumn"
                                ") VALUES ('" + InTypeDef.Identifier + "', '" + ToAbsolutePath(InTypeDef.Source) + "', " +
                                std::to_string(InTypeDef.Line) + ", " + std::to_string(InTypeDef.Column) + ", '"
                                + InTypeDef.Type + "', 1, "
                                + std::to_string(InTypeDef.NoTagLine) +
                                ", " + std::to_string(InTypeDef.NoTagColumn) + ", " +
                                std::to_string(InTypeDef.RNoTagLine) + ", " + std::to_string(InTypeDef.RNoTagColumn) + ");";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()
    }
    else
    {
        {
            const std::string Sql = "INSERT OR IGNORE INTO Typedefs ("
                                    "Identifier, Source, Line, Column, What, bNoTag"
                                    ") VALUES ('" + InTypeDef.Identifier + "', '" + ToAbsolutePath(InTypeDef.Source) + "', " +
                                    std::to_string(InTypeDef.Line) + ", " + std::to_string(InTypeDef.Column) + ", '" +
                                    InTypeDef.What + "', 0);";

            PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()
        }

        if (!InTypeDef.Type.empty()) /* Trivial */
        {
            const std::string Sql = "INSERT OR IGNORE INTO Refs ("
                                    "Identifier, Source, Line, Column, Ref, bStrong"
                                    ") VALUES ('" + InTypeDef.Identifier + "', '" + ToAbsolutePath(InTypeDef.Source) + "', " +
                                    std::to_string(InTypeDef.Line) + ", " + std::to_string(InTypeDef.Column) + ", '" +
                                        InTypeDef.Type + "', 0) " +
                                    "ON CONFLICT(Identifier, Source, Line, Column, Ref) DO UPDATE SET "
                                    "bStrong = CASE"
                                    "    WHEN excluded.bStrong = 1 AND Refs.bStrong = 0 THEN 1"
                                    "    ELSE Refs.bStrong "
                                    "END;";

            PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()
        }
    }

    for (const auto& R : InTypeDef.Records)
    {
        const std::string Sql = "INSERT OR IGNORE INTO Refs ("
                                "Identifier, Source, Line, Column, Ref, bStrong"
                                ") VALUES ('" + InTypeDef.Identifier + "', '" + ToAbsolutePath(InTypeDef.Source) + "', " +
                                std::to_string(InTypeDef.Line) + ", " + std::to_string(InTypeDef.Column) + ", '" +
                                    R.Ref + "', " + (R.bStrong ? "1" : "0") + ") " +
                                    "ON CONFLICT(Identifier, Source, Line, Column, Ref) DO UPDATE SET "
                                    "bStrong = CASE"
                                    "    WHEN excluded.bStrong = 1 AND Refs.bStrong = 0 THEN 1"
                                    "    ELSE Refs.bStrong "
                                    "END;";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL_CONTINUE()
    }

    return;
}


void Dcp::PutToIntermediate(const MyRecord& InRecord)
{
    MyDecl D;
    D.Identifier = InRecord.Identifier;
    D.Source = ToAbsolutePath(InRecord.Source);
    D.Line = InRecord.Line;
    D.Column = InRecord.Column;
    D.bDef = true;
    PutToIntermediate(D);

    {
        const std::string Sql = "INSERT OR IGNORE INTO Records ("
                                "Identifier, Source, Line, Column, RBraceLine, RBraceColumn, Type"
                                ") VALUES ('" + InRecord.Identifier + "', '" + ToAbsolutePath(InRecord.Source) + "', " +
                                std::to_string(InRecord.Line) + ", " + std::to_string(InRecord.Column) + ", " +
                                std::to_string(InRecord.RBraceLine) + ", " + std::to_string(InRecord.RBraceColumn) + ", '" +
                                InRecord.Type + "');";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()
    }

    for (const auto& R : InRecord.Records)
    {
        const std::string Sql = "INSERT OR IGNORE INTO Refs ("
                                "Identifier, Source, Line, Column, Ref, bStrong"
                                ") VALUES ('" + InRecord.Identifier + "', '" + ToAbsolutePath(InRecord.Source) + "', " +
                                std::to_string(InRecord.Line) + ", " + std::to_string(InRecord.Column) + ", '" +
                                    R.Ref + "', " + (R.bStrong ? "1" : "0") + ") " +
                                    "ON CONFLICT(Identifier, Source, Line, Column, Ref) DO UPDATE SET "
                                    "bStrong = CASE"
                                    "    WHEN excluded.bStrong = 1 AND Refs.bStrong = 0 THEN 1"
                                    "    ELSE Refs.bStrong "
                                    "END;";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL_CONTINUE()
    }

    return;
}

void Dcp::PutToIntermediate(const MyEnumRecord& InEnumRecord)
{
    MyDecl D;
    D.Identifier = InEnumRecord.Identifier;
    D.Source = ToAbsolutePath(InEnumRecord.Source);
    D.Line = InEnumRecord.Line;
    D.Column = InEnumRecord.Column;
    D.bDef = true;
    PutToIntermediate(D);

    dcp_check( InEnumRecord.Enum.has_value() )

    {
        const std::string Sql = "INSERT OR IGNORE INTO Records ("
                                "Identifier, Source, Line, Column, RBraceLine, RBraceColumn, Type, Enum"
                                ") VALUES ('" + InEnumRecord.Identifier + "', '" + ToAbsolutePath(InEnumRecord.Source) + "', " +
                                std::to_string(InEnumRecord.Line) + ", " + std::to_string(InEnumRecord.Column) + ", " +
                                std::to_string(InEnumRecord.RBraceLine) + ", " + std::to_string(InEnumRecord.RBraceColumn) + ", '" +
                                InEnumRecord.Type + "', '" + InEnumRecord.Enum.value() + "');";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()
    }

    for (const auto& R : InEnumRecord.Records)
    {
        const std::string Sql = "INSERT OR IGNORE INTO Refs ("
                                "Identifier, Source, Line, Column, Ref, bStrong"
                                ") VALUES ('" + InEnumRecord.Identifier + "', '" + ToAbsolutePath(InEnumRecord.Source) + "', " +
                                std::to_string(InEnumRecord.Line) + ", " + std::to_string(InEnumRecord.Column) + ", '" +
                                    R.Ref + "', " + (R.bStrong ? "1" : "0") + ") " +
                                    "ON CONFLICT(Identifier, Source, Line, Column, Ref) DO UPDATE SET "
                                    "bStrong = CASE"
                                    "    WHEN excluded.bStrong = 1 AND Refs.bStrong = 0 THEN 1"
                                    "    ELSE Refs.bStrong "
                                    "END;";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL_CONTINUE()
    }

    return;
}

void Dcp::PutToIntermediate(const MyFunction& InFunction)
{
    MyDecl D;
    D.Identifier = InFunction.Identifier;
    D.Source = ToAbsolutePath(InFunction.Source);
    D.Line = InFunction.Line;
    D.Column = InFunction.Column;
    D.bStatic = InFunction.bStatic ? EDeclBool::True : EDeclBool::False;
    D.bDef = true;

    PutToIntermediate(D);

    {
        std::string ParamsStr;
        for (const auto& Param : InFunction.Params)
        {
            if (!ParamsStr.empty())
            {
                ParamsStr += ", ";
            }

            ParamsStr += Param.Type + " " + Param.Identifier;

            continue;
        }

        const std::string Sql = "INSERT OR IGNORE INTO Functions ("
                                "Identifier, Source, Line, Column, RBraceLine, RBraceColumn, bStatic, Params, Ret"
                                ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";

        sqlite3_stmt* Stmt = nullptr;
        if (sqlite3_prepare_v2(Db, Sql.c_str(), -1, &Stmt, nullptr) != SQLITE_OK)
        {
            llvm::errs() << "Failed to prepare statement: " << sqlite3_errmsg(Db) << "\n";
            llvm::errs().flush();
            PRIVATE_DCP_FAIL_BOILERPLATE()
            return;
        }

        sqlite3_bind_text(Stmt, 1, InFunction.Identifier.c_str(), -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(Stmt, 2, ToAbsolutePath(InFunction.Source).c_str(), -1, SQLITE_TRANSIENT);
        sqlite3_bind_int(Stmt,  3, InFunction.Line);
        sqlite3_bind_int(Stmt,  4, InFunction.Column);
        sqlite3_bind_int(Stmt,  5, InFunction.RBraceLine);
        sqlite3_bind_int(Stmt,  6, InFunction.RBraceColumn);
        sqlite3_bind_int(Stmt,  7, InFunction.bStatic ? 1 : 0);
        sqlite3_bind_text(Stmt, 8, ParamsStr.c_str(), -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(Stmt, 9, InFunction.Ret.c_str(), -1, SQLITE_TRANSIENT);

        ExecStmt(Stmt);
        sqlite3_finalize(Stmt);
    }

    for (const auto& Record : InFunction.Records)
    {
        const std::string Sql = "INSERT OR IGNORE INTO Refs ("
                                "Identifier, Source, Line, Column, Ref, bStrong"
                                ") VALUES ('" + InFunction.Identifier + "', '" + ToAbsolutePath(InFunction.Source) + "', " +
                                std::to_string(InFunction.Line) + ", " + std::to_string(InFunction.Column) + ", '" +
                                    Record.Ref + "', " + (Record.bStrong ? "1" : "0") + ") " +
                                "ON CONFLICT(Identifier, Source, Line, Column, Ref) DO UPDATE SET "
                                "bStrong = CASE"
                                "    WHEN excluded.bStrong = 1 AND Refs.bStrong = 0 THEN 1"
                                "    ELSE Refs.bStrong "
                                "END;";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL_CONTINUE()
    }

    for (const auto& Record : InFunction.Vars)
    {
        dcp_check( Record.bStrong == false )

        const std::string Sql = "INSERT OR IGNORE INTO Refs ("
                                "Identifier, Source, Line, Column, Type, Ref, bStrong"
                                ") VALUES ('" + InFunction.Identifier + "', '" + ToAbsolutePath(InFunction.Source) + "', " +
                                std::to_string(InFunction.Line) + ", " + std::to_string(InFunction.Column) + ", 'variable', '" +
                                    Record.Ref + "', 0);";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL_CONTINUE()
    }

    return;
}

void Dcp::PutToIntermediate(const MyFunctionRef& InFunctionRef)
{
    dcp_check( InFunctionRef.bStrong == false )

    const std::string Sql = "INSERT OR IGNORE INTO Refs ("
                            "Identifier, Source, Line, Column, Ref, bStrong"
                            ") VALUES ('" + InFunctionRef.Caller.Identifier + "', '" + ToAbsolutePath(InFunctionRef.Caller.Source) + "', " +
                            std::to_string(InFunctionRef.Caller.Line) + ", " + std::to_string(InFunctionRef.Caller.Column) + ", '" +
                                InFunctionRef.Ref + "', 0);";

    PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()

    return;
}

void Dcp::PutToIntermediate(const MyVariable& InVariable)
{
    MyDecl D;
    D.Identifier = InVariable.Identifier;
    D.Source = InVariable.Source;
    D.Line = InVariable.Line;
    D.Column = InVariable.Column;
    D.bStatic = InVariable.bStatic ? EDeclBool::True : EDeclBool::False;
    D.bExtern = InVariable.bExtern ? EDeclBool::True : EDeclBool::False;
    D.bDef = true;

    PutToIntermediate(D);

    if (!InVariable.Init.has_value())
    {
        const std::string Sql =
            "INSERT OR IGNORE INTO Variables ("
            "Identifier, Source, Line, Column, Type, bStatic, bExtern"
            ") VALUES ('" + InVariable.Identifier + "', '" + ToAbsolutePath(InVariable.Source) + "', " +
            std::to_string(InVariable.Line) + ", " + std::to_string(InVariable.Column) + ", '" +
            InVariable.Type + "', " + (InVariable.bStatic ? "1" : "0") + ", " +
            (InVariable.bExtern ? "1" : "0") + ");";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()
    }
    else
    {
        const std::string Sql =
            "INSERT OR IGNORE INTO Variables ("
            "Identifier, Source, Line, Column, Type, bStatic, bExtern, Init"
            ") VALUES (?, ?, ?, ?, ?, ?, ?, ?);";

        sqlite3_stmt* Stmt = nullptr;
        if (sqlite3_prepare_v2(Db, Sql.c_str(), -1, &Stmt, nullptr) != SQLITE_OK)
        {
            llvm::errs() << "Failed to prepare statement: " << sqlite3_errmsg(Db) << "\n";
            llvm::errs().flush();
            PRIVATE_DCP_FAIL_BOILERPLATE()
            return;
        }

        sqlite3_bind_text(Stmt, 1, InVariable.Identifier.c_str(), -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(Stmt, 2, ToAbsolutePath(InVariable.Source).c_str(), -1, SQLITE_TRANSIENT);
        sqlite3_bind_int(Stmt,  3, InVariable.Line);
        sqlite3_bind_int(Stmt,  4, InVariable.Column);
        sqlite3_bind_text(Stmt, 5, InVariable.Type.c_str(), -1, SQLITE_TRANSIENT);
        sqlite3_bind_int(Stmt,  6, InVariable.bStatic ? 1 : 0);
        sqlite3_bind_int(Stmt,  7, InVariable.bExtern ? 1 : 0);
        sqlite3_bind_text(Stmt, 8, InVariable.Init->c_str(), -1, SQLITE_TRANSIENT);

        ExecStmt(Stmt);
        sqlite3_finalize(Stmt);
    }

    return;
}

#undef PRIVATE_DCP_EXECUTE_TRIVIAL_SQL
#undef PRIVATE_DCP_EXECUTE_TRIVIAL_SQL_CONTINUE
