#include "Consumer.h"

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

    return;
}

void MyMacroCollector::EndOfMainFile()
{
    PPCallbacks::EndOfMainFile();

    const SourceManager& Sm = this->Pp->getSourceManager();

    // Get all typedefs


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
