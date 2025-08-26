#include "Visitor.h"
#include "Out.h"
#include "Collectors.h"
#include <clang/AST/ParentMapContext.h>
#include <clang/Basic/SourceManager.h>

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

    const SourceLocation Sl = Vd->getLocation();

    const SourceManager& Sm = Context.getSourceManager();
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
        D.Source = Context.getSourceManager().getFilename(Vd->getLocation()).str();
        D.Line = Context.getSourceManager().getSpellingLineNumber(Vd->getLocation());
        D.Column = Context.getSourceManager().getSpellingColumnNumber(Vd->getLocation());
        D.bStatic = Vd->isStaticLocal() || Vd->getStorageClass() == SC_Static ? EDeclBool::True : EDeclBool::False;
        D.bExtern = Vd->getStorageClass() == SC_Extern ? EDeclBool::True : EDeclBool::False;

        PutToIntermediate(D);

        return true;
    }

    MyVariable V;
    V.Identifier = Vd->getName().str();
    V.Source = Context.getSourceManager().getFilename(Vd->getLocation()).str();
    V.Line = Context.getSourceManager().getSpellingLineNumber(Vd->getLocation());
    V.Column = Context.getSourceManager().getSpellingColumnNumber(Vd->getLocation());
    V.Type = Vd->getType().getAsString();
    V.bStatic = Vd->isStaticLocal() || Vd->getStorageClass() == SC_Static;
    V.bExtern = Vd->getStorageClass() == SC_Extern;

    PutToIntermediate(V);

    return true;
}

bool Dcp::MyAstVisitor::VisitDeclRefExpr(const DeclRefExpr* Dre)
{
    if (auto* Vd = dyn_cast<VarDecl>(Dre->getDecl()))
    {
        if (auto* Dc = Vd->getDeclContext(); Dc->isTranslationUnit())
        {
            const SourceLocation Sl = Dre->getLocation();

            const SourceManager& Sm = Context.getSourceManager();
            const FileID IdF = Sm.getFileID(Sl);
            dcp_check( IdF.isValid() )

            std::string AbsF = Sm.getFilename(Sl).str();
            if (AbsF.empty() || Dcp::IsModuleHeader(AbsF) == false)
            {
                return true;
            }

            QualType Qt = Vd->getType();
            Qt = ::GetBasicName(std::move(Qt));

            MyVariable V;
            V.Identifier = Vd->getName().str();
            V.Source = Context.getSourceManager().getFilename(Vd->getLocation()).str();
            V.Line = Context.getSourceManager().getSpellingLineNumber(Vd->getLocation());
            V.Column = Context.getSourceManager().getSpellingColumnNumber(Vd->getLocation());
            V.Type = Qt.getAsString();
            V.bStatic = Vd->isStaticLocal() || Vd->getStorageClass() == SC_Static;

            PutToIntermediate(V);
        }
    }

    return true;
}

void Dcp::MyAstVisitor::GetAllRefs(std::set<MyRecordRef>* Refs, QualType&& InQt)
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
                Refs->emplace(std::move(RetRef));

                for (QualType QtParam : Proto->getParamTypes())
                {
                    QtParam = ::SafeRemovePointerType(std::move(QtParam));

                    MyRecordRef MyRecordRef;
                    MyRecordRef.Ref = QtParam.getAsString();
                    Refs->emplace(std::move(MyRecordRef));

                    continue;
                }
            }

            if (const FunctionNoProtoType* NoProto = PtrType->getPointeeType()->getAs<FunctionNoProtoType>(); NoProto)
            {
                MyRecordRef Ref;
                Ref.Ref = NoProto->getReturnType().getAsString();
                Refs->emplace(std::move(Ref));
            }
        }
    }

    const QualType Qt = ::GetBasicName(std::move(InQt));

    if (Qt->hasUnnamedOrLocalType() == false)
    {
        MyRecordRef Ref;
        Ref.Ref = Qt.getAsString();
        if (std::find(Refs->begin(), Refs->end(), Ref) == Refs->end())
        {
            Refs->emplace(std::move(Ref));
        }
        else
        {
            return;
        }
    }

    const Type* T = Qt.getTypePtrOrNull();
    if (T == nullptr)
    {
        return;
    }

    if (const RecordType* Rt = Qt->getAs<RecordType>(); Rt)
    {
        const RecordDecl* Rd = Rt->getDecl();
        for (const FieldDecl* Fd : Rd->fields())
        {
            this->GetAllRefs(Refs, Fd->getType());
        }
    }

    return;
}

std::optional<Dcp::MyTypeDef> Dcp::MyAstVisitor::GetTypeDef(const TypedefDecl* Td)
{
    const SourceLocation Sl = Td->getLocation();

    const SourceManager& Sm = Context.getSourceManager();
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
        if (Rd->getName().empty())
        {
            Def.bComplex = true;

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
            Def.ComplexBeginLine = Sm.getSpellingLineNumber(BeginSl);
            Def.ComplexBeginColumn = Sm.getSpellingColumnNumber(BeginSl);

            if (std::optional<MyRecord> Record = this->GetRecord(Rd, true); Record.has_value())
            {
                for (const MyRecordRef& R : Record->Records)
                {
                    Def.Records.emplace(R);
                }
            }
        }
        else
        {
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
            Def.bComplex = true;
            Def.Type = "enum";
            SourceLocation BeginSl = Ed->getBeginLoc();
            Def.ComplexBeginLine = Sm.getSpellingLineNumber(BeginSl);
            Def.ComplexBeginColumn = Sm.getSpellingColumnNumber(BeginSl);
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

    if (Def.bComplex == false)
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

    const SourceLocation Sl = Rd->getLocation();

    const SourceManager& Sm = Context.getSourceManager();
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

    return Record;
}

std::optional<Dcp::MyDecl> Dcp::MyAstVisitor::GetRecordDecl(const RecordDecl* Rd)
{
    if (::IsDeclInTranslationUnit(Rd) == false)
    {
        return { };
    }

    dcp_check( Rd->isStruct() || Rd->isUnion() || Rd->isEnum() )

    const SourceLocation Sl = Rd->getLocation();

    const SourceManager& Sm = this->Context.getSourceManager();
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

    const SourceLocation Sl = Ed->getLocation();

    const SourceManager& Sm = this->Context.getSourceManager();
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

    MyEnumRecord Record;
    Record.Identifier += "enum ";
    Record.Identifier += Ed->getIdentifier()->getName().str();
    Record.Source = std::move(AbsF);
    Record.Line = static_cast<int64_t>(Sm.getSpellingLineNumber(Sl));
    Record.Column = static_cast<int64_t>(Sm.getSpellingColumnNumber(Sl));

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
            Record.AddRecordRef(std::move(Ref));
        }
    }

    return Record;
}

std::optional<Dcp::MyDecl> Dcp::MyAstVisitor::GetEnumDecl(const EnumDecl* Ed)
{
    if (::IsDeclInTranslationUnit(Ed) == false)
    {
        return { };
    }

    const SourceLocation Sl = Ed->getLocation();

    const SourceManager& Sm = this->Context.getSourceManager();
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

    const SourceLocation Sl = Fd->getLocation();
    const SourceManager& Sm = this->Context.getSourceManager();
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

    MyFunction Func;
    Func.Identifier = Fd->getQualifiedNameAsString();
    Func.Source = std::move(AbsF);
    Func.Line = static_cast<int64_t>(Sm.getSpellingLineNumber(Sl));
    Func.Column = static_cast<int64_t>(Sm.getSpellingColumnNumber(Sl));

    Func.bStatic = Fd->isStatic();

    QualType QtRet = Fd->getReturnType();
    Func.Ret = QtRet.getAsString();
    QtRet = ::GetBasicName(std::move(QtRet));
    if (QtRet->hasUnnamedOrLocalType() == false)
    {
        MyRecordRef Ref;
        Ref.Ref = QtRet.getAsString();
        Func.AddRecordRef(std::move(Ref));
    }

    for (const ParmVarDecl* Param : Fd->parameters())
    {
        MyFunction::Param P;
        P.Type = Param->getType().getAsString();
        P.Identifier = Param->getName().str();
        Func.Params.emplace_back(std::move(P));

        QualType Qt = Param->getType();
        Qt = ::GetBasicName(std::move(Qt));
        if (Qt->hasUnnamedOrLocalType())
        {
            continue;
        }

        MyRecordRef Ref;
        Ref.Ref = Qt.getAsString();
        Func.AddRecordRef(std::move(Ref));

        continue;
    }

    MyTypeCollector TypeCollector;
    TypeCollector.TraverseDecl(Fd);
    for (const QualType& Type : TypeCollector.GetCollectables())
    {
        MyRecordRef Ref;
        Ref.Ref = Type.getAsString();
        Func.AddRecordRef(std::move(Ref));

        continue;
    }

    MyVarRefCollector RefCollector {Fd, this->Context};
    RefCollector.TraverseFunction();
    for (const VarDecl* Vd : RefCollector.GetExternalReferences())
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

        Func.AddVarRef(std::move(Ref));

        continue;
    }

    MyFuncPointerCollector FCollector {Fd, this->Context};
    FCollector.TraverseFunction();
    for (const FunctionDecl* _Fd : FCollector.GetFds())
    {
        dcp_check( _Fd )

        MyDecl Fwd;
        Fwd.Identifier = Func.Identifier;
        Fwd.Line = Func.Line;
        Fwd.Column = Func.Column;
        Fwd.Source = Func.Source;
        Fwd.bStatic = Func.bStatic ? EDeclBool::True : EDeclBool::False;
        Fwd.bExtern = EDeclBool::None;

        MyFunctionRef Ref;
        Ref.Caller = Fwd;
        Ref.Ref = _Fd->getQualifiedNameAsString();

        PutToIntermediate(Ref);

        continue;
    }

    return Func;
}

std::optional<Dcp::MyDecl> Dcp::MyAstVisitor::GetFunctionDecl(const FunctionDecl* Fd)
{
    const SourceLocation Sl = Fd->getLocation();
    const SourceManager& Sm = this->Context.getSourceManager();
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
    if (Callee == nullptr || Sm.isInSystemHeader(Callee->getLocation()))
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

    return Ref;
}
