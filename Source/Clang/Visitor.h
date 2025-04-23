#pragma once

#include "Symbols.h"
#include <clang/AST/RecursiveASTVisitor.h>

namespace Dcp
{

class MyAstVisitor : public clang::RecursiveASTVisitor<MyAstVisitor>
{
public:

    explicit MyAstVisitor(clang::ASTContext& C) : Context(C) { }

    DCP_API bool VisitTypedefDecl(const clang::TypedefDecl* Td);
    DCP_API bool VisitRecordDecl(const clang::RecordDecl* Rd);
    DCP_API bool VisitEnumDecl(const clang::EnumDecl* Ed);
    DCP_API bool VisitFunctionDecl(const clang::FunctionDecl* Fd);
    DCP_API bool VisitCallExpr(const clang::CallExpr* Ce);

private:

    clang::ASTContext& Context;
};

} /* ~Namespace Dcp */
