#include "Visitor.h"
#include "Out.h"
#include "Collectors.h"
#include <clang/AST/ParentMapContext.h>
#include <clang/Basic/SourceManager.h>
#include <oneapi/tbb/detail/_exception.h>

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
    while (Qt->isPointerType() || Qt->isReferenceType())
    {
        Qt = Qt->getPointeeType();
    }

    Qt = Qt.getUnqualifiedType();

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

    return true;
}

bool Dcp::MyAstVisitor::VisitEnumDecl(const EnumDecl* Ed)
{
    if (const std::optional<MyEnumRecord> Enum = this->GetEnum(Ed); Enum)
    {
        PutToIntermediate(*Enum);
    }

    return true;
}

bool Dcp::MyAstVisitor::VisitFunctionDecl(FunctionDecl* Fd)
{
    if (const std::optional<MyFunction> Func = this->GetFunction(Fd); Func)
    {
        PutToIntermediate(*Func);
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

void Dcp::MyAstVisitor::GetAllRefs(std::vector<MyRecordRef>* Refs, QualType&& InQt)
{
    dcp_check( Refs )

    QualType Qt = ::GetBasicName(std::move(InQt));

    if (Qt->hasUnnamedOrLocalType() == false)
    {
        MyRecordRef Ref;
        Ref.Ref = Qt.getAsString();
        if (std::find(Refs->begin(), Refs->end(), Ref) == Refs->end())
        {
            Refs->emplace_back(std::move(Ref));
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

    if (const RecordType* Rt = Qt->getAs<RecordType>())
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
    if (Dcp::IsModuleHeader(AbsF) == false)
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
            Def.Type = "struct";
            SourceLocation BeginSl = Rd->getBeginLoc();
            Def.ComplexBeginLine = Sm.getSpellingLineNumber(BeginSl);
            Def.ComplexBeginColumn = Sm.getSpellingColumnNumber(BeginSl);

            std::optional<MyRecord> Record = this->GetRecord(Rd, true);
            dcp_check( Record.has_value() )
            Def.ComplexTypeRef = *Record;
        }
        else
        {
            Def.Type = Rd->getName();
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
            Def.Type = Ed->getName();
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

    if (Rd->isStruct())
    {
        Record.Type = "struct";
    }
    else if (Rd->isEnum())
    {
        Record.Type = "enum";
    }
    else if (Rd->isUnion())
    {
        Record.Type = "union";
    }
    else
    {
        dcp_check( false )
    }

    for (const FieldDecl* Field: Rd->fields())
    {
        this->GetAllRefs(&Record.Records, Field->getType());
    }

    return Record;
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
    Record.Identifier = Ed->getIdentifier()->getName().str();
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

std::optional<Dcp::MyFunctionForward> Dcp::MyAstVisitor::GetFunctionForward(const FunctionDecl* Fd)
{
    if (Fd->isThisDeclarationADefinition() == false)
    {
        return { };
    }

    const SourceLocation Sl = Fd->getLocation();
    const SourceManager& Sm = this->Context.getSourceManager();
    const FileID IdF = Sm.getFileID(Sl);
    dcp_check( IdF.isValid() )

    std::string AbsF = Sm.getFilename(Sl).str();
    if (Dcp::IsModuleHeader(AbsF) == false)
    {
        return { };
    }

    if (AbsF.empty() || Fd->getName() == "")
    {
        return { };
    }

    dcp_check( Fd->hasBody() )

    MyFunctionForward Func;
    Func.Identifier = Fd->getQualifiedNameAsString();
    Func.Source = std::move(AbsF);
    Func.Line = static_cast<int64_t>(Sm.getSpellingLineNumber(Sl));
    Func.Column = static_cast<int64_t>(Sm.getSpellingColumnNumber(Sl));

    return Func;
}

std::optional<Dcp::MyFunction> Dcp::MyAstVisitor::GetFunction(FunctionDecl* Fd)
{
    std::optional<MyFunctionForward> FwdMaybe = this->GetFunctionForward(Fd);
    if (!FwdMaybe)
    {
        return { };
    }

    MyFunctionForward& Fwd = *FwdMaybe;
    MyFunction Func;
    Func.Identifier = std::move(Fwd.Identifier);
    Func.Source = std::move(Fwd.Source);
    Func.Line = Fwd.Line;
    Func.Column = Fwd.Column;

    Func.bStatic = Fd->isStatic();

    Func.Ret = Fd->getReturnType().getAsString();
    for (const ParmVarDecl* Param: Fd->parameters())
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
    for (const QualType& Type: TypeCollector.GetCollectables())
    {
        MyRecordRef Ref;
        Ref.Ref = Type.getAsString();
        Func.AddRecordRef(std::move(Ref));

        continue;
    }

    MyVarRefCollector RefCollector {Fd, this->Context};
    RefCollector.TraverseFunction();
    for (const VarDecl* Vd: RefCollector.GetExternalReferences())
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

        MyFunctionForward Fwd;
        Fwd.Identifier = Func.Identifier;
        Fwd.Line = Func.Line;
        Fwd.Column = Func.Column;
        Fwd.Source = Func.Source;

        MyFunctionRef Ref;
        Ref.Caller = Fwd;
        Ref.Ref = _Fd->getQualifiedNameAsString();

        PutToIntermediate(Ref);

        continue;
    }

    return Func;
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
    Ref.Caller = this->GetFunctionForward(Caller).value();
    Ref.Ref = Callee->getQualifiedNameAsString();

    return Ref;
}
