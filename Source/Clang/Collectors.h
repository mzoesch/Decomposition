#pragma once

#include "Fwd.h"
#include <clang/AST/RecursiveASTVisitor.h>
#include <set>

namespace Dcp
{

class MyVarRefCollector : public clang::RecursiveASTVisitor<MyVarRefCollector>
{
public:

    MyVarRefCollector(clang::FunctionDecl* FD, clang::ASTContext& Context)
        : Fd(FD), Context(Context) {}

    inline void TraverseFunction()
    {
        TraverseStmt(Fd->getBody());
    }

    DCP_API bool VisitDeclRefExpr(const clang::DeclRefExpr* Dre);

    const std::set<const clang::VarDecl*>& GetExternalReferences() const
    {
        return this->Refs;
    }

private:

    clang::FunctionDecl* Fd;
    clang::ASTContext& Context;
    std::set<const clang::VarDecl*> Refs;
};

class MyFuncPointerCollector : public clang::RecursiveASTVisitor<MyFuncPointerCollector>
{
public:

    MyFuncPointerCollector(clang::FunctionDecl* FD, clang::ASTContext& Context)
        : Fd(FD), Context(Context) {}

    inline void TraverseFunction()
    {
        TraverseStmt(Fd->getBody());
    }

    DCP_API bool VisitVarDecl(const clang::VarDecl* Vd);
    DCP_API bool VisitBinaryOperator(const clang::BinaryOperator* Bo);

    const std::set<const clang::FunctionDecl*>& GetFds() const
    {
        return this->Fds;
    }

private:

    clang::FunctionDecl* Fd;
    clang::ASTContext& Context;
    std::set<const clang::FunctionDecl*> Fds;
};

class MyRefCollector : public clang::RecursiveASTVisitor<MyRefCollector>
{
public:

    bool shouldVisitImplicitCode() const { return true; }

    DCP_API bool VisitCallExpr(clang::CallExpr* Ce);
    DCP_API bool VisitVarDecl(const clang::VarDecl* Vd);
    DCP_API bool VisitDeclRefExpr(const clang::DeclRefExpr* Dre);
    DCP_API bool VisitFieldDecl(const clang::FieldDecl* Fd);
    DCP_API bool VisitParmVarDecl(const clang::ParmVarDecl* Pd);
    DCP_API bool VisitUnaryExprOrTypeTraitExpr(clang::UnaryExprOrTypeTraitExpr* E);
    DCP_API bool VisitUnaryOperator(clang::UnaryOperator* Uo);
    DCP_API bool VisitBinaryOperator(const clang::BinaryOperator* Bo);
    DCP_API bool VisitMemberExpr(const clang::MemberExpr* Me);

    DCP_API void AddQualRecord(const clang::QualType Qt);

    clang::SourceManager const* Sm{};
    std::set<MyRecordRef> Refs;
};

} /* ~Namespace Dcp */
