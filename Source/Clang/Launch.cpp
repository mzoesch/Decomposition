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

#if WITH_GDB_LINUX
    #include <sys/stat.h>
    #include <fcntl.h>
    #include <ctype.h>
#endif /* WITH_GDB_LINUX */

using namespace clang;
using namespace ast_matchers;
namespace fs = std::filesystem;

#if WITH_GDB_LINUX
namespace Dcp
{

bool bWaitForDebuggerOnFail { false };

bool IsGdb()
{
    char Buffer[4096];

    const int Fd = ::open("/proc/self/status", O_RDONLY);
    if (Fd == -1)
    {
        return false;
    }

    const ssize_t num_read = ::read(Fd, Buffer, sizeof(Buffer) - 1);
    ::close(Fd);

    if (num_read <= 0)
    {
        return false;
    }

    Buffer[num_read] = '\0';
    constexpr char PidTracerString[] = "TracerPid:";
    const char* PidTracer = ::strstr(Buffer, PidTracerString);
    if (!PidTracer)
    {
        return false;
    }

    for (const char* characterPtr = PidTracer + sizeof(PidTracerString) - 1; characterPtr <= Buffer + num_read; ++characterPtr)
    {
        if (::isspace(*characterPtr))
        {
            continue;
        }

        return ::isdigit(*characterPtr) != 0 && *characterPtr != '0';
    }

    return false;
}

} /* ~Namespace Dcp */
#endif /* WITH_GDB_LINUX */

namespace
{

#if WITH_GDB_LINUX

bool bWaitForDebugger { false };

#endif /* WITH_GDB_LINUX */

class MyFrontendAction final : public PluginASTAction
{
protected:

    std::unique_ptr<ASTConsumer> CreateASTConsumer(CompilerInstance& Ci, StringRef) override
    {
#if WITH_GDB_LINUX
        if (bWaitForDebugger)
        {
            llvm::outs() << "Waiting for gdb...\n";
            llvm::outs().flush();
        }
        bool bWaitedAtLeastOnce { false };
        while (::bWaitForDebugger && Dcp::IsGdb() == false)
        {
            bWaitedAtLeastOnce = true;
            constexpr int WaitSeconds { 1 };
            if constexpr (constexpr int Milli = static_cast<int>(WaitSeconds * (1e+6)); Milli > 0)
            {
                usleep(Milli);
            }

            continue;
        }
        if (bWaitedAtLeastOnce && Dcp::IsGdb())
        {
            DEBUG_TRAB()
        }
#endif /* WITH_GDB_LINUX */

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
        for (const std::string& Arg : args)
        {
            llvm::outs() << "Arg: " << Arg << "\n";
            llvm::outs().flush();

            if (Arg == "-WaitForDebugger")
            {
                ::bWaitForDebugger = true;
            }

            if (Arg == "-WaitForDebuggerOnFail")
            {
                Dcp::bWaitForDebuggerOnFail = true;
            }

            continue;
        }

        return true;
    }
};

} /* ~Namespace <Anonymous> */

static FrontendPluginRegistry::Add<MyFrontendAction> X("decomposition", "Helper plugin for decomposition information gathering.");
