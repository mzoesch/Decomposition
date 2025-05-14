#pragma once

#include "Symbols.h"
#include <clang/Frontend/CompilerInstance.h>
#include <clang/Lex/Preprocessor.h>
#include <clang/Lex/PPCallbacks.h>

namespace Dcp
{

struct MyMacroInfo final : public MySymbol
{
    std::string Definition;
    bool bFunctionLike = false;
    std::vector<std::string> Params;

    DCP_API bool operator==(const MyMacroInfo& InOther) const;
};

struct MyIncludeDirective final : public MySymbol
{
    std::string Native;

    DCP_API bool operator==(const MyIncludeDirective& InOther) const;
};

class MyMacroCollector final : public clang::PPCallbacks
{
public:

    explicit MyMacroCollector(const clang::Preprocessor& Pp, const MyAstConsumer* Consumer) : Pp(&Pp), Consumer(Consumer) { }

    DCP_API void MacroDefined(const clang::Token& MToken, const clang::MacroDirective* Md) override;
    DCP_API void InclusionDirective(
        const clang::SourceLocation HashLoc,
        const clang::Token& IncludeTok,
        const llvm::StringRef FileName,
        const bool IsAngled,
        const clang::CharSourceRange FilenameRange,
        const clang::OptionalFileEntryRef File,
        const llvm::StringRef SearchPath,
        const llvm::StringRef RelativePath,
        const clang::Module* SuggestedModule,
        bool ModuleImported,
        const clang::SrcMgr::CharacteristicKind FileType
        ) override;
    DCP_API void EndOfMainFile() override;

    DCP_API std::string GetMacroDefinition(const clang::MacroInfo* Mi) const;

    auto GetFileIncludeDirectiveInformation()  const -> const std::map<std::string, std::vector<MyIncludeDirective>>& { return this->Files_Incs; }

private:

    const clang::Preprocessor* Pp;
    const MyAstConsumer* Consumer = nullptr;

    std::vector<MyMacroInfo> ActiveMacros;

    std::map<std::string, std::vector<MyIncludeDirective>> Files_Incs;
    std::map<std::string, std::vector<MyMacroInfo>> Files_Macros;
};

class DCP_API MyAstConsumer final : public clang::ASTConsumer
{
public:

    explicit MyAstConsumer(const clang::CompilerInstance& Instance) : Instance(&Instance) { }

    void Initialize(clang::ASTContext& Context) override;
    void HandleTranslationUnit(clang::ASTContext& C) override;

private:

    std::unique_ptr<MyMacroCollector> Collector;
    const clang::CompilerInstance* Instance = nullptr;
};

} /* ~Namespace Dcp */
