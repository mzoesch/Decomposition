#include "Visitor.h"
#include "Out.h"
#include "Collectors.h"
#include <clang/AST/ParentMapContext.h>
#include <clang/Basic/SourceManager.h>
#include "clang/Lex/Lexer.h"

using namespace clang;

namespace
{

bool IsDeclInTranslationUnit(const Decl* D)
{
    const DeclContext* DC = D->getDeclContext();

    while (DC && isa<LinkageSpecDecl>(DC))
    {
        DC = DC->getParent();
    }

    if (DC == nullptr)
    {
        return true;
    }

    if (isa<FunctionDecl>(DC))
    {
        return false;
    }
    if (isa<RecordDecl>(DC))
    {
        return false;
    }
    if (isa<NamespaceDecl>(DC))
    {
        return false;
    }

    if (DC->isTranslationUnit())
    {
        return true;
    }

    dcp_noentry()
    return false;
}

QualType GetBasicName(QualType&& Qt)
{
    if (Qt->isFunctionPointerType())
    {
        if (Qt->isTypedefNameType() == false)
        {
            Qt = Qt->getPointeeType();
        }

        return Qt;
    }

    while (Qt->isPointerType() || Qt->isReferenceType())
    {
        Qt = Qt->getPointeeType();
    }

    Qt = Qt.getUnqualifiedType();

    return Qt;
}

QualType SafeRemovePointerType(QualType&& Qt)
{
    while (Qt->isPointerType() && (Qt->isFunctionPointerType() == false) && (Qt->isTypedefNameType() == false))
    {
        Qt = Qt->getPointeeType();
        continue;
    }

    return Qt;
}

bool IsVaList(const ParmVarDecl* Param)
{
    return Param->getType().getCanonicalType().getAsString() == "struct __va_list_tag *";
}

class VarDeclDependencyVisitor : public RecursiveASTVisitor<VarDeclDependencyVisitor>
{
public:

    explicit VarDeclDependencyVisitor(std::vector<Decl const*>* deps) : Deps(*deps) {}

    bool VisitDeclRefExpr(DeclRefExpr* Dre)
    {
        Deps.push_back(Dre->getDecl());
        return true;
    }

private:

    std::vector<Decl const*>& Deps;
};

} /* ~Namespace <Anonymous> */

bool Dcp::MyAstVisitor::VisitTypedefDecl(const TypedefDecl* Td)
{
    if (const std::optional<MyTypeDef> TypeDef = this->GetTypeDef(Td); TypeDef)
    {
        PutToIntermediate(*TypeDef);
    }

    return true;
}

bool Dcp::MyAstVisitor::VisitRecordDecl(const RecordDecl* Rd)
{
    if (const std::optional<MyRecord> Record = this->GetRecord(Rd); Record)
    {
        PutToIntermediate(*Record);
    }
    else if (std::optional<MyDecl> Decl = this->GetRecordDecl(Rd); Decl)
    {
        PutToIntermediate(*Decl);
    }

    return true;
}

bool Dcp::MyAstVisitor::VisitEnumDecl(const EnumDecl* Ed)
{
    if (const std::optional<MyEnumRecord> Enum = this->GetEnum(Ed); Enum)
    {
        PutToIntermediate(*Enum);
    }
    else if (std::optional<MyDecl> Decl = this->GetEnumDecl(Ed); Decl)
    {
        PutToIntermediate(*Decl);
    }

    return true;
}

bool Dcp::MyAstVisitor::VisitFunctionDecl(FunctionDecl* Fd)
{
    if (Fd->isThisDeclarationADefinition())
    {
        if (const std::optional<MyFunction> Func = this->GetFunction(Fd); Func)
        {
            PutToIntermediate(*Func);
        }
    }
    else
    {
        if (const std::optional<MyDecl> Func = this->GetFunctionDecl(Fd); Func)
        {
            PutToIntermediate(*Func);
        }
    }

    return true;
}

bool Dcp::MyAstVisitor::VisitCallExpr(const CallExpr* Ce)
{
    if (const std::optional<MyFunctionRef> FuncRef = this->GetFunctionRef(Ce); FuncRef)
    {
        PutToIntermediate(*FuncRef);
    }

    return true;
}

bool Dcp::MyAstVisitor::VisitVarDecl(const VarDecl* Vd)
{
    if (Vd->isLocalVarDeclOrParm() || isa<ParmVarDecl>(Vd))
    {
        return true;
    }

    const SourceManager& Sm = Context.getSourceManager();

    SourceLocation Sl = Vd->getLocation();
    while (Sl.isMacroID())
    {
        Sl = Sm.getExpansionLoc(Sl);
    }

    const FileID IdF = Sm.getFileID(Sl);
    dcp_check( IdF.isValid() )

    std::string AbsF = Sm.getFilename(Sl).str();
    if (AbsF.empty() || Dcp::IsModuleHeader(AbsF) == false)
    {
        return true;
    }

    if (auto* Dc = Vd->getDeclContext(); Dc->isTranslationUnit() == false)
    {
        return true;
    }

    if (Vd->isThisDeclarationADefinition() == false && Vd->isThisDeclarationADemotedDefinition() == false)
    {
        MyDecl D;
        D.Identifier = Vd->getName().str();
        D.Source = Sm.getFilename(Sl).str();
        D.Line = Sm.getSpellingLineNumber(Sl);
        D.Column = Sm.getSpellingColumnNumber(Sl);
        D.bStatic = Vd->isStaticLocal() || Vd->getStorageClass() == SC_Static ? EDeclBool::True : EDeclBool::False;
        D.bExtern = Vd->getStorageClass() == SC_Extern ? EDeclBool::True : EDeclBool::False;

        PutToIntermediate(D);

        return true;
    }

    MyVariable V;
    V.Identifier = Vd->getName().str();
    V.Source = Sm.getFilename(Sl).str();
    V.Line = Sm.getSpellingLineNumber(Sl);
    V.Column = Sm.getSpellingColumnNumber(Sl);
    V.Type = Vd->getType().getAsString();
    V.bStatic = Vd->isStaticLocal() || Vd->getStorageClass() == SC_Static;
    V.bExtern = Vd->getStorageClass() == SC_Extern;

    if (const Expr* Init { Vd->getInit() })
    {
        LangOptions LangOpts = Context.getLangOpts();

        SourceLocation Begin = Init->getBeginLoc();
        SourceLocation End = Init->getEndLoc();

        CharSourceRange Range = CharSourceRange::getTokenRange(Begin, End);

        StringRef Text = Lexer::getSourceText(Range, Sm, LangOpts);
        V.Init = Text.str();

        std::vector<Decl const*> InitDeps;
        ::VarDeclDependencyVisitor Visitor(&InitDeps);
        Visitor.TraverseStmt(const_cast<Expr*>(Init));

        for (const Decl* D : InitDeps)
        {
            std::string DepName;
            if (const auto* VD = dyn_cast<VarDecl>(D))
            {
                DepName = VD->getQualifiedNameAsString();
            }
            else if (const auto* FD = dyn_cast<FunctionDecl>(D))
            {
                DepName = FD->getQualifiedNameAsString();
            }
            else
            {
                continue;
            }

            MySymbolRef Ref;
            Ref.Ref = DepName;
            Ref.bStrong = false;

            V.Refs.emplace_back(std::move(Ref));

            continue;
        }
    }

    PutToIntermediate(V);

    return true;
}

bool Dcp::MyAstVisitor::VisitDeclRefExpr(const DeclRefExpr* Dre)
{
    if (auto* Vd = dyn_cast<VarDecl>(Dre->getDecl()))
    {
        return this->VisitVarDecl(Vd);
    }

    return true;
}

void Dcp::MyAstVisitor::GetAllRefs(std::set<MyRecordRef>* Refs, const QualType& InQt)
{
    dcp_check( Refs )

    if (InQt->isFunctionPointerType())
    {
        if (const PointerType* PtrType = InQt->getAs<PointerType>())
        {
            if (const FunctionProtoType* Proto = PtrType->getPointeeType()->getAs<FunctionProtoType>(); Proto)
            {
                QualType RetQt = Proto->getReturnType();
                RetQt = ::SafeRemovePointerType(std::move(RetQt));

                MyRecordRef RetRef;
                RetRef.Ref = RetQt.getAsString();
                RetRef.bStrong = false;
                Refs->emplace(std::move(RetRef));

                for (QualType QtParam : Proto->getParamTypes())
                {
                    QtParam = ::SafeRemovePointerType(std::move(QtParam));

                    MyRecordRef MyRecordRef;
                    MyRecordRef.Ref = QtParam.getAsString();
                    MyRecordRef.bStrong = false;
                    Refs->emplace(std::move(MyRecordRef));

                    continue;
                }
            }

            if (const FunctionNoProtoType* NoProto = PtrType->getPointeeType()->getAs<FunctionNoProtoType>(); NoProto)
            {
                const QualType NoProtoQt = NoProto->getReturnType();

                MyRecordRef Ref;
                Ref.Ref = NoProtoQt.getAsString();
                Ref.bStrong = false;
                Refs->emplace(std::move(Ref));
            }
        }
    }

    const QualType Qt = ::GetBasicName(QualType{InQt});

    if (Qt->hasUnnamedOrLocalType() == false)
    {
        MyRecordRef Ref;
        Ref.Ref = Qt.getAsString();
        Ref.bStrong = this->IsStrongQual(InQt);
        if (auto Elem = std::find(Refs->begin(), Refs->end(), Ref); Elem == Refs->end())
        {
            Refs->emplace(std::move(Ref));
        }
        else
        {
            if (Elem->bStrong == false)
            {
                Elem->bStrong = Ref.bStrong;
            }

            return;
        }
    }

    if (const Type* T = Qt.getTypePtrOrNull(); T == nullptr)
    {
        return;
    }

    if (this->IsStrongQual(InQt))
    {
        if (const RecordType* Rt = Qt->getAs<RecordType>(); Rt)
        {
            const RecordDecl* Rd = Rt->getDecl();
            for (const FieldDecl* Fd : Rd->fields())
            {
                this->GetAllRefs(Refs, Fd->getType());
            }
        }
    }

    return;
}

bool Dcp::MyAstVisitor::IsStrongQual(const QualType& Qt)
{
    if (Qt->isVoidType() || Qt->isVoidPointerType())
    {
        return true;
    }

    if (Qt->isAnyPointerType())
    {
        return false;
    }

    const Type* T { Qt.getTypePtrOrNull() };
    if (T == nullptr)
    {
        return false;
    }

    T = T->getUnqualifiedDesugaredType();

    if (T->isIncompleteType())
    {
        return false;
    }

    if (const auto* Rt = dyn_cast<RecordType>(T))
    {
        const RecordDecl* Rd = Rt->getDecl();

        if (Qt->isPointerType() || Qt->isReferenceType())
        {
            return false;
        }

        if (!Rd->isCompleteDefinition())
        {
            return false;
        }
    }

    if (const auto* Et = dyn_cast<EnumType>(T))
    {
        const EnumDecl* Ed = Et->getDecl();
        if (!Ed->isCompleteDefinition())
        {
            return false;
        }
    }

    return true; /* <builtin> */
}

std::optional<Dcp::MyTypeDef> Dcp::MyAstVisitor::GetTypeDef(const TypedefDecl* Td)
{
    const SourceManager& Sm = Context.getSourceManager();

    SourceLocation Sl = Td->getLocation();
    while (Sl.isMacroID())
    {
        Sl = Sm.getExpansionLoc(Sl);
    }

    const FileID IdF = Sm.getFileID(Sl);
    dcp_check( IdF.isValid() )

    std::string AbsF = Sm.getFilename(Sl).str();
    if (AbsF.empty() || Dcp::IsModuleHeader(AbsF) == false)
    {
        return { };
    }

    const QualType Qt = Td->getUnderlyingType();

    PrintingPolicy Policy(Td->getASTContext().getLangOpts());
    Policy.SuppressTagKeyword = false;

    MyTypeDef Def;
    Def.Identifier = Td->getName();
    dcp_check( Def.Identifier.empty() == false )
    Def.Source = std::move(AbsF);
    dcp_check( Def.Source.empty() == false )
    Def.Line = static_cast<int64_t>(Sm.getSpellingLineNumber(Sl));
    Def.Column = static_cast<int64_t>(Sm.getSpellingColumnNumber(Sl));

    if (const RecordType* Rt = Qt->getAs<RecordType>(); Rt)
    {
        const RecordDecl* Rd = Rt->getDecl();
        dcp_check( Rd )

        if (const TypedefType* Tt = Qt->getAs<TypedefType>(); Tt)
        {
            const TypedefNameDecl* Tnd = Tt->getDecl();
            Def.Type = Tnd->getName().str();
            dcp_check( Def.Type.empty() == false )

            Def.AddRecordRef(MyRecordRef{Def.Type, false});
        }
        else if (Rd->isAnonymousStructOrUnion() || !Rd->getIdentifier())
        {
            Def.bNoTag = true;

            if (Rd->isStruct())
            {
                Def.Type = "struct";
            }
            else if (Rd->isUnion())
            {
                Def.Type = "union";
            }
            else if (Rd->isEnum())
            {
                Def.Type = "enum";
            }
            else
            {
                dcp_check( false )
            }

            SourceLocation BeginSl = Rd->getBeginLoc();
            Def.NoTagLine = Sm.getSpellingLineNumber(BeginSl);
            Def.NoTagColumn = Sm.getSpellingColumnNumber(BeginSl);
            SourceLocation EndSl = Rd->getEndLoc();
            Def.RNoTagLine = Sm.getSpellingLineNumber(EndSl);
            Def.RNoTagColumn = Sm.getSpellingColumnNumber(EndSl);

            if (std::optional<MyRecord> Record = this->GetRecord(Rd, true); Record.has_value())
            {
                for (const MyRecordRef& R : Record->Records)
                {
                    Def.AddRecordRef(R);
                }
            }
        }
        else
        {
            dcp_check( Rd->getName().empty() == false )
            if (Rd->isStruct())
            {
                Def.Type = "struct " + Rd->getName().str();
            }
            else if (Rd->isUnion())
            {
                Def.Type = "union " + Rd->getName().str();
            }
            else if (Rd->isEnum())
            {
                Def.Type = "enum " + Rd->getName().str();
            }
            else
            {
                dcp_check( false )
            }
        }
    }
    else if (const EnumType* Et = Qt->getAs<EnumType>(); Et)
    {
        const EnumDecl* Ed = Et->getDecl();
        dcp_check( Ed )
        if (Ed->getName().empty())
        {
            Def.bNoTag = true;
            Def.Type = "enum";
            SourceLocation BeginSl = Ed->getBeginLoc();
            Def.NoTagLine = Sm.getSpellingLineNumber(BeginSl);
            Def.NoTagColumn = Sm.getSpellingColumnNumber(BeginSl);
            SourceLocation EndSl = Ed->getEndLoc();
            Def.RNoTagLine = Sm.getSpellingLineNumber(EndSl);
            Def.RNoTagColumn = Sm.getSpellingColumnNumber(EndSl);
        }
        else
        {
            Def.Type = "enum " + Ed->getName().str();
        }
    }
    else if (Qt->isFunctionPointerType())
    {
        const QualType QtNoSugar = Qt.getDesugaredType(Td->getASTContext());
        if (const PointerType* PtrType = dyn_cast<PointerType>(QtNoSugar))
        {
            const Type* Pointee = PtrType->getPointeeType().getTypePtr();

            if (const FunctionProtoType* Proto = dyn_cast<FunctionProtoType>(Pointee))
            {
                const QualType RetQt = Proto->getReturnType();
                MyRecordRef Ref;
                Ref.Ref = RetQt.getAsString();
                Def.Records.emplace(std::move(Ref));

                for (QualType paramType : Proto->param_types())
                {
                    MyRecordRef MyRecordRef;
                    MyRecordRef.Ref = paramType.getAsString();
                    Def.Records.emplace(std::move(MyRecordRef));

                    continue;
                }
            }

            /* Kernighan and Ritchie C only. Usually not used in Ansi C except some weird repos I am testing... */
            if (const FunctionNoProtoType* NoProto = dyn_cast<FunctionNoProtoType>(Pointee))
            {
                MyRecordRef Ref;
                Ref.Ref = NoProto->getReturnType().getAsString();
                Def.Records.emplace(std::move(Ref));
            }
        }

        if (const PointerType* PtrType = Qt->getAs<PointerType>())
        {
            if (const FunctionProtoType* Proto = PtrType->getPointeeType()->getAs<FunctionProtoType>(); Proto)
            {
                const QualType RetQt = Proto->getReturnType();
                MyRecordRef Ref;
                Ref.Ref = RetQt.getAsString();
                Def.Records.emplace(std::move(Ref));

                for (const QualType QtParam : Proto->getParamTypes())
                {
                    MyRecordRef MyRecordRef;
                    MyRecordRef.Ref = QtParam.getAsString();
                    Def.Records.emplace(std::move(MyRecordRef));

                    continue;
                }
            }

            if (const FunctionNoProtoType* NoProto = PtrType->getPointeeType()->getAs<FunctionNoProtoType>(); NoProto)
            {
                MyRecordRef Ref;
                Ref.Ref = NoProto->getReturnType().getAsString();
                Def.Records.emplace(std::move(Ref));
            }
        }
    }

    if (Def.bNoTag == false)
    {
        std::string Buf;
        llvm::raw_string_ostream OStream(Buf);
        Qt.print(OStream, Policy, Td->getName());
        OStream.flush();
        Def.What = std::move(Buf);
        dcp_check( Def.What.empty() == false )
    }

    return Def;
}

std::optional<Dcp::MyRecord> Dcp::MyAstVisitor::GetRecord(const RecordDecl* Rd, const bool bAllowAnonymous /* = false */)
{
    if (
           Rd->isThisDeclarationADefinition() == false
        // || Rd->isAnonymousStructOrUnion()
        || ::IsDeclInTranslationUnit(Rd) == false
        || Rd->getQualifiedNameAsString().find("::") != std::string::npos
        )
    {
        return { };
    }

    dcp_check( Rd->isStruct() || Rd->isUnion() || Rd->isEnum() )

    const SourceManager& Sm = Context.getSourceManager();

    SourceLocation Sl = Rd->getLocation();
    while (Sl.isMacroID())
    {
        Sl = Sm.getExpansionLoc(Sl);
    }

    const FileID IdF = Sm.getFileID(Sl);
    dcp_check( IdF.isValid() )

    std::string AbsF = Sm.getFilename(Sl).str();
    if (Dcp::IsModuleHeader(AbsF) == false)
    {
        return { };
    }

    MyRecord Record;

    if (AbsF.empty())
    {
        return { };
    }

    if (const IdentifierInfo* Ii = Rd->getIdentifier(); Ii)
    {
        Record.Identifier = Ii->getName().str();
    }
    if (bAllowAnonymous == false && Record.Identifier.empty())
    {
        return { };
    }

    Record.Source = std::move(AbsF);
    Record.Line = static_cast<int64_t>(Sm.getSpellingLineNumber(Sl));
    Record.Column = static_cast<int64_t>(Sm.getSpellingColumnNumber(Sl));
    Record.bAnonymous = Rd->isAnonymousStructOrUnion();

    std::string Prefix;
    if (Rd->isStruct())
    {
        Prefix = "struct ";
        Record.Type = "struct";
    }
    else if (Rd->isEnum())
    {
        Prefix = "enum ";
        Record.Type = "enum";
    }
    else if (Rd->isUnion())
    {
        Prefix = "union ";
        Record.Type = "union";
    }
    else
    {
        dcp_check( false )
    }
    Prefix.append(Record.Identifier);
    Record.Identifier = std::move(Prefix);

    for (const FieldDecl* Field : Rd->fields())
    {
        this->GetAllRefs(&Record.Records, Field->getType());
    }

    SourceLocation RBrace = Rd->getBraceRange().getEnd();
    while (RBrace.isMacroID())
    {
        RBrace = Sm.getExpansionLoc(RBrace);
    }

    SourceLocation CSl = Sm.getFileLoc(RBrace);
    while (CSl.isMacroID())
    {
        CSl = Sm.getExpansionLoc(CSl);
    }

    Record.RBraceLine = Sm.getSpellingLineNumber(CSl);
    Record.RBraceColumn = Sm.getSpellingColumnNumber(CSl);

    auto SlId = Rd->getLocation();
    auto SlKeyword = Rd->getBeginLoc();
    if (SlKeyword.isMacroID() && SlId.isMacroID())
    {
        if (Sm.getExpansionLoc(SlId) == Sm.getExpansionLoc(SlKeyword))
        {
            auto GetMostOuter = [](SourceLocation _Loc, SourceManager const& _Sm)
            {
                while (_Loc.isMacroID())
                {
                    _Loc = _Sm.getExpansionLoc(_Loc);
                }

                return _Loc;
            };

            Record.bKwInPpp = (GetMostOuter(SlId, Sm) == GetMostOuter(SlKeyword, Sm));
        }
    }

    return Record;
}

std::optional<Dcp::MyDecl> Dcp::MyAstVisitor::GetRecordDecl(const RecordDecl* Rd)
{
    if (::IsDeclInTranslationUnit(Rd) == false)
    {
        return { };
    }

    dcp_check( Rd->isStruct() || Rd->isUnion() || Rd->isEnum() )

    const SourceManager& Sm = this->Context.getSourceManager();

    SourceLocation Sl = Rd->getLocation();
    while (Sl.isMacroID())
    {
        Sl = Sm.getExpansionLoc(Sl);
    }

    const FileID IdF = Sm.getFileID(Sl);
    dcp_check( IdF.isValid() )

    std::string AbsF = Sm.getFilename(Sl).str();
    if (Dcp::IsModuleHeader(AbsF) == false)
    {
        return { };
    }

    if (AbsF.empty() || Rd->getIdentifier() == nullptr)
    {
        return { };
    }

    MyDecl D;

    D.Identifier = Rd->getIdentifier()->getName().str();
    if (D.Identifier.empty())
    {
        return { };
    }

    std::string Prefix;
    if (Rd->isStruct())
    {
        Prefix = "struct ";
    }
    else if (Rd->isEnum())
    {
        Prefix = "enum ";
    }
    else if (Rd->isUnion())
    {
        Prefix = "union ";
    }
    else
    {
        dcp_check( false )
    }
    Prefix.append(D.Identifier);
    D.Identifier = std::move(Prefix);

    D.Source = std::move(AbsF);
    D.Line = static_cast<int64_t>(Sm.getSpellingLineNumber(Sl));
    D.Column = static_cast<int64_t>(Sm.getSpellingColumnNumber(Sl));
    D.bDef = Rd->isCompleteDefinition();

    return D;
}

std::optional<Dcp::MyEnumRecord> Dcp::MyAstVisitor::GetEnum(const EnumDecl* Ed)
{
    if (Ed->isThisDeclarationADefinition() == false)
    {
        return { };
    }

    dcp_check( Ed->isStruct() || Ed->isUnion() || Ed->isEnum() )

    const SourceManager& Sm = this->Context.getSourceManager();

    SourceLocation Sl = Ed->getLocation();
    while (Sl.isMacroID())
    {
        Sl = Sm.getExpansionLoc(Sl);
    }

    const FileID IdF = Sm.getFileID(Sl);
    dcp_check( IdF.isValid() )

    std::string AbsF = Sm.getFilename(Sl).str();
    if (Dcp::IsModuleHeader(AbsF) == false)
    {
        return { };
    }

    if (AbsF.empty())
    {
        return { };
    }

    if (TypedefNameDecl* Td = Ed->getTypedefNameForAnonDecl())
    {
        return { };
    }

    MyEnumRecord Record;
    Record.Identifier += "enum ";

    Record.Source = std::move(AbsF);
    Record.Line = static_cast<int64_t>(Sm.getSpellingLineNumber(Sl));
    Record.Column = static_cast<int64_t>(Sm.getSpellingColumnNumber(Sl));

    if (Ed->getIdentifier())
    {
        Record.Identifier += Ed->getIdentifier()->getName().str();
    }
    else
    {
        Record.Identifier = "<anonymous enum:";
        Record.Identifier += Record.Source;
        Record.Identifier += "::";
        Record.Identifier += std::to_string(Record.Line);
        Record.Identifier += "::";
        Record.Identifier += std::to_string(Record.Column);
        Record.Identifier += ">";
    }

    if (Ed->isStruct())
    {
        Record.Type = "struct";
    }
    else if (Ed->isEnum())
    {
        Record.Type = "enum";
    }
    else if (Ed->isUnion())
    {
        Record.Type = "union";
    }
    else
    {
        dcp_check( false )
    }

    if (QualType Qt = Ed->getIntegerType(); Qt.isNull() == false)
    {
        Record.Enum = Qt.getAsString();
        Qt = ::GetBasicName(std::move(Qt));

        if (Qt->hasUnnamedOrLocalType() == false)
        {
            MyRecordRef Ref;
            Ref.Ref = Qt.getAsString();
            Ref.bStrong = true;
            Record.AddRecordRef(std::move(Ref));
        }
    }

    SourceLocation RBrace = Ed->getBraceRange().getEnd();
    while (RBrace.isMacroID())
    {
        RBrace = Sm.getExpansionLoc(RBrace);
    }

    SourceLocation CSl = Sm.getFileLoc(RBrace);
    while (CSl.isMacroID())
    {
        CSl = Sm.getExpansionLoc(CSl);
    }

    Record.RBraceLine = Sm.getSpellingLineNumber(CSl);
    Record.RBraceColumn = Sm.getSpellingColumnNumber(CSl);

    return Record;
}

std::optional<Dcp::MyDecl> Dcp::MyAstVisitor::GetEnumDecl(const EnumDecl* Ed)
{
    if (::IsDeclInTranslationUnit(Ed) == false)
    {
        return { };
    }

    const SourceManager& Sm = this->Context.getSourceManager();

    SourceLocation Sl = Ed->getLocation();
    while (Sl.isMacroID())
    {
        Sl = Sm.getExpansionLoc(Sl);
    }

    const FileID IdF = Sm.getFileID(Sl);
    dcp_check( IdF.isValid() )

    std::string AbsF = Sm.getFilename(Sl).str();
    if (Dcp::IsModuleHeader(AbsF) == false)
    {
        return { };
    }

    if (AbsF.empty() || Ed->getIdentifier() == nullptr)
    {
        return { };
    }

    MyDecl D;

    D.Identifier = std::string{"enum "} + Ed->getIdentifier()->getName().str();
    if (D.Identifier.empty())
    {
        return { };
    }

    D.Source = std::move(AbsF);
    D.Line = static_cast<int64_t>(Sm.getSpellingLineNumber(Sl));
    D.Column = static_cast<int64_t>(Sm.getSpellingColumnNumber(Sl));
    D.bDef = Ed->isCompleteDefinition();

    return D;
}

std::optional<Dcp::MyFunction> Dcp::MyAstVisitor::GetFunction(FunctionDecl* Fd)
{
    dcp_check( Fd->isThisDeclarationADefinition() )

    const SourceManager& Sm = this->Context.getSourceManager();

    SourceLocation Sl = Fd->getLocation();
    while (Sl.isMacroID())
    {
        Sl = Sm.getExpansionLoc(Sl);
    }

    const FileID IdF = Sm.getFileID(Sl);
    dcp_check( IdF.isValid() )

    std::string AbsF = Sm.getFilename(Sl).str();
    if (Dcp::IsModuleHeader(AbsF) == false)
    {
        return { };
    }

    if (AbsF.empty() || Fd->getName() == "") /* <builtin> */
    {
        return { };
    }

    dcp_check( Fd->hasBody() )
    const Stmt* Body = Fd->getBody();

    MyFunction Func;
    Func.Identifier = Fd->getQualifiedNameAsString();
    Func.Source = std::move(AbsF);
    Func.Line = static_cast<int64_t>(Sm.getSpellingLineNumber(Sl));
    Func.Column = static_cast<int64_t>(Sm.getSpellingColumnNumber(Sl));

    Func.bStatic = Fd->isStatic();

    const QualType RealQtRet = Fd->getReturnType();
    Func.Ret = RealQtRet.getAsString();
    if (const QualType QtRet = ::GetBasicName(QualType{RealQtRet}); QtRet->hasUnnamedOrLocalType() == false)
    {
        MyRecordRef Ref;
        Ref.Ref = QtRet.getAsString();
        Ref.bStrong = this->IsStrongQual(RealQtRet);
        Func.AddRecordRef(std::move(Ref));
    }

    auto SlId = Fd->getLocation();
    auto SlRet = Fd->getReturnTypeSourceRange().getBegin();
    if (SlRet.isMacroID() && SlId.isMacroID())
    {
        if (Sm.getExpansionLoc(SlId) == Sm.getExpansionLoc(SlRet))
        {
            auto GetMostOuter = [](SourceLocation _Loc, SourceManager const& _Sm)
            {
                while (_Loc.isMacroID())
                {
                    _Loc = _Sm.getExpansionLoc(_Loc);
                }

                return _Loc;
            };

            Func.bRetInPpp = (GetMostOuter(SlId, Sm) == GetMostOuter(SlRet, Sm));
        }
    }

    for (const ParmVarDecl* Param : Fd->parameters())
    {
        MyFunction::Param P;
        if (::IsVaList(Param))
        {
            P.Type = "va_list";
        }
        else
        {
            std::string ParamStr;
            llvm::raw_string_ostream Os(ParamStr);
            Param->print(Os);
            P.Type = Os.str();
        }

        Func.Params.emplace_back(std::move(P));

        const QualType QtParam = Param->getType();
        QualType Qt = ::GetBasicName(QualType{QtParam});
        if (Qt->hasUnnamedOrLocalType())
        {
            std::set<MyRecordRef> TmpRefs;
            GetAllRefs(&TmpRefs, QtParam);
            for (const MyRecordRef& R : TmpRefs)
            {
                Func.AddRecordRef(MyRecordRef{R});
            }

            continue;
        }

        MyRecordRef Ref;
        Ref.Ref = Qt.getAsString();
        Ref.bStrong = this->IsStrongQual(QtParam);
        Func.AddRecordRef(std::move(Ref));

        continue;
    }
    if (Fd->isVariadic())
    {
        MyFunction::Param P;
        P.Type = "...";
        Func.Params.emplace_back(std::move(P));
    }

    MyRefCollector RefCollector;
    RefCollector.Sm = &Sm;
    RefCollector.TraverseDecl(Fd);
    for (const auto& Ref : RefCollector.Refs)
    {
        Func.AddRecordRef(Ref);
        continue;
    }

    MyVarRefCollector VarRefCollector {Fd, this->Context};
    VarRefCollector.TraverseFunction();
    for (const VarDecl* Vd : VarRefCollector.GetExternalReferences())
    {
        dcp_check( Vd )

        MyVarRef Ref;
        Ref.Ref = Vd->getQualifiedNameAsString();
        QualType VdQt = Vd->getType();

        if (VdQt->hasUnnamedOrLocalType())
        {
            Ref.Type = '?';
        }
        else
        {
            Ref.Type = VdQt.getAsString();
        }

        Ref.bStrong = false;

        Func.AddVarRef(std::move(Ref));

        continue;
    }

    MyDecl Fwd;
    Fwd.Identifier = Func.Identifier;
    Fwd.Line = Func.Line;
    Fwd.Column = Func.Column;
    Fwd.Source = Func.Source;
    Fwd.bStatic = Func.bStatic ? EDeclBool::True : EDeclBool::False;
    Fwd.bExtern = EDeclBool::None;

    MyFuncPointerCollector FCollector {Fd, this->Context};
    FCollector.TraverseFunction();
    for (const FunctionDecl* _Fd : FCollector.GetFds())
    {
        dcp_check( _Fd )

        MyFunctionRef Ref;
        Ref.Caller = Fwd;
        Ref.Ref = _Fd->getQualifiedNameAsString();
        Ref.bStrong = false;

        PutToIntermediate(Ref);

        continue;
    }

    if (const auto* CStmt = dyn_cast<CompoundStmt>(Body))
    {
        SourceLocation RBrace = CStmt->getRBracLoc();
        while (RBrace.isMacroID())
        {
            RBrace = Sm.getExpansionLoc(RBrace);
        }

        SourceLocation CSl = Sm.getFileLoc(RBrace);
        while (CSl.isMacroID())
        {
            CSl = Sm.getExpansionLoc(CSl);
        }

        Func.RBraceLine = Sm.getSpellingLineNumber(CSl);
        Func.RBraceColumn = Sm.getSpellingColumnNumber(CSl);
    }

    return Func;
}

std::optional<Dcp::MyDecl> Dcp::MyAstVisitor::GetFunctionDecl(const FunctionDecl* Fd)
{
    const SourceManager& Sm = this->Context.getSourceManager();

    SourceLocation Sl = Fd->getLocation();
    while (Sl.isMacroID())
    {
        Sl = Sm.getExpansionLoc(Sl);
    }

    const FileID IdF = Sm.getFileID(Sl);
    dcp_check( IdF.isValid() )

    std::string AbsF = Sm.getFilename(Sl).str();
    if (Dcp::IsModuleHeader(AbsF) == false)
    {
        return { };
    }

    if (AbsF.empty() || Fd->getName() == "") /* <builtin> */
    {
        return { };
    }

    MyDecl Decl;
    Decl.Identifier = Fd->getQualifiedNameAsString();
    Decl.Source = std::move(AbsF);
    Decl.Line = static_cast<int64_t>(Sm.getSpellingLineNumber(Sl));
    Decl.Column = static_cast<int64_t>(Sm.getSpellingColumnNumber(Sl));
    Decl.bStatic = Fd->isStatic() ? EDeclBool::True : EDeclBool::False;
    Decl.bExtern = EDeclBool::None;

    return Decl;
}

std::optional<Dcp::MyFunctionRef> Dcp::MyAstVisitor::GetFunctionRef(const CallExpr* Ce)
{
    const SourceManager& Sm = this->Context.getSourceManager();

    const FunctionDecl* Callee = Ce->getDirectCallee();
    if (Callee == nullptr)
    {
        return { };
    }

    SourceLocation Sl = Callee->getLocation();
    while (Sl.isMacroID())
    {
        Sl = Sm.getExpansionLoc(Sl);
    }
    if (Sm.isInSystemHeader(Sl))
    {
        return { };
    }

    DynTypedNodeList parents = this->Context.getParents(DynTypedNode::create(*Ce));
    const FunctionDecl* Caller = nullptr;
    while (parents.empty() == false)
    {
        for (const DynTypedNode& parent: parents)
        {
            if (const FunctionDecl* Fd = parent.get<FunctionDecl>())
            {
                Caller = Fd;
                break;
            }
        }

        if (Caller != nullptr)
        {
            break;
        }

        parents = this->Context.getParents(parents[0]);
        continue;
    }
    dcp_check( Caller )

    MyFunctionRef Ref;
    Ref.Caller = this->GetFunctionDecl(Caller).value();
    Ref.Ref = Callee->getQualifiedNameAsString();
    Ref.bStrong = false;

    return Ref;
}
