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
    return "Saved/IR.json";
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
        llvm::outs() << "Creating file: " << IRFile << "\n";
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

    ~LocalCache()
    {
        dcp_check( this->Mutex.try_lock() )

        std::ofstream Out(GetIRFilePath());
        dcp_check( !!Out )

        Out << std::setw(4) << *this->Handle << std::endl;
        Out.close();

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
        LocalCacheInstance.Mutex.lock();
    };
    ~IrOut()
    {
        LocalCacheInstance.Mutex.unlock();
    }

    json& GetHandle()
    {
        return *LocalCacheInstance.Handle;
    }
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


bool ArrayContainsObject(const json& J, const std::string_view& Key, const std::string_view& Value)
{
    return GetArrayObject(J, Key, Value) != nullptr;
}

} /* ~Namespace <Anonymous> */

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

void Dcp::PutToIntermediate(const MyTypeDef& InTypeDef)
{
    IrOut Out;
    auto& J = Out.GetHandle();

    if (const json* Obj = GetArrayObject(J["Typedefs"], "Identifier", InTypeDef.Identifier); Obj)
    {
        dcp_check( Obj->operator[]("Source") == InTypeDef.Source )
        dcp_check( Obj->operator[]("Line")   == InTypeDef.Line   )
        dcp_check( Obj->operator[]("Column") == InTypeDef.Column )
        dcp_check( Obj->operator[]("What")   == InTypeDef.What   )

        if (InTypeDef.Type.empty())
        {
            dcp_check( Obj->operator[]("Type")== nullptr )
        }
        else
        {
            dcp_check( Obj->operator[]("Type") == InTypeDef.Type )
        }

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
    J["Typedefs"].emplace_back(std::move(TypeDefEntry));

    return;
}

void Dcp::PutToIntermediate(const MyRecord& InRecord)
{
    IrOut Out;
    auto& J = Out.GetHandle();

    if (const json* Obj = GetArrayObject(J["Records"], "Identifier", InRecord.Identifier); Obj)
    {
        dcp_check( Obj->operator[]("Source") == InRecord.Source )
        dcp_check(  Obj->operator[]("Line") == InRecord.Line   )
        dcp_check( Obj->operator[]("Column") == InRecord.Column )
        dcp_check( Obj->operator[]("Type") == InRecord.Type )
        dcp_check( Obj->operator[]("Records").is_array() )
        dcp_check( Obj->operator[]("Records").size() == InRecord.Records.size() )
        for (size_t i = 0; i < InRecord.Records.size(); ++i)
        {
            dcp_check( Obj->operator[]("Records")[i]["Identifier"] == InRecord.Records[i].Ref )
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
    }

    J["Records"].emplace_back(std::move(Entry));

    return;
}

void Dcp::PutToIntermediate(const MyEnumRecord& InEnumRecord)
{
    PutToIntermediate(static_cast<const MyRecord&>(InEnumRecord));

    IrOut Out;
    auto& J = Out.GetHandle();
    json* Obj = GetArrayObjectChecked(J["Records"], "Identifier", InEnumRecord.Identifier);

    if (InEnumRecord.Enum.has_value())
    {
        if (Obj->contains("Enum") == false)
        {
            Obj->operator[]("Enum") = InEnumRecord.Enum.value();;
        }
        else if (Obj->operator[]("Enum").is_null())
        {
            Obj->operator[]("Enum") = InEnumRecord.Enum.value();
        }
        else
        {
            dcp_check( Obj->operator[]("Enum").is_string() )
            dcp_check( Obj->operator[]("Enum") == InEnumRecord.Enum.value() )
        }
    }
    else
    {
        if (Obj->contains("Enum") == false)
        {
            Obj->operator[]("Enum") = nullptr;
        }
        else if (Obj->operator[]("Enum").is_null() == false)
        {
            dcp_check( Obj->operator[]("Enum").is_null() )
        }
    }

    return;
}

void Dcp::PutToIntermediate(const MyFunctionForward& InFunction)
{
    IrOut Out;
    json& J = Out.GetHandle();

    if (const json* Obj = GetArrayObject(J["Functions"], "Identifier", InFunction.Identifier); Obj)
    {
        dcp_check( Obj->operator[]("Source") == InFunction.Source )
        dcp_check( Obj->operator[]("Line")   == InFunction.Line   )
        dcp_check( Obj->operator[]("Column") == InFunction.Column )

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
    IrOut Out;
    json& J = Out.GetHandle();

    if (json* Obj = GetArrayObject(J["Functions"], "Identifier", InFunction.Identifier); Obj)
    {
        dcp_check( Obj->operator[]("Source") == InFunction.Source )
        dcp_check( Obj->operator[]("Line")   == InFunction.Line   )
        dcp_check( Obj->operator[]("Column") == InFunction.Column )

        if (Obj->contains("Ret") == false)
        {
            Obj->operator[]("Ret") = InFunction.Ret;
        }
        else
        {
            dcp_check( Obj->operator[]("Ret") == InFunction.Ret )
        }

        if (Obj->contains("Params") == false)
        {
            Obj->operator[]("Params") = json::array();
        }
        else
        {
            dcp_check( Obj->operator[]("Params").is_array() )
        }

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
        else
        {
            dcp_check( Obj->operator[]("Params").size() == InFunction.Params.size() )
            for (size_t i = 0; i < InFunction.Params.size(); ++i)
            {
                dcp_check( Obj->operator[]("Params")[i]["Identifier"] == InFunction.Params[i].Identifier )
                dcp_check( Obj->operator[]("Params")[i]["Type"]       == InFunction.Params[i].Type       )
            }
        }

        if (Obj->contains("bStatic") == false)
        {
            Obj->operator[]("bStatic") = InFunction.bStatic;
        }
        else
        {
            dcp_check( Obj->operator[]("bStatic") == InFunction.bStatic )
        }

        if (Obj->contains("Records") == false)
        {
            Obj->operator[]("Records") = json::array();
        }
        else
        {
            dcp_check( Obj->operator[]("Records").is_array() )
        }

        if (Obj->operator[]("Records").empty())
        {
            for (const auto& Record : InFunction.Records)
            {
                json RecordEntry = json::object();
                RecordEntry["Identifier"] = Record.Ref;
                Obj->operator[]("Records").emplace_back(std::move(RecordEntry));
            }
        }
        else
        {
            dcp_check( Obj->operator[]("Records").size() == InFunction.Records.size() )
            for (size_t i = 0; i < InFunction.Records.size(); ++i)
            {
                dcp_check( Obj->operator[]("Records")[i]["Identifier"] == InFunction.Records[i].Ref )
            }
        }

        return;
    }

    json Entry = json::object();
    Entry["Identifier"] = InFunction.Identifier;
    Entry["Source"] = InFunction.Source;
    Entry["Line"] = InFunction.Line;
    Entry["Column"] = InFunction.Column;
    Entry["Ret"] = InFunction.Ret;
    Entry["bStatic"] = InFunction.bStatic;
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

    J["Functions"].emplace_back(std::move(Entry));

    return;
}

void Dcp::PutToIntermediate(const MyFunctionRef& InFunctionRef)
{
    IrOut Out;
    auto& J = Out.GetHandle();

    json* Caller = nullptr;

    if (Caller = GetArrayObject(J["Functions"], "Identifier", InFunctionRef.Caller.Identifier); Caller)
    {
        dcp_check( Caller->operator[]("Source") == InFunctionRef.Caller.Source )
        dcp_check( Caller->operator[]("Line")   == InFunctionRef.Caller.Line   )
        dcp_check( Caller->operator[]("Column") == InFunctionRef.Caller.Column )
    }
    else
    {
        PutToIntermediate(InFunctionRef.Caller);
        PutToIntermediate(InFunctionRef);
        return;
    }
    dcp_check( Caller )

    GetOrMakeObjectHandle(&(*Caller)["Callees"], "Identifier", InFunctionRef.Ref);

    return;
}
