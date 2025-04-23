#include "Visitor.h"
#include "Out.h"
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

} /* ~Namespace <Anonymous> */

bool Dcp::MyAstVisitor::VisitTypedefDecl(const TypedefDecl* Td)
{
    const SourceLocation Sl = Td->getLocation();

    const SourceManager& Sm = Context.getSourceManager();
    const FileID IdF = Sm.getFileID(Sl);
    dcp_check( IdF.isValid() )

    std::string AbsF = Sm.getFilename(Sl).str();
    if (Dcp::IsModuleHeader(AbsF) == false)
    {
        return true;
    }

    const QualType Ut = Td->getUnderlyingType();

    PrintingPolicy Policy(Td->getASTContext().getLangOpts());
    Policy.SuppressTagKeyword = false;

    MyTypeDef Def;
    Def.Identifier = Td->getQualifiedNameAsString();
    Def.Source = std::move(AbsF);
    Def.Line = static_cast<int64_t>(Sm.getSpellingLineNumber(Sl));
    Def.Column = static_cast<int64_t>(Sm.getSpellingColumnNumber(Sl));


    std::string Buf;
    llvm::raw_string_ostream OStream(Buf);
    Ut.print(OStream, Policy, Td->getName());
    OStream.flush();
    Def.What = std::move(Buf);

    dcp_check( Def.What.empty() == false )

    PutToIntermediate(Def);

    return true;
}

bool Dcp::MyAstVisitor::VisitRecordDecl(const RecordDecl* Rd)
{
    if (
           Rd->isThisDeclarationADefinition() == false
        || Rd->isAnonymousStructOrUnion()
        || ::IsDeclInTranslationUnit(Rd) == false
        || Rd->getQualifiedNameAsString().find("::") != std::string::npos
    )
    {
        return true;
    }

    dcp_check( Rd->isStruct() || Rd->isUnion() || Rd->isEnum() )

    const SourceLocation Sl = Rd->getLocation();

    const SourceManager& Sm = Context.getSourceManager();
    const FileID IdF = Sm.getFileID(Sl);
    dcp_check( IdF.isValid() )

    std::string AbsF = Sm.getFilename(Sl).str();
    if (Dcp::IsModuleHeader(AbsF) == false)
    {
        return true;
    }

    if (AbsF.empty() || Rd->getQualifiedNameAsString() == "")
    {
        return true;
    }

    MyRecord Record;
    Record.Identifier = Rd->getQualifiedNameAsString();
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

    PutToIntermediate(Record);

    return true;
}

bool Dcp::MyAstVisitor::VisitEnumDecl(const EnumDecl* Ed)
{
    if (Ed->isThisDeclarationADefinition() == false)
    {
        return true;
    }

    dcp_check( Ed->isStruct() || Ed->isUnion() || Ed->isEnum() )

    const SourceLocation Sl = Ed->getLocation();

    const SourceManager& Sm = Context.getSourceManager();
    const FileID IdF = Sm.getFileID(Sl);
    dcp_check( IdF.isValid() )

    std::string AbsF = Sm.getFilename(Sl).str();
    if (Dcp::IsModuleHeader(AbsF) == false)
    {
        return true;
    }

    if (AbsF.empty() || Ed->getQualifiedNameAsString() == "")
    {
        return true;
    }

    MyRecord Record;
    Record.Identifier = Ed->getQualifiedNameAsString();
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

    PutToIntermediate(Record);

    return true;
}

bool Dcp::MyAstVisitor::VisitFunctionDecl(const FunctionDecl* Fd)
{
    if (Fd->isThisDeclarationADefinition() == false)
    {
        return true;
    }

    const SourceLocation Sl = Fd->getLocation();
    const SourceManager& Sm = Context.getSourceManager();
    const FileID IdF = Sm.getFileID(Sl);
    dcp_check( IdF.isValid() )

    std::string AbsF = Sm.getFilename(Sl).str();
    if (Dcp::IsModuleHeader(AbsF) == false)
    {
        return true;
    }

    if (AbsF.empty() || Fd->getName() == "")
    {
        return true;
    }

    MyFunction Func;
    Func.Identifier = Fd->getQualifiedNameAsString();
    Func.Source = std::move(AbsF);
    Func.Line = static_cast<int64_t>(Sm.getSpellingLineNumber(Sl));
    Func.Column = static_cast<int64_t>(Sm.getSpellingColumnNumber(Sl));
    Func.bStatic = Fd->isStatic();

    Func.Ret = Fd->getReturnType().getAsString();
    for (const ParmVarDecl* Param: Fd->parameters())
    {
        MyFunction::Param P;
        P.Type = Param->getType().getAsString();
        P.Identifier = Param->getName().str();
        Func.Params.emplace_back(std::move(P));
    }

    PutToIntermediate(Func);

    return true;
}

bool Dcp::MyAstVisitor::VisitCallExpr(const CallExpr* Ce)
{
    const SourceManager& Sm = this->Context.getSourceManager();

    const FunctionDecl* Callee = Ce->getDirectCallee();
    if (Callee == nullptr || Callee->hasBody() || Sm.isInSystemHeader(Callee->getLocation()))
    {
        return true;
    }

    DynTypedNodeList parents = Context.getParents(DynTypedNode::create(*Ce));
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

        parents = Context.getParents(parents[0]);
        continue;
    }
    dcp_check( Caller )

    const SourceLocation CallLoc = Caller->getLocation();

    MyFunctionRef Ref;
    Ref.Caller.Identifier = Caller->getQualifiedNameAsString();
    Ref.Caller.Source = Sm.getFilename(CallLoc).str();
    Ref.Caller.Line = static_cast<int64_t>(Sm.getSpellingLineNumber(CallLoc));
    Ref.Caller.Column = static_cast<int64_t>(Sm.getSpellingColumnNumber(CallLoc));
    Ref.Ref = Callee->getQualifiedNameAsString();

    PutToIntermediate(Ref);

    return true;
}
