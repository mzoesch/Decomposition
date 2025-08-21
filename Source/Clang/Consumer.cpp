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
    dcp_check( Md )

    const SourceManager& Sm = this->Pp->getSourceManager();

    const IdentifierInfo* Ii = MToken.getIdentifierInfo();
    dcp_check( Ii )

    const StringRef MacroName = Ii->getName();
    const SourceLocation Loc = MToken.getLocation();
    const FileEntry* DefiningFile = Sm.getFileEntryForID(Sm.getFileID(Loc));

    if (DefiningFile == nullptr) /* <builtin>; we do not care. */
    {
        return;
    }

    const std::string DefiningF = DefiningFile->tryGetRealPathName().str();
    if (IsModuleHeader(DefiningF) == false) /* extern; we do not care. */
    {
        return;
    }

    const MacroInfo* Mi = this->Pp->getMacroInfo(Ii);
    dcp_check( Mi )

    MyMacroInfo Info;
    Info.Identifier = MacroName.str();
    Info.Definition = this->GetMacroDefinition(Mi);
    Info.Source = DefiningF;
    Info.Line = Sm.getSpellingLineNumber(Loc);

    if (Mi->isFunctionLike())
    {
        Info.bFunctionLike = true;
        for (const IdentifierInfo* Param : Mi->params())
        {
            dcp_check( Param )
            Info.Params.emplace_back(Param->getName());
            continue;
        }
    }

    if (this->Files_Macros.find(DefiningF) == this->Files_Macros.end())
    {
        this->Files_Macros.emplace(DefiningF, std::vector<MyMacroInfo>());
    }

    const auto& Entry = this->Files_Macros.find(DefiningF);
    dcp_check( Entry != this->Files_Macros.end() )
    Entry->second.emplace_back(std::move(Info));

    return;
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

    if (this->Files_Incs.find(IncludedF) == this->Files_Incs.end())
    {
        this->Files_Incs.emplace(IncludedF, std::vector<MyIncludeDirective>());
    }
    if (this->Files_Incs.find(DirectiveStr) == this->Files_Incs.end())
    {
        this->Files_Incs.emplace(DirectiveStr, std::vector<MyIncludeDirective>());
    }

    const auto& Entry = this->Files_Incs.find(DirectiveStr);
    dcp_check( Entry != this->Files_Incs.end() )
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

    PutToIntermediate(this->Files_Incs);
    PutToIntermediate(this->Files_Macros);

    return;
}

std::string MyMacroCollector::GetMacroDefinition(const MacroInfo* Mi) const
{
    std::string Definition;
    for (const Token& Tok : Mi->tokens())
    {
        Definition += ' ';
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
