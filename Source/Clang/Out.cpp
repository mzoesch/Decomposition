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
    sqlite3_busy_timeout(Db, 50);

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

    // Typedefs
    {
        const char* Sql = "CREATE TABLE IF NOT EXISTS Typedefs ("
                          "Identifier TEXT NOT NULL,"
                          "Source TEXT NOT NULL,"
                          "Line INTEGER NOT NULL ,"
                          "Column INTEGER NOT NULL,"
                          "What TEXT,"
                          "Type TEXT,"
                          "bAnonymous INTEGER NOT NULL DEFAULT 0,"
                          "AnonymousBeginLine INTEGER,"
                          "AnonymousBeginColumn INTEGER,"
                          "PRIMARY KEY (Identifier, Source)"
                          ");";

        PRIVATE_DCP_REPORT_SQL_ERROR()
    }

    // Records
    {
        const char* Sql = "CREATE TABLE IF NOT EXISTS Records ("
                          "Identifier TEXT NOT NULL,"
                          "Source TEXT NOT NULL,"
                          "Line INTEGER NOT NULL,"
                          "Column INTEGER NOT NULL,"
                          "Type TEXT NOT NULL,"
                          "Enum TEXT,"
                          "PRIMARY KEY (Identifier, Source)"
                          ");";

        PRIVATE_DCP_REPORT_SQL_ERROR()
    }

    // Function Decls
    {
        const char* Sql = "CREATE TABLE IF NOT EXISTS FunctionDecls ("
                          "Identifier TEXT NOT NULL,"
                          "Source TEXT NOT NULL,"
                          "Line INTEGER NOT NULL,"
                          "Column INTEGER NOT NULL,"
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
                                 File.str() + "', '" + I.Path + "'," + std::to_string(I.Group) + ");";

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
                                    D.Identifier + "', '" + D.Source + "', " + std::to_string(D.Line) + ", '" +
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
    for (const auto& [Id, Ms] : Files)
    {
        for (const auto& M : Ms)
        {
            dcp_check( Id == M.Source )

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

                const char* Sql =
                    "INSERT OR IGNORE INTO Macros "
                    "(Identifier, Source, Line, Column, bFunctionLike, Definition, Params) "
                    "VALUES (?, ?, ?, ?, 1, ?, ?);";

                sqlite3_stmt* Stmt = nullptr;
                if (sqlite3_prepare_v2(Db, Sql, -1, &Stmt, nullptr) != SQLITE_OK)
                {
                    llvm::errs() << "Failed to prepare statement: " << sqlite3_errmsg(Db) << "\n";
                    return;
                }

                sqlite3_bind_text(Stmt, 1, M.Identifier.c_str(), -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(Stmt, 2, M.Source.c_str(), -1, SQLITE_TRANSIENT);
                sqlite3_bind_int(Stmt,  3, M.Line);
                sqlite3_bind_int(Stmt,  4, M.Column);
                sqlite3_bind_text(Stmt, 5, M.Definition.c_str(), -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(Stmt, 6, ParamsStr.c_str(), -1, SQLITE_TRANSIENT);

                ExecStmt(Stmt);
                sqlite3_finalize(Stmt);
            }
            else
            {
                dcp_check( M.Params.empty() )

                const std::string Sql = "INSERT OR IGNORE INTO Macros ("
                                        "Identifier, Source, Line, Column, bFunctionLike, Definition"
                                        ") VALUES (?, ?, ?, ?, 0, ?);";

                sqlite3_stmt* Stmt = nullptr;
                if (sqlite3_prepare_v2(Db, Sql.c_str(), -1, &Stmt, nullptr) != SQLITE_OK)
                {
                    llvm::errs() << "Failed to prepare statement: " << sqlite3_errmsg(Db) << "\n";
                    llvm::errs().flush();
                    PRIVATE_DCP_FAIL_BOILERPLATE()
                    return;
                }

                sqlite3_bind_text(Stmt, 1, M.Identifier.c_str(), -1, SQLITE_TRANSIENT);
                sqlite3_bind_text(Stmt, 2, M.Source.c_str(), -1, SQLITE_TRANSIENT);
                sqlite3_bind_int(Stmt,  3, M.Line);
                sqlite3_bind_int(Stmt,  4, M.Column);
                sqlite3_bind_text(Stmt, 5, M.Definition.c_str(), -1, SQLITE_TRANSIENT);

                ExecStmt(Stmt);
                sqlite3_finalize(Stmt);
            }

            continue;
        }

        continue;
    }

    return;
}

void Dcp::PutToIntermediate(const MyTypeDef& InTypeDef)
{
    if (InTypeDef.bComplex)
    {
        dcp_check( InTypeDef.What.empty() )

        const std::string Sql = "INSERT OR IGNORE INTO Typedefs ("
                                "Identifier, Source, Line, Column, Type, bAnonymous, AnonymousBeginLine, AnonymousBeginColumn"
                                ") VALUES ('" + InTypeDef.Identifier + "', '" + InTypeDef.Source + "', " +
                                std::to_string(InTypeDef.Line) + ", " + std::to_string(InTypeDef.Column) + ", '"
                                + InTypeDef.Type + "', 1, "
                                + std::to_string(InTypeDef.ComplexBeginLine) +
                                ", " + std::to_string(InTypeDef.ComplexBeginColumn) + ");";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()
    }
    else
    {
        {
            const std::string Sql = "INSERT OR IGNORE INTO Typedefs ("
                                    "Identifier, Source, Line, Column, What, bAnonymous"
                                    ") VALUES ('" + InTypeDef.Identifier + "', '" + InTypeDef.Source + "', " +
                                    std::to_string(InTypeDef.Line) + ", " + std::to_string(InTypeDef.Column) + ", '" +
                                    InTypeDef.What + "', 0);";

            PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()
        }

        if (!InTypeDef.Type.empty()) /* Non Trivial */
        {
            const std::string Sql = "INSERT OR IGNORE INTO Refs ("
                                    "Identifier, Source, Line, Column, Ref"
                                    ") VALUES ('" + InTypeDef.Identifier + "', '" + InTypeDef.Source + "', " +
                                    std::to_string(InTypeDef.Line) + ", " + std::to_string(InTypeDef.Column) + ", '" +
                                    InTypeDef.Type + "');";

            PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()
        }
    }

    for (const auto& R : InTypeDef.Records)
    {
        const std::string Sql = "INSERT OR IGNORE INTO Refs ("
                                "Identifier, Source, Line, Column, Ref"
                                ") VALUES ('" + InTypeDef.Identifier + "', '" + InTypeDef.Source + "', " +
                                std::to_string(InTypeDef.Line) + ", " + std::to_string(InTypeDef.Column) + ", '" +
                                R.Ref + "');";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL_CONTINUE()
    }

    return;
}


void Dcp::PutToIntermediate(const MyRecord& InRecord)
{
    {
        const std::string Sql = "INSERT OR IGNORE INTO Records ("
                                "Identifier, Source, Line, Column, Type"
                                ") VALUES ('" + InRecord.Identifier + "', '" + InRecord.Source + "', " +
                                std::to_string(InRecord.Line) + ", " + std::to_string(InRecord.Column) + ", '" +
                                InRecord.Type + "');";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()
    }

    for (const auto& R : InRecord.Records)
    {
        const std::string Sql = "INSERT OR IGNORE INTO Refs ("
                                "Identifier, Source, Line, Column, Ref"
                                ") VALUES ('" + InRecord.Identifier + "', '" + InRecord.Source + "', " +
                                std::to_string(InRecord.Line) + ", " + std::to_string(InRecord.Column) + ", '" +
                                R.Ref + "');";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL_CONTINUE()
    }

    return;
}

void Dcp::PutToIntermediate(const MyEnumRecord& InEnumRecord)
{
    dcp_check( InEnumRecord.Enum.has_value() )

    {
        const std::string Sql = "INSERT OR IGNORE INTO Records ("
                                "Identifier, Source, Line, Column, Type, Enum"
                                ") VALUES ('" + InEnumRecord.Identifier + "', '" + InEnumRecord.Source + "', " +
                                std::to_string(InEnumRecord.Line) + ", " + std::to_string(InEnumRecord.Column) + ", '" +
                                InEnumRecord.Type + "', '" + InEnumRecord.Enum.value() + "');";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()
    }

    for (const auto& R : InEnumRecord.Records)
    {
        const std::string Sql = "INSERT OR IGNORE INTO Refs ("
                                "Identifier, Source, Line, Column, Ref"
                                ") VALUES ('" + InEnumRecord.Identifier + "', '" + InEnumRecord.Source + "', " +
                                std::to_string(InEnumRecord.Line) + ", " + std::to_string(InEnumRecord.Column) + ", '" +
                                R.Ref + "');";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL_CONTINUE()
    }

    return;
}

void Dcp::PutToIntermediate(const MyFunctionDecl& InFunction)
{
    const std::string Sql = "INSERT OR IGNORE INTO FunctionDecls ("
                            "Identifier, Source, Line, Column"
                            ") VALUES ('" + InFunction.Identifier + "', '" + InFunction.Source + "', " +
                            std::to_string(InFunction.Line) + ", " + std::to_string(InFunction.Column) + ");";

    PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()

    return;
}

void Dcp::PutToIntermediate(const MyFunction& InFunction)
{
    PutToIntermediate(static_cast<MyFunctionDecl>(InFunction));

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
                                "Identifier, Source, Line, Column, bStatic, Params, Ret"
                                ") VALUES (?, ?, ?, ?, ?, ?, ?);";

        sqlite3_stmt* Stmt = nullptr;
        if (sqlite3_prepare_v2(Db, Sql.c_str(), -1, &Stmt, nullptr) != SQLITE_OK)
        {
            llvm::errs() << "Failed to prepare statement: " << sqlite3_errmsg(Db) << "\n";
            llvm::errs().flush();
            PRIVATE_DCP_FAIL_BOILERPLATE()
            return;
        }

        sqlite3_bind_text(Stmt, 1, InFunction.Identifier.c_str(), -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(Stmt, 2, InFunction.Source.c_str(), -1, SQLITE_TRANSIENT);
        sqlite3_bind_int(Stmt,  3, InFunction.Line);
        sqlite3_bind_int(Stmt,  4, InFunction.Column);
        sqlite3_bind_int(Stmt,  5, InFunction.bStatic ? 1 : 0);
        sqlite3_bind_text(Stmt, 6, ParamsStr.c_str(), -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(Stmt, 7, InFunction.Ret.c_str(), -1, SQLITE_TRANSIENT);

        ExecStmt(Stmt);
        sqlite3_finalize(Stmt);
    }

    for (const auto& Record : InFunction.Records)
    {
        const std::string Sql = "INSERT OR IGNORE INTO Refs ("
                                "Identifier, Source, Line, Column, Ref"
                                ") VALUES ('" + InFunction.Identifier + "', '" + InFunction.Source + "', " +
                                std::to_string(InFunction.Line) + ", " + std::to_string(InFunction.Column) + ", '" +
                                Record.Ref + "');";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL_CONTINUE()
    }

    for (const auto& Record : InFunction.Vars)
    {
        const std::string Sql = "INSERT OR IGNORE INTO Refs ("
                                "Identifier, Source, Line, Column, Type, Ref"
                                ") VALUES ('" + InFunction.Identifier + "', '" + InFunction.Source + "', " +
                                std::to_string(InFunction.Line) + ", " + std::to_string(InFunction.Column) + ", 'variable', '" +
                                Record.Ref + "');";

        PRIVATE_DCP_EXECUTE_TRIVIAL_SQL_CONTINUE()
    }

    return;
}

void Dcp::PutToIntermediate(const MyFunctionRef& InFunctionRef)
{
    const std::string Sql = "INSERT OR IGNORE INTO Refs ("
                            "Identifier, Source, Line, Column, Ref"
                            ") VALUES ('" + InFunctionRef.Caller.Identifier + "', '" + InFunctionRef.Caller.Source + "', " +
                            std::to_string(InFunctionRef.Caller.Line) + ", " + std::to_string(InFunctionRef.Caller.Column) + ", '" +
                            InFunctionRef.Ref + "');";

    PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()

    return;
}

void Dcp::PutToIntermediate(const MyVariableDecl& InVariable)
{
    const std::string Sql = "INSERT OR IGNORE INTO Variables ("
                            "Identifier, Source, Line, Column, Type, bStatic, bExtern"
                            ") VALUES ('" + InVariable.Identifier + "', '" + InVariable.Source + "', " +
                            std::to_string(InVariable.Line) + ", " + std::to_string(InVariable.Column) + ", '" +
                            InVariable.Type + "', " + (InVariable.bStatic ? "1" : "0") + ", " +
                            (InVariable.bExtern ? "1" : "0") + ");";

    PRIVATE_DCP_EXECUTE_TRIVIAL_SQL()

    return;
}

void Dcp::PutToIntermediate(const MyVariable& InVariable)
{
    PutToIntermediate(static_cast<MyVariableDecl>(InVariable));

    return;
}

#undef PRIVATE_DCP_EXECUTE_TRIVIAL_SQL
#undef PRIVATE_DCP_EXECUTE_TRIVIAL_SQL_CONTINUE
