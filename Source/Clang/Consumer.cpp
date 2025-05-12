#include "Consumer.h"

#include "Out.h"
#include "Visitor.h"

using namespace clang;

namespace Dcp
{

bool MyMacroInfo::operator==(const MyMacroInfo& InOther) const
{
    return MySymbol::operator==(static_cast<const MySymbol&>(InOther))
        && this->Definition == InOther.Definition
        && this->bFunctionLike == InOther.bFunctionLike
        && (this->bFunctionLike ? this->Params == InOther.Params : true);
}

bool MyIncludeDirective::operator==(const MyIncludeDirective& InOther) const
{
    return MySymbol::operator==(static_cast<const MySymbol&>(InOther))
        && this->Native == InOther.Native;
}

void MyMacroCollector::MacroDefined(const Token& MToken, const MacroDirective* Md)
{
    PPCallbacks::MacroDefined(MToken, Md);
}

void MyMacroCollector::InclusionDirective(
    const SourceLocation HashLoc,
    const Token& IncludeTok,
    const StringRef FileName,
    const bool IsAngled,
    const CharSourceRange FilenameRange,
    const OptionalFileEntryRef File,
    const StringRef SearchPath,
    const StringRef RelativePath,
    const Module* SuggestedModule,
    const bool ModuleImported,
    const SrcMgr::CharacteristicKind FileType
    )
{
    PPCallbacks::InclusionDirective(
        HashLoc,
        IncludeTok,
        FileName,
        IsAngled,
        FilenameRange,
        File,
        SearchPath,
        RelativePath,
        SuggestedModule,
        ModuleImported,
        FileType
        );

    if (!File)
    {
        return;
    }

    const SourceManager& Sm = this->Pp->getSourceManager();


    /* The file that triggered the inclusion directive. */
    FileID DirectiveF = Sm.getFileID(HashLoc);
    std::string DirectiveStr = Sm.getFileEntryForID(DirectiveF)->tryGetRealPathName().str();

    /* We only care about headers that are part of this module that is being split. */
    if (!IsModuleHeader(DirectiveStr))
    {
        return;
    }

    /* The actual absolute path to the included file. */
    std::string IncludedF = File->getName().str();

    if (this->Files.find(IncludedF) == this->Files.end())
    {
        this->Files.emplace(IncludedF, std::vector<MyIncludeDirective>());
    }
    if (this->Files.find(DirectiveStr) == this->Files.end())
    {
        this->Files.emplace(DirectiveStr, std::vector<MyIncludeDirective>());
    }

    const auto& Entry = this->Files.find(DirectiveStr);
    dcp_check( Entry != this->Files.end() )
    MyIncludeDirective Directive;
    Directive.Identifier = std::move(IncludedF);
    Directive.Source = std::move(DirectiveStr);
    Directive.Line = static_cast<int>(Sm.getSpellingLineNumber(HashLoc));
    Directive.Native = FileName.str();

    Entry->second.emplace_back(std::move(Directive));

    return;
}

void MyMacroCollector::EndOfMainFile()
{
    PPCallbacks::EndOfMainFile();

    PutToIntermediate(this->Files);

    return;
}

std::string MyMacroCollector::GetMacroDefinition(const MacroInfo* Mi) const
{
    std::string Definition;
    for (const Token& Tok : Mi->tokens())
    {
        Definition += this->Pp->getSpelling(Tok);
    }

    return Definition;
}

void MyAstConsumer::Initialize(ASTContext& Context)
{
    ASTConsumer::Initialize(Context);

    Preprocessor& Pp = this->Instance->getPreprocessor();
    this->Collector = std::make_unique<MyMacroCollector>(Pp, this);
    Pp.addPPCallbacks(std::move(this->Collector));

    return;
}

void MyAstConsumer::HandleTranslationUnit(ASTContext& C)
{
    ASTConsumer::HandleTranslationUnit(C);

    MyAstVisitor V(C);
    V.TraverseDecl(C.getTranslationUnitDecl());

    return;
}

} /* ~Namespace Dcp */
