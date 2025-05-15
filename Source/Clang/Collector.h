#pragma once

#include "Fwd.h"
#include <clang/AST/RecursiveASTVisitor.h>
#include <set>

namespace Dcp
{

class MyTypeCollector : public clang::RecursiveASTVisitor<MyTypeCollector>
{
public:

    DCP_API bool VisitVarDecl(const clang::VarDecl* Vd);
    DCP_API bool VisitCallExpr(const clang::CallExpr* Ce);

    const std::vector<clang::QualType>& GetCollectables() const { return this->Collectables; }

private:

    bool AddQualifiedType(clang::QualType&& Qt);

    std::vector<clang::QualType> Collectables;
};

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

} /* ~Namespace Dcp */
