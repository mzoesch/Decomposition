#include "MyConsumer.h"
#include "Out.h"

using namespace clang;

bool Predcp::MyTypeDef::operator==(const MyTypeDef& Other) const
{
    return this->Identifier == Other.Identifier
        && this->Source == Other.Source;
}

bool Predcp::MyTypeDef::IsValid() const
{
    return this->Identifier.size() > 0
        && this->Source.size() > 0
        && this->Line != INDEX_NONE
        && this->Column != INDEX_NONE;
}

void Predcp::MyMacroCollector::MacroDefined(const Token& MToken, const MacroDirective* Md)
{
    predcp_check( Md )

    const SourceManager& Sm = Pp->getSourceManager();
    const IdentifierInfo* Ii = MToken.getIdentifierInfo();
    predcp_check( Ii )

    const StringRef MacroName = Ii->getName();
    const SourceLocation Loc = MToken.getLocation();
    const FileEntry* DefiningFile = Sm.getFileEntryForID(Sm.getFileID(Loc));

    if (DefiningFile == nullptr) /* <builtin>; we do not care. */
    {
        return;
    }

    const MacroInfo* Mi = this->Pp->getMacroInfo(Ii);
    predcp_check( Mi )

    const StringRef DefiningF = DefiningFile->tryGetRealPathName();
    const StringRef MainF = Sm.getFileEntryForID(Sm.getMainFileID())->tryGetRealPathName();

    MyMacroInfo Info;
    Info.Identifier = MacroName.str();
    Info.Definition = this->GetMacroDefinition(Mi);

    if (Mi->isFunctionLike())
    {
        Info.bFunction = true;
        for (const IdentifierInfo* Param : Mi->params())
        {
            predcp_check( Param )
            Info.Params.emplace_back(Param->getName());
        }
    }

    if (DefiningF == MainF) /* Included directly. */
    {
        this->MainLineCursor = INDEX_NONE;
        Info.Line = static_cast<int>(Sm.getSpellingLineNumber(Loc));
    }
    else /* Included transitively. */
    {
        predcp_check( this->MainLineCursor != INDEX_NONE )
        Info.Line = this->MainLineCursor;

        std::string DefiningFStr = DefiningF.str();

        if (this->HeaderMacros.find(DefiningFStr) == this->HeaderMacros.end())
        {
            this->HeaderMacros.emplace(DefiningFStr, std::vector<MyMacroInfo>());
        }
        const auto& Entry = this->HeaderMacros.find(DefiningFStr);
        predcp_check( Entry != this->HeaderMacros.end() )

        Entry->second.emplace_back(Info);
    }

    predcp_check( Info.Line > INDEX_NONE )
    this->ActiveMacros.emplace_back(std::move(Info));

    return;
}

void Predcp::MyMacroCollector::InclusionDirective(
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
    const FileID MainF = Sm.getMainFileID();

    /* The file that triggered the inclusion directive. */
    FileID DirectiveF = Sm.getFileID(HashLoc);
    /* The actual absolute path to the included file. */
    std::string IncludedF = File->getName().str();

    if (this->Files.find(IncludedF) == this->Files.end())
    {
        this->Files.emplace(IncludedF, std::vector<MyIncludeDirective>());
    }
    if (this->Files.find(Sm.getFileEntryForID(DirectiveF)->tryGetRealPathName().str()) == this->Files.end())
    {
        this->Files.emplace(Sm.getFileEntryForID(DirectiveF)->tryGetRealPathName().str(), std::vector<MyIncludeDirective>());
    }

    if (DirectiveF == MainF) /* Included directly. */
    {
        this->MainLineCursor = static_cast<int>(Sm.getSpellingLineNumber(HashLoc));
    }

    const auto& Entry = this->Files.find(Sm.getFileEntryForID(DirectiveF)->tryGetRealPathName().str());
    predcp_check( Entry != this->Files.end() )
    Entry->second.emplace_back(
        static_cast<int>(Sm.getSpellingLineNumber(HashLoc)),
        IncludedF,
        FileName.str()
        );

    return;
}

void Predcp::MyMacroCollector::EndOfMainFile()
{
    PPCallbacks::EndOfMainFile();

    const SourceManager& Sm = this->Pp->getSourceManager();

    PutToIntermediate
    (
        this->Consumer->GetRoot(),
        Sm.getFileEntryForID(Sm.getMainFileID())->tryGetRealPathName().str(),
        std::move(this->ActiveMacros)
    );

    PutToIntermediate
    (
        this->Consumer->GetRoot(),
        std::move(this->Files)
    );

    PutToIntermediate
    (
        this->Consumer->GetRoot(),
        std::move(this->HeaderMacros)
    );

    return;
}

std::string Predcp::MyMacroCollector::GetMacroDefinition(const MacroInfo* Mi) const
{
    std::string Definition;
    for (const Token& Tok : Mi->tokens())
    {
        Definition += this->Pp->getSpelling(Tok);
    }

    return Definition;
}

void Predcp::MyAstConsumer::Initialize(ASTContext& Context)
{
    ASTConsumer::Initialize(Context);

    Preprocessor& Pp = this->Instance->getPreprocessor();
    this->Collector = std::make_unique<MyMacroCollector>(Pp, this);
    Pp.addPPCallbacks(std::move(this->Collector));

    return;
}
