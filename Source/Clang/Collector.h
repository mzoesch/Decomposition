#pragma once

#include "Fwd.h"
#include <clang/AST/RecursiveASTVisitor.h>

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

} /* ~Namespace Dcp */
