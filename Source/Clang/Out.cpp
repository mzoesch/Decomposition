#include "Out.h"
#include "MyXCompiler.h"
#include "Symbols.h"
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

        return;
    }

    json TypeDefEntry = json::object();
    TypeDefEntry["Identifier"] = InTypeDef.Identifier;
    TypeDefEntry["Source"] = InTypeDef.Source;
    TypeDefEntry["Line"] = InTypeDef.Line;
    TypeDefEntry["Column"] = InTypeDef.Column;
    TypeDefEntry["What"] = InTypeDef.What;
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

        return;
    }

    json TypeDefEntry = json::object();
    TypeDefEntry["Identifier"] = InRecord.Identifier;
    TypeDefEntry["Source"] = InRecord.Source;
    TypeDefEntry["Line"] = InRecord.Line;
    TypeDefEntry["Column"] = InRecord.Column;
    TypeDefEntry["Type"] = InRecord.Type;
    J["Records"].emplace_back(std::move(TypeDefEntry));

    return;
}

void Dcp::PutToIntermediate(const MyFunction& InFunction)
{
    IrOut Out;
    auto& J = Out.GetHandle();

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
                dcp_check( Obj->operator[]("Params")[i]["Type"] == InFunction.Params[i].Type )
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

        return;
    }

    json TypeDefEntry = json::object();
    TypeDefEntry["Identifier"] = InFunction.Identifier;
    TypeDefEntry["Source"] = InFunction.Source;
    TypeDefEntry["Line"] = InFunction.Line;
    TypeDefEntry["Column"] = InFunction.Column;
    TypeDefEntry["Ret"] = InFunction.Ret;
    TypeDefEntry["bStatic"] = InFunction.bStatic;
    TypeDefEntry["Params"] = json::array();
    for (const auto& Param : InFunction.Params)
    {
        json ParamEntry = json::object();
        ParamEntry["Identifier"] = Param.Identifier;
        ParamEntry["Type"] = Param.Type;
        TypeDefEntry["Params"].emplace_back(std::move(ParamEntry));
    }
    J["Functions"].emplace_back(std::move(TypeDefEntry));

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
        MyFunction F;
        F.Identifier = InFunctionRef.Caller.Identifier;
        F.Source = InFunctionRef.Caller.Source;
        F.Line = InFunctionRef.Caller.Line;
        F.Column = InFunctionRef.Caller.Column;
        PutToIntermediate(F);
        PutToIntermediate(InFunctionRef);
        return;
    }
    dcp_check( Caller )

    GetOrMakeObjectHandle(&(*Caller)["Callees"], "Identifier", InFunctionRef.Ref);

    return;
}
