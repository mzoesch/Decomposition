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

std::string GetIntermediateFile(const std::string& InRoot)
{
    predcp_check( InRoot.size() > 0 && (InRoot.back() != '/' || InRoot.back() != '\\') )
    return InRoot + "/Saved/SccpsIntermediate.json";
}

void PrepareJson(json* JPtr)
{
    predcp_check( JPtr )
    auto& J = *JPtr;

    if (J.contains("Files"))
    {
        predcp_check( J["Files"].is_array())
    }
    else
    {
        J["Files"] = json::array();
    }

    return;
}

} /* ~Namespace <Anonymous> */

void Predcp::InvalidateIntermediateCache(const std::string& InRoot)
{
    if (fs::exists(GetIntermediateFile(InRoot)))
    {
        fs::remove(GetIntermediateFile(InRoot));
        llvm::outs() << "Removed intermediate file: " << GetIntermediateFile(InRoot) << "\n";
    }

    return;
}

void Predcp::PutToIntermediate(const std::string& InRoot, std::string&& F, std::vector<MyMacroInfo>&& Macros)
{
    EnsureJsonFile(GetIntermediateFile(InRoot));

    std::ifstream In(GetIntermediateFile(InRoot));
    predcp_check( In.is_open() )

    json PrivateJson;
    In >> PrivateJson;
    In.close();

    PrepareJson(&PrivateJson);
    auto& Files = PrivateJson["Files"];
    nlohmann::basic_json<>* Translation = nullptr;
    for (auto& T : Files)
    {
        if (T.contains("Identifier") && T["Identifier"] == F)
        {
            Translation = &T;
            break;
        }
    }
    if (Translation == nullptr)
    {
        Translation = &Files.emplace_back(json::object());
        (*Translation)["Identifier"] = F;
        (*Translation)["Macros"] = json::array();
        (*Translation)["Includes"] = json::array();
    }

    auto& MacrosArray = (*Translation)["Macros"];
    for (const MyMacroInfo& Macro : Macros)
    {
        predcp_check( !(Macro.bFunction == false && Macro.Params.size() > 0) )
        predcp_checkcode
        (
            if (MacrosArray.contains(Macro.Identifier))
            {
                predcp_noentry()
            }
        )

        MacrosArray.emplace_back(json::object());
        auto& CurMacro = MacrosArray.back();
        CurMacro["Identifier"] = Macro.Identifier;
        CurMacro["Line"] = Macro.Line;
        CurMacro["Definition"] = Macro.Definition;
        CurMacro["bFunction"] = Macro.bFunction;
        CurMacro["Params"] = json::array();
        for (const std::string& Param : Macro.Params)
        {
            CurMacro["Params"].emplace_back(Param);
        }

        continue;
    }

    std::ofstream Out(GetIntermediateFile(InRoot));
    predcp_check( Out.is_open() )
    Out << std::setw(4) << PrivateJson << std::endl;
    Out.close();

    return;
}

void Predcp::PutToIntermediate(const std::string& InRoot, std::map<std::string, std::vector<MyIncludeDirective>>&& InFiles)
{
    EnsureJsonFile(GetIntermediateFile(InRoot));

    std::ifstream In(GetIntermediateFile(InRoot));
    predcp_check( In.is_open() )

    json PrivateJson;
    In >> PrivateJson;
    In.close();

    PrepareJson(&PrivateJson);

    auto& Files = PrivateJson["Files"];
    for (const auto& Header : InFiles)
    {
        nlohmann::basic_json<>* HeaderCursor = nullptr;
        for (auto& H : Files)
        {
            if (H.contains("Identifier") && H["Identifier"] == Header.first)
            {
                predcp_check( H["Includes"].is_array() )
                HeaderCursor = &H;
                break;
            }
        }
        if (HeaderCursor == nullptr)
        {
            HeaderCursor = &Files.emplace_back(json::object());
            (*HeaderCursor)["Identifier"] = Header.first;
            (*HeaderCursor)["Macros"] = json::array();
            (*HeaderCursor)["Includes"] = json::array();
        }

        auto& IncludesArray = (*HeaderCursor)["Includes"];
        for (const MyIncludeDirective& Include : Header.second)
        {
            bool bFound = false;
            for (auto& I : IncludesArray)
            {
                if (I.contains("What") && I["What"] == Include.What)
                {
                    bFound = true;
                    break;
                }
            }
            if (bFound)
            {
                continue;
            }

            IncludesArray.emplace_back(json::object());
            auto& CurInclude = IncludesArray.back();
            CurInclude["Line"] = Include.Line;
            CurInclude["What"] = Include.What;
            CurInclude["Native"] = Include.Native;

            continue;
        }

        continue;
    }

    std::ofstream Out(GetIntermediateFile(InRoot));
    predcp_check( Out.is_open() )
    Out << std::setw(4) << PrivateJson << std::endl;
    Out.close();

    return;
}

void Predcp::PutToIntermediate(const std::string& InRoot, std::map<std::string, std::vector<MyMacroInfo>>&& InHeaders)
{
    EnsureJsonFile(GetIntermediateFile(InRoot));

    std::ifstream In(GetIntermediateFile(InRoot));
    predcp_check( In.is_open() )

    json PrivateJson;
    In >> PrivateJson;
    In.close();

    PrepareJson(&PrivateJson);

    auto& Headers = PrivateJson["Files"];
    for (const auto& Header : InHeaders)
    {
        nlohmann::basic_json<>* HeaderCursor = nullptr;
        for (auto& H : Headers)
        {
            if (H.contains("Identifier") && H["Identifier"] == Header.first)
            {
                predcp_check( H["Macros"].is_array() )
                HeaderCursor = &H;
                break;
            }
        }
        if (HeaderCursor == nullptr)
        {
            HeaderCursor = &Headers.emplace_back(json::object());
            (*HeaderCursor)["Identifier"] = Header.first;
            (*HeaderCursor)["Macros"] = json::array();
            (*HeaderCursor)["Includes"] = json::array();
        }

        auto& MacrosArray = (*HeaderCursor)["Macros"];
        for (const MyMacroInfo& Macro : Header.second)
        {
            predcp_check( !(Macro.bFunction == false && Macro.Params.size() > 0) )
            predcp_checkcode
            (
                if (MacrosArray.contains(Macro.Identifier))
                {
                    predcp_noentry()
                }
            )

            MacrosArray.emplace_back(json::object());
            auto& CurMacro = MacrosArray.back();
            CurMacro["Identifier"] = Macro.Identifier;
            CurMacro["Line"] = Macro.Line;
            CurMacro["Definition"] = Macro.Definition;
            CurMacro["bFunction"] = Macro.bFunction;
            CurMacro["Params"] = json::array();
            for (const std::string& Param : Macro.Params)
            {
                CurMacro["Params"].emplace_back(Param);
            }

            continue;
        }

        continue;
    }

    std::ofstream Out(GetIntermediateFile(InRoot));
    predcp_check( Out.is_open() )
    Out << std::setw(4) << PrivateJson << std::endl;
    Out.close();

    return;
}
