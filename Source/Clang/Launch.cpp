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
#include <fstream>
#include <filesystem>

using namespace clang;
using namespace ast_matchers;
namespace fs = std::filesystem;

namespace
{

/*
class MyASTVisitor : public RecursiveASTVisitor<MyASTVisitor>
{
public:
    explicit MyASTVisitor(ASTContext* Context) : Context(Context) {}

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
        if (!this->IsModuleHeader(filePath))
        {
            return true;
        }

        const int line = static_cast<int>(SM.getSpellingLineNumber(loc));
        const int column = static_cast<int>(SM.getSpellingColumnNumber(loc));

        MyTypeDef Def;
        Def.Identifier = D->getNameAsString();
        Def.Source = filePath;
        Def.Line = line;
        Def.Column = column;
        // PutToIntermediate(std::move(Def));

        return true;
    }

private:

    bool IsModuleHeader(const std::string& InAbsolutePath)
    {
        if (InAbsolutePath.find("/usr/include") != std::string::npos ||
            InAbsolutePath.find("/lib/") != std::string::npos ||
            InAbsolutePath.find("clang") != std::string::npos) {
            return false;
        }
        return true;
    }

    ASTContext* Context;
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
*/

class MyFrontendAction final : public PluginASTAction
{
public:

    inline std::string GetRoot() const { return this->Root; }

protected:

    std::unique_ptr<ASTConsumer> CreateASTConsumer(CompilerInstance& CI, StringRef) override
    {
        const HeaderSearchOptions& HeaderOpts = CI.getHeaderSearchOpts();
        for (const HeaderSearchOptions::Entry& _: HeaderOpts.UserEntries)
        {
            // All include paths...
        }

        predcp_check( this->Root.empty() == false )
        return std::make_unique<Predcp::MyAstConsumer>(CI, this->Root);
    }

    bool ParseArgs(const CompilerInstance& CI, const std::vector<std::string>& args) override
    {
        for (unsigned i = 0; i < args.size(); ++i)
        {
            llvm::outs() << "Argument: " << args[i] << "\n";

            if (args[i] == "-dcp-root" && i + 1 < args.size())
            {
                this->Root = args[i + 1];
                if (this->Root[0] == '-')
                {
                    llvm::errs() << "Argument '-dcp-root' must be followed by a path.\n";
                    return false;
                }

                llvm::outs() << "Using root dir as: " << this->Root << "\n";
                return true;
            }

            continue;
        }

        if (fs::exists("dcp_args"))
        {
            std::ifstream File("dcp_args");
            if (File.is_open())
            {
                std::getline(File, this->Root);
                File.close();
                llvm::outs() << "Using root dir from file as: " << this->Root << "\n";
                return true;
            }
        }

        llvm::errs() << "Argument '-dcp-root' not found.\n";
        return false;
    }

    std::string Root;
};

} /* ~Namespace <Anonymous> */

static FrontendPluginRegistry::Add<MyFrontendAction> X("decomposition-plugin-preprocessor", "Helper plugin for decomposition.");
