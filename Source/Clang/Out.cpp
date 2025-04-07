#include "Build.h"
#include "Out.h"
#include "json_nlohmann.h"
#include "llvm/Pass.h"
#include <fstream>
#include <filesystem>
#include <iostream>

namespace fs = std::filesystem;
using json = nlohmann::json;

namespace
{

void CreateRecursiveParentDirectories(const std::string& FileName)
{
    const fs::path Path = fs::absolute(FileName);

    if (const fs::path ParentPath = Path.parent_path(); fs::exists(ParentPath) == false)
    {
        fs::create_directories(ParentPath);
    }

    return;
}

void EnsureJsonFile(const std::string& FileName)
{
    CreateRecursiveParentDirectories(FileName);

    if (fs::exists(FileName) == false)
    {
        llvm::outs() << "Creating file: " << FileName << "\n";
        std::ofstream Out(FileName, std::ios::out | std::ios::trunc);

        if (!Out)
        {
            std::cerr << "Failed to open file: " << FileName << "\n";
            predcp_check( false )
            return;
        }

        Out << std::setw(4) << json::object() << std::endl;

        Out.close();
    }

    return;
}

std::string GetIntermediateFile()
{
    return "Saved/SccpsIntermediate.json";
}

void PrepareJson(json* JPtr)
{
    predcp_check( JPtr )
    auto& J = *JPtr;

    if (J.contains("Types"))
    {
        predcp_check( J["Types"].is_array())
    }
    else
    {
        J["Types"] = json::array();
    }

    return;
}

} /* ~Namespace <Anonymous> */

void Predcp::InvalidateIntermediateCache()
{
    if (fs::exists(GetIntermediateFile()))
    {
        fs::remove(GetIntermediateFile());
        llvm::outs() << "Removed intermediate file: " << GetIntermediateFile() << "\n";
    }

    return;
}

void Predcp::PutToIntermediate(MyTypeDef&& Type)
{
    EnsureJsonFile(GetIntermediateFile());

    std::ifstream In(GetIntermediateFile());
    predcp_check( In.is_open() )

    json PrivateJson;
    In >> PrivateJson;
    In.close();

    PrepareJson(&PrivateJson);
    auto& TypeCursor = PrivateJson["Types"];

    if (TypeCursor.contains(Type.Identifier))
    {
        return;
    }

    TypeCursor.emplace_back(json::object());
    auto& CurType = TypeCursor.back();
    CurType["Identifier"] = Type.Identifier;
    CurType["Source"] = Type.Source;
    CurType["Line"] = Type.Line;
    CurType["Column"] = Type.Column;

    std::ofstream Out(GetIntermediateFile());
    predcp_check( Out.is_open() )
    Out << std::setw(4) << PrivateJson << std::endl;
    Out.close();

    return;
}
