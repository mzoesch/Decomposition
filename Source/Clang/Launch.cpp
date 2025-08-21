#include "Build.h"
#include "Out.h"
#include "Symbols.h"
#include "CompilerIncludePath.h"
#include "Consumer.h"
#include <clang/AST/ASTConsumer.h>
#include <clang/Frontend/FrontendPluginRegistry.h>
#include <clang/Frontend/CompilerInstance.h>
#include <clang/ASTMatchers/ASTMatchFinder.h>
#include <clang/Frontend/FrontendActions.h>
#include <llvm/ADT/StringRef.h>
#include <filesystem>

#if DCP_WITH_GDB_LINUX
    #include <sys/stat.h>
    #include <fcntl.h>
    #include <ctype.h>
#endif /* DCP_WITH_GDB_LINUX */

using namespace clang;
using namespace ast_matchers;
namespace fs = std::filesystem;

#if DCP_WITH_GDB_LINUX
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

namespace Dcp
{

std::string IrPath;

} /* ~Namespace Dcp */

namespace
{

#if DCP_WITH_GDB_LINUX

bool bWaitForDebugger { false };

#endif /* DCP_WITH_GDB_LINUX */

bool StrStartsWith(const std::string& Str, const std::string& Prefix)
{
    return Str.size() >= Prefix.size() && Str.compare(0, Prefix.size(), Prefix) == 0;
}

class MyFrontendAction final : public PluginASTAction
{
protected:

    std::unique_ptr<ASTConsumer> CreateASTConsumer(CompilerInstance& Ci, StringRef) override
    {
#if DCP_WITH_GDB_LINUX
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
            DEBUG_TRAP()
        }
#endif /* WITH_GDB_LINUX */

        const SourceManager& Sm = Ci.getSourceManager();
        const FileEntry* MainFile = Sm.getFileEntryForID(Sm.getMainFileID());
        if (MainFile == nullptr)
        {
            return nullptr;
        }

        std::vector<Dcp::CompilerIncludePath> XIncludes;
        const HeaderSearchOptions& HeaderOpts = Ci.getHeaderSearchOpts();
        for (const HeaderSearchOptions::Entry& Paths: HeaderOpts.UserEntries)
        {
            if (Paths.Group == 0 || Paths.Group == 1)
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
            if (::StrStartsWith(Arg, "-IrPath="))
            {
                Dcp::IrPath = Arg.substr(Arg.find('=') + 1);
                dcp_check( Dcp::IrPath.empty() == false )

                if (fs::exists(Dcp::IrPath) == false)
                {
                    fs::create_directories(Dcp::IrPath);
                }
            }

#if DCP_WITH_GDB_LINUX
            else if (Arg == "-WaitForDebugger")
            {
                ::bWaitForDebugger = true;
            }

            else if (Arg == "-WaitForDebuggerOnFail")
            {
                Dcp::bWaitForDebuggerOnFail = true;
            }
#endif /* DCP_WITH_GDB_LINUX */

            continue;
        }

        dcp_check( Dcp::IrPath.empty() == false )

        if (!Dcp::InitializeOutStream())
        {
            PRIVATE_DCP_FAIL_BOILERPLATE()
            llvm::report_fatal_error("Failed to initialize output stream.");

            return false;
        }

        return true;
    }
};

} /* ~Namespace <Anonymous> */

static FrontendPluginRegistry::Add<MyFrontendAction> X("decomposition", "Helper plugin for decomposition information gathering.");
