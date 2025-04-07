#include "Build.h"
#include "Out.h"
#include "MyConsumer.h"
#include "clang/AST/ASTConsumer.h"
#include "clang/AST/RecursiveASTVisitor.h"
#include "clang/Frontend/FrontendPluginRegistry.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/ASTMatchers/ASTMatchFinder.h"
#include "clang/Frontend/FrontendActions.h"
#include "clang/AST/ASTContext.h"
#include "clang/AST/Decl.h"
#include "llvm/ADT/StringRef.h"

using namespace clang;
using namespace ast_matchers;

namespace
{

class MyASTVisitor : public RecursiveASTVisitor<MyASTVisitor>
{
public:
    explicit MyASTVisitor(ASTContext *Context) : Context(Context) {}

    bool VisitTypedefDecl(const TypedefDecl* D)
    {
        using namespace Predcp;

        if (Context == nullptr)
        {
            llvm::errs() << "Context is null\n";
            return true;
        }

        // Get the source location of the typedef
        SourceLocation loc = D->getLocation();

        // Get the filename and line number from the source location
        const SourceManager &SM = Context->getSourceManager();
        FileID fileID = SM.getFileID(loc);
        if (fileID.isInvalid()) {
            llvm::outs() << "Invalid location for typedef: " << D->getNameAsString() << "\n";
            return true;
        }

        std::string filePath = SM.getFilename(loc).str();
        if (this->IsSystemHeader(filePath))
        {
            return true;
        }

        // Get the actual line and column
        unsigned line = SM.getSpellingLineNumber(loc);
        unsigned column = SM.getSpellingColumnNumber(loc);

        MyTypeDef Def;
        Def.Identifier = D->getNameAsString();
        Def.Source = filePath;
        Def.Line = line;
        Def.Column = column;

        PutToIntermediate(std::move(Def));

        // // Print the typedef name and its source location
        // llvm::outs() << "Found typedef: " << D->getNameAsString()
        //              << " at " << SM.getFilename(loc).str()
        //              << ":" << line << ":" << column << "\n";

        return true;
    }

private:

    bool IsSystemHeader(const std::string &filePath)
    {
        if (filePath.find("/usr/include") != std::string::npos ||
            filePath.find("/lib/") != std::string::npos ||
            filePath.find("clang") != std::string::npos) {
            return true;
        }
        return false;
    }

    ASTContext *Context;
};

class MyASTConsumer final : public ASTConsumer
{
public:

    void HandleTranslationUnit(ASTContext& Context) override
    {
        MyASTVisitor Visitor(&Context);
        Visitor.TraverseDecl(Context.getTranslationUnitDecl());
        return;
    }
};

class MyFrontendAction final : public PluginASTAction
{
protected:

    std::unique_ptr<ASTConsumer> CreateASTConsumer(CompilerInstance& CI, StringRef) override
    {
        const HeaderSearchOptions& HeaderOpts = CI.getHeaderSearchOpts();
        for (const HeaderSearchOptions::Entry& IncludePath: HeaderOpts.UserEntries)
        {
            // All include paths...
        }
        return std::make_unique<MyASTConsumer>();
    }

    bool ParseArgs(const CompilerInstance& CI, const std::vector<std::string>& args) override
    {
        return true;
    }
};

} /* ~Namespace <Anonymous> */

static FrontendPluginRegistry::Add<MyFrontendAction> X("decomposition-plugin-preprocessor", "Helper plugin for decomposition.");
