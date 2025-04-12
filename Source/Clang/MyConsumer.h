#pragma once

#include "Build.h"
#include <string>
#include <clang/Frontend/CompilerInstance.h>
#include <clang/Lex/Preprocessor.h>
#include <clang/Lex/PPCallbacks.h>

namespace Predcp
{

class MyMacroCollector;
class MyAstConsumer;
struct MyTypeDef;
struct MyMacroInfo;

struct MyTypeDef
{
    virtual ~MyTypeDef() = default;

    std::string Identifier;
    std::string Source;
    int Line = INDEX_NONE;
    int Column = INDEX_NONE;

    PREDCP_API virtual bool operator==(const MyTypeDef& Other) const;
    PREDCP_API virtual bool IsValid() const;
};

struct MyMacroInfo
{
    int Line = INDEX_NONE;
    std::string Identifier;
    std::string Definition;
    bool bFunction = false;
    std::vector<std::string> Params;

    std::string ToString() const;
};

struct MyIncludeDirective
{
    MyIncludeDirective(const int Line, std::string Identifier, std::string Native)
        : Line(Line), What(std::move(Identifier)), Native(std::move(Native)) { }

    bool operator==(const MyIncludeDirective& Other) const;

    int Line = INDEX_NONE;
    std::string What;
    std::string Native;

    std::string ToString() const;
};

class MyMacroCollector final : public clang::PPCallbacks
{
public:

    explicit MyMacroCollector(const clang::Preprocessor& Pp, const MyAstConsumer* Consumer) : Pp(&Pp), Consumer(Consumer) {}

    PREDCP_API void MacroDefined(const clang::Token& MToken, const clang::MacroDirective* Md) override;
    PREDCP_API void InclusionDirective(
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
    PREDCP_API void EndOfMainFile() override;

    PREDCP_API std::string GetMacroDefinition(const clang::MacroInfo* Mi) const;

    auto GetFileIncludeDirectiveInformation()  const -> const std::map<std::string, std::vector<MyIncludeDirective>>& { return this->Files; }

private:

    const clang::Preprocessor* Pp;
    const MyAstConsumer* Consumer = nullptr;

    /** The cursor for directives of the main file. Used by transitive includes. */
    int MainLineCursor = INDEX_NONE; /* Index None means not used. */

    std::vector<MyMacroInfo> ActiveMacros;

    std::map<std::string, std::vector<MyIncludeDirective>> Files;
    std::map<std::string, std::vector<MyMacroInfo>> HeaderMacros;
};

class PREDCP_API MyAstConsumer final : public clang::ASTConsumer
{
public:

    explicit MyAstConsumer(const clang::CompilerInstance& Instance, const std::string& InRoot) : Root(InRoot), Instance(&Instance) { }

    void Initialize(clang::ASTContext& Context) override;

    inline std::string GetRoot() const { return this->Root; }

private:

    std::unique_ptr<MyMacroCollector> Collector;
    std::string Root;
    const clang::CompilerInstance* Instance = nullptr;
};

inline std::string MyMacroInfo::ToString() const
{
    return std::to_string(this->Line) + ":" + this->Identifier + " = " + this->Definition;
}

inline bool MyIncludeDirective::operator==(const MyIncludeDirective& Other) const
{
    return this->Line == Other.Line && this->What == Other.What;
}

inline std::string MyIncludeDirective::ToString() const
{
    return std::to_string(this->Line) + ": " + this->What;
}

} /* ~Namespace Predcp */
