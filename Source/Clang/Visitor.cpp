#include "Visitor.h"
#include "Out.h"
#include "Collector.h"
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

    const QualType Ut = Td->getUnderlyingType();

    PrintingPolicy Policy(Td->getASTContext().getLangOpts());
    Policy.SuppressTagKeyword = false;

    MyTypeDef Def;
    Def.Identifier = Td->getName();
    dcp_check( Def.Identifier.empty() == false )
    Def.Source = std::move(AbsF);
    dcp_check( Def.Source.empty() == false )
    Def.Line = static_cast<int64_t>(Sm.getSpellingLineNumber(Sl));
    Def.Column = static_cast<int64_t>(Sm.getSpellingColumnNumber(Sl));

    if (const RecordType* Rt = Ut->getAs<RecordType>(); Rt)
    {
        const RecordDecl* Rd = Rt->getDecl();
        dcp_check( Rd )
        if (Rd->getName().empty())
        {
            Def.What = '?';
        }
        else
        {
            Def.Type = Rd->getName();
        }
    }
    else if (const EnumType* Et = Ut->getAs<EnumType>(); Et)
    {
        const EnumDecl* Ed = Et->getDecl();
        dcp_check( Ed )
        if (Ed->getName().empty())
        {
            Def.What = '?';
        }
        else
        {
            Def.Type = Ed->getName();
        }
    }
    if (Def.What.empty())
    {
        std::string Buf;
        llvm::raw_string_ostream OStream(Buf);
        Ut.print(OStream, Policy, Td->getName());
        OStream.flush();
        Def.What = std::move(Buf);
    }

    dcp_check( Def.What.empty() == false )

    return Def;
}

std::optional<Dcp::MyRecord> Dcp::MyAstVisitor::GetRecord(const RecordDecl* Rd)
{
    if (
           Rd->isThisDeclarationADefinition() == false
        || Rd->isAnonymousStructOrUnion()
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

    if (AbsF.empty() || Rd->getIdentifier() == nullptr)
    {
        return { };
    }

    MyRecord Record;
    Record.Identifier = Rd->getIdentifier()->getName().str();
    Record.Source = std::move(AbsF);
    Record.Line = static_cast<int64_t>(Sm.getSpellingLineNumber(Sl));
    Record.Column = static_cast<int64_t>(Sm.getSpellingColumnNumber(Sl));

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
        Make this scan recursivly through all fields: @see yaml_event_s.h
        QualType Qt = Field->getType();
        Qt = ::GetBasicName(std::move(Qt));

        if (Qt->hasUnnamedOrLocalType())
        {
            continue;
        }

        MyRecordRef Ref;
        Ref.Ref = Qt.getAsString();
        Record.AddRecord(std::move(Ref));

        continue;
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
            Record.AddRecord(std::move(Ref));
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
        Func.AddRecord(std::move(Ref));

        continue;
    }

    MyTypeCollector Collector;
    Collector.TraverseDecl(Fd);
    for (const auto& Type: Collector.GetCollectables())
    {
        MyRecordRef Ref;
        Ref.Ref = Type.getAsString();
        Func.AddRecord(std::move(Ref));
        continue;
    }

    return Func;
}

std::optional<Dcp::MyFunctionRef> Dcp::MyAstVisitor::GetFunctionRef(const CallExpr* Ce)
{
    const SourceManager& Sm = this->Context.getSourceManager();

    const FunctionDecl* Callee = Ce->getDirectCallee();
    if (Callee == nullptr || Callee->hasBody() || Sm.isInSystemHeader(Callee->getLocation()))
    {
        return { };
    }

    DynTypedNodeList parents = this->Context.getParents(DynTypedNode::create(*Ce));
    const FunctionDecl* Caller = nullptr;
    while (parents.empty() == false)
    {
        for (const DynTypedNode& parent: parents)
        {
            if (const FunctionDecl *FD = parent.get<FunctionDecl>())
            {
                Caller = FD;
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
