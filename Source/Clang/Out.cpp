#include "Out.h"
#include "MyXCompiler.h"
#include "Symbols.h"
#include "Consumer.h"
#include "json_nlohmann.h"
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/Error.h>
#include <filesystem>
#include <fstream>
#include <mutex>
#include <clang/AST/ExprObjC.h>

namespace fs = std::filesystem;
using json = nlohmann::json;

namespace
{

std::string GetIRFilePath()
{
    dcp_check( Dcp::IrPath.empty() == false )
    return Dcp::IrPath + "/IR.json";
}

void CreateRecursiveParentDirectories(const std::string& FileName)
{
    const fs::path Path = fs::absolute(FileName);

    if (const fs::path ParentPath = Path.parent_path(); fs::exists(ParentPath) == false)
    {
        fs::create_directories(ParentPath);
    }

    return;
}

void EnsureIRFile()
{
    const std::string IRFile = GetIRFilePath();
    ::CreateRecursiveParentDirectories(IRFile);

    if (fs::exists(IRFile) == false)
    {
#if DCP_IN_DEBUG
        llvm::outs() << "Creating file: " << IRFile << "\n";
#endif /* DCP_IN_DEBUG */

        std::ofstream Out(IRFile, std::ios::out | std::ios::trunc);
        dcp_check( !!Out )

        Out << std::setw(4) << json::object() << std::endl;

        Out.close();
    }

    return;
}

struct LocalCache
{
    LocalCache()
    {
    }

    ~LocalCache()
    {
        dcp_check( this->Mutex.try_lock() )

        std::ofstream Out(GetIRFilePath());
        dcp_check( !!Out )

        Out << std::setw(4) << *this->Handle << std::endl;
        Out.close();

        return;
    }

    void Initialize()
    {
        dcp_check( this->Handle == nullptr )

        EnsureIRFile();

        std::ifstream In(GetIRFilePath());
        dcp_check( !!In )

        std::unique_ptr<json> IR(new json());
        In >> *IR;
        In.close();

        auto& J = *IR;

        if (J.contains("Files"))
        {
            dcp_check( J["Files"].is_array() )
        }
        else
        {
            J["Files"] = json::array();
        }

        this->Handle = std::move(IR);

        return;
    }

    std::mutex Mutex;
    std::unique_ptr<json> Handle;
};
LocalCache LocalCacheInstance;

struct IrOut
{
    IrOut()
    {
        bIsLock = true;
        LocalCacheInstance.Mutex.lock();
    };
    ~IrOut()
    {
        if (bIsLock)
        {
            LocalCacheInstance.Mutex.unlock();
        }
    }

    void Lock()
    {
        if (this->bIsLock == false)
        {
            LocalCacheInstance.Mutex.lock();
            this->bIsLock = true;
        }

        return;
    }

    void Unlock()
    {
        if (this->bIsLock)
        {
            LocalCacheInstance.Mutex.unlock();
        }

        return;
    }

    json& GetHandle()
    {
        return *LocalCacheInstance.Handle;
    }

private:

    bool bIsLock { false };
};

json& GetOrMakeObjectHandle(json* J, const std::string_view& Key, const std::string_view& Value)
{
    for (auto& Entry : (*J))
    {
        if (Entry[Key] == Value)
        {
            return Entry;
        }

        continue;
    }

    auto& Entry = J->emplace_back(json::object());
    Entry[Key] = Value;
    return Entry;
}

const json* GetArrayObject(const json& J, const std::string_view& Key, const std::string_view& Value)
{
    for (auto& Entry : J)
    {
        if (Entry[Key] == Value)
        {
            return &Entry;
        }

        continue;
    }

    return nullptr;
}

json* GetArrayObject(json& J, const std::string_view& Key, const std::string_view& Value)
{
    for (auto& Entry : J)
    {
        if (Entry[Key] == Value)
        {
            return &Entry;
        }

        continue;
    }

    return nullptr;
}

const json* GetArrayObjectDouble(const json& J,
    const std::string_view& Ak, const std::string_view& Av,
    const std::string_view& Bk, const std::string_view& Bv
    )
{
    for (auto& Entry : J)
    {
        if (Entry[Ak] == Av && Entry[Bk] == Bv)
        {
            return &Entry;
        }

        continue;
    }

    return nullptr;
}

json* GetArrayObjectDouble(json& J,
    const std::string_view& Ak, const std::string_view& Av,
    const std::string_view& Bk, const std::string_view& Bv
    )
{
    for (auto& Entry : J)
    {
        if (Entry[Ak] == Av && Entry[Bk] == Bv)
        {
            return &Entry;
        }

        continue;
    }

    return nullptr;
}

const json* GetArrayObjectChecked(const json& J, const std::string_view& Key, const std::string_view& Value)
{
    const json* Out = GetArrayObject(J, Key, Value);
    dcp_check( Out )
    return Out;
}

json* GetArrayObjectChecked(json& J, const std::string_view& Key, const std::string_view& Value)
{
    json* Out = GetArrayObject(J, Key, Value);
    dcp_check( Out )
    return Out;
}

const json* GetArrayObjectDoubleChecked(const json& J,
    const std::string_view& Ak, const std::string_view& Av,
    const std::string_view& Bk, const std::string_view& Bv
    )
{
    const json* Out = GetArrayObjectDouble(J, Ak, Av, Bk, Bv);
    dcp_check( Out )
    return Out;
}

json* GetArrayObjectDoubleChecked(json& J,
    const std::string_view& Ak, const std::string_view& Av,
    const std::string_view& Bk, const std::string_view& Bv
    )
{
    json* Out = GetArrayObjectDouble(J, Ak, Av, Bk, Bv);
    dcp_check( Out )
    return Out;
}

bool ArrayContainsObject(const json& J, const std::string_view& Key, const std::string_view& Value)
{
    return GetArrayObject(J, Key, Value) != nullptr;
}

bool ArrayContainsObjectDouble(const json& J,
    const std::string_view& Ak, const std::string_view& Av,
    const std::string_view& Bk, const std::string_view& Bv
    )
{
    return GetArrayObjectDouble(J, Ak, Av, Bk, Bv) != nullptr;
}

} /* ~Namespace <Anonymous> */

void Dcp::InitializeOutStream()
{
    ::LocalCacheInstance.Initialize();

    return;
}

void Dcp::PutToIntermediate(const llvm::StringRef& File, const std::vector<MyXCompilerInclude>& Include)
{
    IrOut Out;
    auto& J = Out.GetHandle();
    json& FileHandle = GetOrMakeObjectHandle(&J["Files"], "Identifier", File);

    for (auto& IncludeEntry : Include)
    {
        if (ArrayContainsObject(FileHandle["XIncludes"], "Path", IncludeEntry.Path))
        {
            continue;
        }

        json IncludeEntryJson = json::object();
        IncludeEntryJson["Path"] = IncludeEntry.Path;
        IncludeEntryJson["Group"] = IncludeEntry.Group;
        FileHandle["XIncludes"].emplace_back(std::move(IncludeEntryJson));

        continue;
    }

    return;
}

void Dcp::PutToIntermediate(const std::map<std::string, std::vector<MyIncludeDirective>>& Files)
{
    IrOut Out;
    auto& J = Out.GetHandle();

    for (const auto& [File, Directives] : Files)
    {
        json& FileHandle = GetOrMakeObjectHandle(&J["Files"], "Identifier", File);

        for (const MyIncludeDirective& Directive : Directives)
        {
            Directive.ExpandAndFollowSourceLocation();

            dcp_check( File == Directive.Source )
            if (ArrayContainsObject(FileHandle["Includes"], "Identifier", Directive.Identifier))
            {
                continue;
            }

            json IncludeEntry = json::object();
            IncludeEntry["Identifier"] = Directive.Identifier;
            IncludeEntry["ModuleHeader"] = IsModuleHeader(Directive.Identifier);
            IncludeEntry["Line"] = Directive.Line;
            IncludeEntry["Column"] = Directive.Column;
            IncludeEntry["Native"] = Directive.Native;
            FileHandle["Includes"].emplace_back(std::move(IncludeEntry));

            continue;
        }

        continue;
    }

    return;
}

void Dcp::PutToIntermediate(const std::map<std::string, std::vector<MyMacroInfo>>& Files)
{
    IrOut Out;
    auto& J = Out.GetHandle();

    for (const auto& [File, Macros] : Files)
    {
        json& FileHandle = GetOrMakeObjectHandle(&J["Files"], "Identifier", File);

        for (const MyMacroInfo& Macro : Macros)
        {
            Macro.ExpandAndFollowSourceLocation();

            dcp_check( File == Macro.Source )
            if (ArrayContainsObject(FileHandle["Macros"], "Identifier", Macro.Identifier))
            {
                continue;
            }

            json MacroEntry = json::object();
            MacroEntry["Identifier"] = Macro.Identifier;
            MacroEntry["Line"] = Macro.Line;
            MacroEntry["Column"] = Macro.Column;
            MacroEntry["bFunctionLike"] = Macro.bFunctionLike;
            MacroEntry["Params"] = json::array();
            for (const auto& Param : Macro.Params)
            {
                MacroEntry["Params"].emplace_back(Param);
            }
            MacroEntry["Definition"] = Macro.Definition;
            FileHandle["Macros"].emplace_back(std::move(MacroEntry));

            continue;
        }

        continue;
    }

    for (const auto& [File, Macros] : Files)
    {
        json& FileHandle = GetOrMakeObjectHandle(&J["Files"], "Identifier", File);

        for (const MyMacroInfo& Macro : Macros)
        {
            Macro.ExpandAndFollowSourceLocation();

            dcp_check( File == Macro.Source )
            if (ArrayContainsObject(FileHandle["SeenMacros"], "Identifier", Macro.Identifier))
            {
                continue;
            }

            json MacroEntry = json::object();
            MacroEntry["Identifier"] = Macro.Identifier;
            MacroEntry["Line"] = Macro.Line;
            MacroEntry["Column"] = Macro.Column;
            MacroEntry["bFunctionLike"] = Macro.bFunctionLike;
            MacroEntry["Params"] = json::array();
            for (const auto& Param : Macro.Params)
            {
                MacroEntry["Params"].emplace_back(Param);
            }
            MacroEntry["Definition"] = Macro.Definition;
            FileHandle["SeenMacros"].emplace_back(std::move(MacroEntry));

            continue;
        }

        continue;
    }

    std::vector<MyMacroInfo> SeenMacros;
    for (const auto& [_, Macros] : Files)
    {
        for (const MyMacroInfo& Macro : Macros)
        {
            bool bFound = false;

            for (const MyMacroInfo& SeenMacro : SeenMacros)
            {
                if (SeenMacro.Identifier == Macro.Identifier)
                {
#if DCP_IN_DEBUG
                    if (SeenMacro.Definition != Macro.Definition)
                    {
                        llvm::outs() << "WARNING: Macro Missmatch of [" << SeenMacro.Definition << "].\n";
                    }
#endif /* !DCP_IN_DEBUG */
                    bFound = true;
                    break;
                }

                continue;
            }

            if (bFound == false)
            {
                SeenMacros.emplace_back(Macro);
            }

            continue;
        }

        continue;
    }

    for (const auto& [File, _] : Files)
    {
        json& FileHandle = GetOrMakeObjectHandle(&J["Files"], "Identifier", File);

        for (const MyMacroInfo& Macro : SeenMacros)
        {
            if (ArrayContainsObject(FileHandle["SeenMacros"], "Identifier", Macro.Identifier))
            {
                continue;
            }

            json MacroEntry = json::object();
            MacroEntry["Identifier"] = Macro.Identifier;
            MacroEntry["Line"] = -1; /* It's a foreign macro, so keeping the line makes no sense. */
            MacroEntry["Column"] = -1;
            MacroEntry["bFunctionLike"] = Macro.bFunctionLike;
            MacroEntry["Params"] = json::array();
            for (const auto& Param : Macro.Params)
            {
                MacroEntry["Params"].emplace_back(Param);
            }
            MacroEntry["Definition"] = Macro.Definition;

            FileHandle["SeenMacros"].emplace_back(std::move(MacroEntry));
        }

        continue;
    }

    return;
}

void Dcp::PutToIntermediate(const MyTypeDef& InTypeDef)
{
    InTypeDef.ExpandAndFollowSourceLocation();

    IrOut Out;
    auto& J = Out.GetHandle();

    if (const json* Obj = GetArrayObject(J["Typedefs"], "Identifier", InTypeDef.Identifier); Obj)
    {
#if DCP_DO_OUT_CHECKS
        dcp_check( Obj->operator[]("Source")  == InTypeDef.Source   )
        dcp_check( Obj->operator[]("Line")    == InTypeDef.Line     )
        dcp_check( Obj->operator[]("Column")  == InTypeDef.Column   )
        dcp_check( Obj->operator[]("What")    == InTypeDef.What     )

        if (InTypeDef.bComplex)
        {
            dcp_check( Obj->operator[]("Complex")            == InTypeDef.bComplex           )
            dcp_check( Obj->operator[]("ComplexBeginLine")   == InTypeDef.ComplexBeginLine   )
            dcp_check( Obj->operator[]("ComplexBeginColumn") == InTypeDef.ComplexBeginColumn )
        }

        if (InTypeDef.Type.empty())
        {
            dcp_check( Obj->operator[]("Type")== nullptr )
        }
        else
        {
            dcp_check( Obj->operator[]("Type") == InTypeDef.Type )
        }
#endif /* DCP_DO_OUT_CHECKS */

        return;
    }

    json TypeDefEntry = json::object();
    TypeDefEntry["Identifier"] = InTypeDef.Identifier;
    TypeDefEntry["Source"] = InTypeDef.Source;
    TypeDefEntry["Line"] = InTypeDef.Line;
    TypeDefEntry["Column"] = InTypeDef.Column;
    TypeDefEntry["What"] = InTypeDef.What;
    if (InTypeDef.Type.empty())
    {
        TypeDefEntry["Type"] = nullptr;
    }
    else
    {
        TypeDefEntry["Type"] = InTypeDef.Type;
    }
    TypeDefEntry["Records"] = json::array();
    for (const auto& Record : InTypeDef.Records)
    {
        json RecordEntry = json::object();
        RecordEntry["Identifier"] = Record.Ref;
        TypeDefEntry["Records"].emplace_back(std::move(RecordEntry));
        continue;
    }
    TypeDefEntry["Complex"] = InTypeDef.bComplex;
    if (InTypeDef.bComplex)
    {
        TypeDefEntry["ComplexBeginLine"]   = InTypeDef.ComplexBeginLine;
        TypeDefEntry["ComplexBeginColumn"] = InTypeDef.ComplexBeginColumn;
        if (InTypeDef.ComplexTypeRef.has_value())
        {
            TypeDefEntry["ComplexTypeDecl"] = json::object();
            json& Ctd = TypeDefEntry["ComplexTypeDecl"];
            const MyRecord& Value = InTypeDef.ComplexTypeRef.value();
            Ctd["Identifier"] = Value.Identifier;
            Ctd["Source"] = Value.Source;
            Ctd["Line"] = Value.Line;
            Ctd["Column"] = Value.Column;
            Ctd["Type"] = Value.Type;
            Ctd["Records"] = json::array();
            Ctd["Enum"] = nullptr;
            for (const auto& Record : Value.Records)
            {
                json RecordEntry = json::object();
                RecordEntry["Identifier"] = Record.Ref;
                Ctd["Records"].emplace_back(std::move(RecordEntry));
                continue;
            }
        }
    }
    J["Typedefs"].emplace_back(std::move(TypeDefEntry));

    return;
}

void Dcp::PutToIntermediate(const MyRecord& InRecord)
{
    InRecord.ExpandAndFollowSourceLocation();

    IrOut Out;
    auto& J { Out.GetHandle() };

    if (json* Obj { ::GetArrayObject(J["Records"], "Identifier", InRecord.Identifier) }; Obj)
    {
#if DCP_DO_OUT_CHECKS
        dcp_check( Obj->operator[]("Source") == InRecord.Source )
        dcp_check( Obj->operator[]("Line")   == InRecord.Line   )
        dcp_check( Obj->operator[]("Column") == InRecord.Column )
        dcp_check( Obj->operator[]("Type")   == InRecord.Type )
        dcp_check( Obj->operator[]("Records").is_array() )
#endif /* DCP_DO_OUT_CHECKS */

        for (const MyRecordRef& R : InRecord.Records)
        {
            if (::ArrayContainsObject(Obj->operator[]("Records"), "Identifier", R.Ref))
            {
                continue;
            }

            json Entry = json::object();
            Entry["Identifier"] = R.Ref;
            Obj->operator[]("Records").emplace_back(std::move(Entry));
            continue;
        }

        return;
    }

    json Entry = json::object();
    Entry["Identifier"] = InRecord.Identifier;
    Entry["Source"] = InRecord.Source;
    Entry["Line"] = InRecord.Line;
    Entry["Column"] = InRecord.Column;
    Entry["Type"] = InRecord.Type;
    Entry["Records"] = json::array();
    Entry["Enum"] = nullptr;
    for (const auto& Record : InRecord.Records)
    {
        json RecordEntry = json::object();
        RecordEntry["Identifier"] = Record.Ref;
        Entry["Records"].emplace_back(std::move(RecordEntry));
        continue;
    }

    J["Records"].emplace_back(std::move(Entry));

    return;
}

void Dcp::PutToIntermediate(const MyEnumRecord& InEnumRecord)
{
    InEnumRecord.ExpandAndFollowSourceLocation();

    PutToIntermediate(static_cast<const MyRecord&>(InEnumRecord));

    IrOut Out;
    auto& J = Out.GetHandle();
    json* Obj = GetArrayObjectChecked(J["Records"], "Identifier", InEnumRecord.Identifier);

    if (InEnumRecord.Enum.has_value())
    {
        if (Obj->contains("Enum") == false)
        {
            Obj->operator[]("Enum") = InEnumRecord.Enum.value();
        }
        else if (Obj->operator[]("Enum").is_null())
        {
            Obj->operator[]("Enum") = InEnumRecord.Enum.value();
        }
#if DCP_DO_OUT_CHECKS
        else
        {
            dcp_check( Obj->operator[]("Enum").is_string() )
            dcp_check( Obj->operator[]("Enum") == InEnumRecord.Enum.value() )
        }
#endif /* DCP_DO_OUT_CHECKS */
    }
    else
    {
        if (Obj->contains("Enum") == false)
        {
            Obj->operator[]("Enum") = nullptr;
        }
#if DCP_DO_OUT_CHECKS
        else if (Obj->operator[]("Enum").is_null() == false)
        {
            dcp_check( Obj->operator[]("Enum").is_null() )
        }
#endif /* DCP_DO_OUT_CHECKS */
    }

    return;
}

void Dcp::PutToIntermediate(const MyFunctionForward& InFunction)
{
    InFunction.ExpandAndFollowSourceLocation();

    IrOut Out;
    json& J = Out.GetHandle();

    if (const json* Obj = GetArrayObject(J["Functions"], "Identifier", InFunction.Identifier); Obj)
    {
#if DCP_DO_OUT_CHECKS
        dcp_check( Obj->operator[]("Source") == InFunction.Source )
        dcp_check( Obj->operator[]("Line")   == InFunction.Line   )
        dcp_check( Obj->operator[]("Column") == InFunction.Column )
#endif /* DCP_DO_OUT_CHECKS */

        return;
    }

    json Entry = json::object();
    Entry["Identifier"] = InFunction.Identifier;
    Entry["Source"] = InFunction.Source;
    Entry["Line"] = InFunction.Line;
    Entry["Column"] = InFunction.Column;

    J["Functions"].emplace_back(std::move(Entry));

    return;
}

void Dcp::PutToIntermediate(const MyFunction& InFunction)
{
    InFunction.ExpandAndFollowSourceLocation();

    IrOut Out;
    json& J = Out.GetHandle();

    if (json* Obj = GetArrayObject(J["Functions"], "Identifier", InFunction.Identifier); Obj)
    {
        if (Obj->contains("Source") == false)
        {
            Obj->operator[]("Source") = InFunction.Source;
        }
        else if (Obj->operator[]("Source").is_null())
        {
            Obj->operator[]("Source") = InFunction.Source;
        }
#if DCP_DO_OUT_CHECKS
        else
        {
            dcp_check( Obj->operator[]("Source").is_string() )
            dcp_check( Obj->operator[]("Source") == InFunction.Source )
        }
#endif /* DCP_DO_OUT_CHECKS */

        if (Obj->contains("Line") == false)
        {
            Obj->operator[]("Line") = InFunction.Line;
        }
        else if (Obj->operator[]("Line").is_null())
        {
            Obj->operator[]("Line") = InFunction.Line;
        }
#if DCP_DO_OUT_CHECKS
        else
        {
            dcp_check( Obj->operator[]("Line").is_number_integer() )
            dcp_check( Obj->operator[]("Line") == InFunction.Line )
        }
#endif /* DCP_DO_OUT_CHECKS */

        if (Obj->contains("Column") == false)
        {
            Obj->operator[]("Column") = InFunction.Column;
        }
        else if (Obj->operator[]("Column").is_null())
        {
            Obj->operator[]("Column") = InFunction.Column;
        }
#if DCP_DO_OUT_CHECKS
        else
        {
            dcp_check( Obj->operator[]("Column").is_number_integer() )
            dcp_check( Obj->operator[]("Column") == InFunction.Column )
        }
#endif /* DCP_DO_OUT_CHECKS */

        if (Obj->contains("Ret") == false)
        {
            Obj->operator[]("Ret") = InFunction.Ret;
        }
#if DCP_DO_OUT_CHECKS
        else
        {
            dcp_check( Obj->operator[]("Ret") == InFunction.Ret )
        }
#endif /* DCP_DO_OUT_CHECKS */

        if (Obj->contains("Params") == false)
        {
            Obj->operator[]("Params") = json::array();
        }
#if DCP_DO_OUT_CHECKS
        else
        {
            dcp_check( Obj->operator[]("Params").is_array() )
        }
#endif /* DCP_DO_OUT_CHECKS */

        if (Obj->operator[]("Params").empty())
        {
            for (const auto& Param : InFunction.Params)
            {
                json ParamEntry = json::object();
                ParamEntry["Identifier"] = Param.Identifier;
                ParamEntry["Type"] = Param.Type;
                Obj->operator[]("Params").emplace_back(std::move(ParamEntry));
            }
        }
#if DCP_DO_OUT_CHECKS
        else
        {
            dcp_check( Obj->operator[]("Params").size() == InFunction.Params.size() )
            for (size_t i = 0; i < InFunction.Params.size(); ++i)
            {
                dcp_check( Obj->operator[]("Params")[i]["Identifier"] == InFunction.Params[i].Identifier )
                dcp_check( Obj->operator[]("Params")[i]["Type"]       == InFunction.Params[i].Type       )
            }
        }
#endif /* DCP_DO_OUT_CHECKS */

        if (Obj->contains("bStatic") == false)
        {
            Obj->operator[]("bStatic") = InFunction.bStatic;
        }
#if DCP_DO_OUT_CHECKS
        else
        {
            dcp_check( Obj->operator[]("bStatic") == InFunction.bStatic )
        }
#endif /* DCP_DO_OUT_CHECKS */

        if (Obj->contains("Decls") == false)
        {
            Obj->operator[]("Decls") = json::array();
        }
#if DCP_DO_OUT_CHECKS
        else
        {
            dcp_check( Obj->operator[]("Decls").is_array() )
        }
#endif /* DCP_DO_OUT_CHECKS */

        if (Obj->contains("Callees") == false)
        {
            Obj->operator[]("Callees") = json::array();
        }
#if DCP_DO_OUT_CHECKS
        else
        {
            dcp_check( Obj->operator[]("Callees").is_array() )
        }
#endif /* DCP_DO_OUT_CHECKS */

        if (Obj->contains("Records") == false)
        {
            Obj->operator[]("Records") = json::array();
        }
#if DCP_DO_OUT_CHECKS
        else
        {
            dcp_check( Obj->operator[]("Records").is_array() )
        }
#endif /* DCP_DO_OUT_CHECKS */

        if (Obj->operator[]("Records").empty())
        {
            for (const MyRecordRef& Record : InFunction.Records)
            {
                json RecordEntry = json::object();
                RecordEntry["Identifier"] = Record.Ref;
                Obj->operator[]("Records").emplace_back(std::move(RecordEntry));
            }
        }
#if DCP_DO_OUT_CHECKS
        else
        {
            dcp_check( Obj->operator[]("Records").size() == InFunction.Records.size() )
            for (size_t i = 0; i < InFunction.Records.size(); ++i)
            {
                dcp_check( Obj->operator[]("Records")[i]["Identifier"] == InFunction.Records[i].Ref )
            }
        }
#endif /* DCP_DO_OUT_CHECKS */

        if (Obj->contains("VarRefs") == false)
        {
            Obj->operator[]("VarRefs") = json::array();
        }
#if DCP_DO_OUT_CHECKS
        else
        {
            dcp_check( Obj->operator[]("VarRefs").is_array() )
        }
#endif /* DCP_DO_OUT_CHECKS */

        if (Obj->operator[]("VarRefs").empty())
        {
            for (const MyVarRef& Var : InFunction.Vars)
            {
                json VarEntry = json::object();
                VarEntry["Identifier"] = Var.Ref;
                VarEntry["Type"] = Var.Type;
                Obj->operator[]("VarRefs").emplace_back(std::move(VarEntry));
            }
        }
#if DCP_DO_OUT_CHECKS
        else
        {
            dcp_check( Obj->operator[]("VarRefs").size() == InFunction.Vars.size() )
            for (size_t i = 0; i < InFunction.Vars.size(); ++i)
            {
                dcp_check( Obj->operator[]("VarRefs")[i]["Identifier"] == InFunction.Vars[i].Ref )
                dcp_check( Obj->operator[]("VarRefs")[i]["Type"] == InFunction.Vars[i].Type )
            }
        }
#endif /* DCP_DO_OUT_CHECKS */

        return;
    }

    json Entry = json::object();
    Entry["Identifier"] = InFunction.Identifier;
    Entry["Source"] = InFunction.Source;
    Entry["Line"] = InFunction.Line;
    Entry["Column"] = InFunction.Column;
    Entry["Ret"] = InFunction.Ret;
    Entry["bStatic"] = InFunction.bStatic;
    Entry["Decls"] = json::array();
    Entry["Params"] = json::array();
    for (const auto& Param : InFunction.Params)
    {
        json ParamEntry = json::object();
        ParamEntry["Identifier"] = Param.Identifier;
        ParamEntry["Type"] = Param.Type;
        Entry["Params"].emplace_back(std::move(ParamEntry));
    }
    Entry["Callees"] = json::array();
    Entry["Records"] = json::array();
    for (const auto& Record : InFunction.Records)
    {
        json RecordEntry = json::object();
        RecordEntry["Identifier"] = Record.Ref;
        Entry["Records"].emplace_back(std::move(RecordEntry));
    }
    Entry["VarRefs"] = json::array();
    for (const auto& Var : InFunction.Vars)
    {
        json VarEntry = json::object();
        VarEntry["Identifier"] = Var.Ref;
        VarEntry["Type"] = Var.Type;
        Entry["VarRefs"].emplace_back(std::move(VarEntry));
    }

    J["Functions"].emplace_back(std::move(Entry));

    return;
}

void Dcp::PutToIntermediate(const MyFunctionDecl& InFunction)
{
    InFunction.ExpandAndFollowSourceLocation();

    IrOut Out;
    json& J = Out.GetHandle();

    if (json* Obj = GetArrayObject(J["Functions"], "Identifier", InFunction.Identifier); Obj)
    {
        if (Obj->contains("Decls") == false)
        {
            Obj->operator[]("Decls") = json::array();
        }
#if DCP_DO_OUT_CHECKS
        else
        {
            dcp_check( Obj->operator[]("Decls").is_array() )
        }
#endif /* DCP_DO_OUT_CHECKS */

        if
        (
            ArrayContainsObjectDouble
            (
                Obj->operator[]("Decls"),
                "Line", std::to_string(InFunction.Line),
                "Source", InFunction.Source
            ) == false
        )
        {
            json DeclEntry = json::object();
            DeclEntry["Source"] = InFunction.Source;
            DeclEntry["Line"] = InFunction.Line;
            DeclEntry["Column"] = InFunction.Column;
            Obj->operator[]("Decls").emplace_back(std::move(DeclEntry));
        }

        return;
    }

    json Entry = json::object();
    Entry["Identifier"] = InFunction.Identifier;
    J["Functions"].emplace_back(std::move(Entry));

    Out.Unlock();

    PutToIntermediate(InFunction);

    return;
}

void Dcp::PutToIntermediate(const MyFunctionRef& InFunctionRef)
{
    InFunctionRef.Caller.ExpandAndFollowSourceLocation();

    IrOut Out;
    auto& J = Out.GetHandle();

    json* Caller = nullptr;

    if (Caller = GetArrayObject(J["Functions"], "Identifier", InFunctionRef.Caller.Identifier); Caller)
    {
#if DCP_DO_OUT_CHECKS
        dcp_check( Caller->operator[]("Source") == InFunctionRef.Caller.Source )
        dcp_check( Caller->operator[]("Line")   == InFunctionRef.Caller.Line   )
        dcp_check( Caller->operator[]("Column") == InFunctionRef.Caller.Column )
#endif /* DCP_DO_OUT_CHECKS */
    }
    else
    {
        Out.Unlock();
        PutToIntermediate(InFunctionRef.Caller);
        PutToIntermediate(InFunctionRef);
        return;
    }
    dcp_check( Caller )

    GetOrMakeObjectHandle(&(*Caller)["Callees"], "Identifier", InFunctionRef.Ref);

    return;
}
