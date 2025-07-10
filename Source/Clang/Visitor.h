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
    DCP_API bool VisitFunctionDecl(clang::FunctionDecl* Fd);
    DCP_API bool VisitCallExpr(const clang::CallExpr* Ce);

    DCP_API void GetAllRefs(std::set<MyRecordRef>* Refs, clang::QualType&& InQt);

private:

    auto GetTypeDef(const clang::TypedefDecl* Td) -> std::optional<MyTypeDef>;
    auto GetRecord(const clang::RecordDecl* Rd, const bool bAllowAnonymous = false) -> std::optional<MyRecord>;
    auto GetEnum(const clang::EnumDecl* Ed) -> std::optional<MyEnumRecord>;
    auto GetFunctionForward(const clang::FunctionDecl* Fd) -> std::optional<MyFunctionForward>;
    auto GetFunction(clang::FunctionDecl* Fd) -> std::optional<MyFunction>;
    auto GetFunctionDecl(clang::FunctionDecl* Fd) -> std::optional<MyFunctionDecl>;
    auto GetFunctionRef(const clang::CallExpr* Ce) -> std::optional<MyFunctionRef>;

    clang::ASTContext& Context;
};

} /* ~Namespace Dcp */
