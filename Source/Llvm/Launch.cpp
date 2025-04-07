#include "Build.h"
#include "Out.h"
#include "SccPass.h"
#include "ModPass.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#if WITH_GDB_LINUX
    #include <sys/stat.h>
    #include <fcntl.h>
    #include <unistd.h>
    #include <ctype.h>
#endif /* WITH_GDB_LINUX */

using namespace llvm;

#define PLUGIN_NAME "decomposition-plugin"

namespace
{

#if WITH_GDB_LINUX
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
#endif /* WITH_GDB_LINUX */

} /* ~Namespace <Anonymous> */

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo()
{
#if WITH_GDB_LINUX
    while (::IsGdb() == false)
    {
        outs() << "Waiting for gdb...\n";
        outs().flush();
        constexpr int WaitSeconds = 1;
        if constexpr (constexpr int Milli = static_cast<int>(WaitSeconds * (1e+6)); Milli > 0)
        {
            usleep(Milli);
        }

        continue;
    }
#endif /* WITH_GDB_LINUX */

    return
    {
        LLVM_PLUGIN_API_VERSION, PLUGIN_NAME, LLVM_VERSION_STRING,
        [](PassBuilder& PB)
        {
            PB.registerPipelineParsingCallback([](StringRef Name, CGSCCPassManager& CGPM, ArrayRef<PassBuilder::PipelineElement>)
            {
                if (Name == SCCDP_PLUGIN_NAME)
                {
                    CGPM.addPass(Dcp::SCCDecompositionPass());
                    return true;
                }

                return false;
            });
            PB.registerPipelineParsingCallback([](StringRef Name, ModulePassManager& MPM, ArrayRef<PassBuilder::PipelineElement>)
            {
                if (Name == MODDP_PLUGIN_NAME)
                {
                    MPM.addPass(Dcp::ModDecompositionPass());
                    return true;
                }

                return false;
            });
        }
    };
}

#undef PLUGIN_NAME
#undef DP_PLUGIN_NAME
