#include "llvm/Pass.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

using namespace llvm;

#define PLUGIN_NAME "decomposition-plugin"

namespace
{

struct DecompositionPass : public PassInfoMixin<DecompositionPass>
{
    PreservedAnalyses run(Function& F, FunctionAnalysisManager&)
    {

        errs() << "F: " << F.getName() << "\n";
        return PreservedAnalyses::all();
    }
};

} /* ~Namespace <Anonymous> */

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo()
{
    errs() << "Registering decomposition plugin.\n";

    return
    {
        LLVM_PLUGIN_API_VERSION, PLUGIN_NAME, LLVM_VERSION_STRING,
        [](PassBuilder &PB)
        {
            PB.registerPipelineParsingCallback(
            [](StringRef Name, FunctionPassManager &FPM, ArrayRef<PassBuilder::PipelineElement>)
            {
                if (Name == PLUGIN_NAME)
                {
                    FPM.addPass(DecompositionPass());
                    return true;
                }

                return false;
            });
        }
    };
}

#undef PLUGIN_NAME
