#include "Build.h"
#include "Out.h"
#include "Symbols.h"
#include "MyXCompiler.h"
#include "Consumer.h"
#include <clang/AST/ASTConsumer.h>
#include <clang/Frontend/FrontendPluginRegistry.h>
#include <clang/Frontend/CompilerInstance.h>
#include <clang/ASTMatchers/ASTMatchFinder.h>
#include <clang/Frontend/FrontendActions.h>
#include <llvm/ADT/StringRef.h>
#include <filesystem>

using namespace clang;
using namespace ast_matchers;
namespace fs = std::filesystem;

namespace
{

class MyFrontendAction final : public PluginASTAction
{
protected:

    std::unique_ptr<ASTConsumer> CreateASTConsumer(CompilerInstance& Ci, StringRef) override
    {
        const SourceManager& Sm = Ci.getSourceManager();
        const FileEntry* MainFile = Sm.getFileEntryForID(Sm.getMainFileID());
        if (MainFile == nullptr)
        {
            return nullptr;
        }

        std::vector<Dcp::MyXCompilerInclude> XIncludes;
        const HeaderSearchOptions& HeaderOpts = Ci.getHeaderSearchOpts();
        for (const HeaderSearchOptions::Entry& Paths: HeaderOpts.UserEntries)
        {
            if (Paths.Group == 1)
            {
                Dcp::ModuleHeaderPaths.emplace_back(Paths.Path);
            }

            if (Dcp::IsModuleHeader(Paths.Path) == false)
            {
                continue;
            }

            XIncludes.emplace_back(Paths.Path, Paths.Group);
            continue;
        }
        Dcp::PutToIntermediate(MainFile->tryGetRealPathName(), XIncludes);

        return std::make_unique<Dcp::MyAstConsumer>(Ci);
    }

    bool ParseArgs(const CompilerInstance& CI, const std::vector<std::string>& args) override
    {
        return true;
    }
};

} /* ~Namespace <Anonymous> */

static FrontendPluginRegistry::Add<MyFrontendAction> X("decomposition-plugin", "Helper plugin for decomposition information gathering.");
