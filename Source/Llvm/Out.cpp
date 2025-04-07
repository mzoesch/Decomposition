#include "Build.h"
#include "Out.h"
#include "json_nlohmann.h"
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
            dcp_check( false )
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

void ToJson(json* J, const Dcp::MyNodeRef& Node)
{
    dcp_check( J )
    dcp_check( Node.IsValid() )

    (*J)["Identifier"] = Node.Identifier;
    (*J)["Source"]     = Node.Source;

    return;
}

void ToJson(json* J, const Dcp::MyNode& Node)
{
    ToJson(J, static_cast<const Dcp::MyNodeRef&>(Node));

    (*J)["Line"] = Node.Line;

    return;
}

void ToJson(json* J, const Dcp::SccFunction& Node)
{
    ToJson(J, static_cast<const Dcp::MyNode&>(Node));

    (*J)["EndLine"] = Node.EndLine;
    (*J)["Includes"] = json::array();
    for (const std::string& Include : Node.Includes)
    {
        (*J)["Includes"].push_back(Include);
    }

    return;
}

nlohmann::basic_json<>* GetCursorToModule(json* JPtr, const std::string& ModuleName)
{
    dcp_check( JPtr )
    auto& J = *JPtr;

    if (J.contains("Identifier"))
    {
        dcp_check( J["Identifier"].is_string())
        dcp_check( J["Identifier"] == ModuleName )
    }
    else
    {
        J["Identifier"] = ModuleName;
    }

    if (J.contains("Sccs"))
    {
        dcp_check( J["Sccs"].is_array() )
    }
    else
    {
        J["Sccs"] = json::array();
    }

    if (J.contains("Globals"))
    {
        dcp_check( J["Globals"].is_array() )
    }
    else
    {
        J["Globals"] = json::array();
    }

    return JPtr;
}

nlohmann::basic_json<>* GetCursorToModuleChecked(json* JPtr, const std::string& ModuleName)
{
    auto* Cursor = GetCursorToModule(JPtr, ModuleName);
    dcp_check( Cursor )
    return Cursor;
}

} /* ~Namespace <Anonymous> */

void Dcp::InvalidateIntermediateCache()
{
    if (fs::exists(GetIntermediateFile()))
    {
        fs::remove(GetIntermediateFile());
        llvm::outs() << "Removed intermediate file: " << GetIntermediateFile() << "\n";
    }

    return;
}

void Dcp::PutToIntermediate(AnalyzedScc&& Nodes)
{
    EnsureJsonFile(GetIntermediateFile());

    std::ifstream In(GetIntermediateFile());
    dcp_check( In.is_open() )

    json PrivateJson;
    In >> PrivateJson;
    In.close();

    auto& SccCursor = (*GetCursorToModuleChecked(&PrivateJson, Nodes.Parent))["Sccs"];
    dcp_check( SccCursor.is_array() )

    dcp_check( SccCursor.contains(Nodes.Identifier) == false )
    SccCursor.push_back(json::object());
    auto& CurScc = SccCursor.back();

    CurScc["Identifier"] = Nodes.Identifier;

    CurScc["FunctionRefs"] = json::array();
    CurScc["Functions"] = json::array();

    CurScc["TypeRefs"] = json::array();

    CurScc["GlobalRefs"] = json::array();

    for (const SccFunctionRef& Node: Nodes.FunctionsRefs)
    {
        json JNode;
        ToJson(&JNode, Node);
        CurScc["FunctionRefs"].emplace_back(std::move(JNode));
        continue;
    }

    for (const SccFunction& Node : Nodes.Functions)
    {
        json JNode;
        ToJson(&JNode, Node);
        CurScc["Functions"].emplace_back(std::move(JNode));
        continue;
    }

    for (const SccTypeRef& Node : Nodes.TypeRefs)
    {
        json JNode;
        ToJson(&JNode, Node);
        CurScc["TypeRefs"].emplace_back(std::move(JNode));
        continue;
    }

    for (const SccGlobalRef& Node : Nodes.GlobalRefs)
    {
        json JNode;
        ToJson(&JNode, Node);
        CurScc["GlobalRefs"].emplace_back(std::move(JNode));
        continue;
    }

    std::ofstream Out(GetIntermediateFile());
    dcp_check( Out.is_open() )
    Out << std::setw(4) << PrivateJson << std::endl;
    Out.close();

    return;
}

void Dcp::PutToIntermediate(AnalyzedMod&& Mod)
{
    EnsureJsonFile(GetIntermediateFile());

    std::ifstream In(GetIntermediateFile());
    dcp_check( In.is_open() )

    json PrivateJson;
    In >> PrivateJson;
    In.close();

    auto& Globals = (*GetCursorToModuleChecked(&PrivateJson, Mod.Identifier))["Globals"];
    dcp_check( Globals.is_array() )

    for (const ModGlobal& Node : Mod.Globals)
    {
        json JNode;
        ToJson(&JNode, Node);
        Globals.emplace_back(std::move(JNode));
        continue;
    }

    std::ofstream Out(GetIntermediateFile());
    dcp_check( Out.is_open() )
    Out << std::setw(4) << PrivateJson << std::endl;
    Out.close();

    return;
}
