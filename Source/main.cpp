#include "llvm/Pass.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

using namespace llvm;

#define PLUGIN_NAME "decomposition-plugin"
#define DP_PLUGIN_NAME "decomposition-plugin-fp"
#define SCCDP_PLUGIN_NAME "decomposition-plugin-sccp"

namespace
{

struct DecompositionPass : public PassInfoMixin<DecompositionPass>
{
    PreservedAnalyses run(Function& F, FunctionAnalysisManager& Fam)
    {
        errs() << "F: " << F.getName() << "\n";
        return PreservedAnalyses::all();
    }
};

struct SCCDecompositionPass : public PassInfoMixin<SCCDecompositionPass>
{
    PreservedAnalyses run(LazyCallGraph::SCC &SCC, CGSCCAnalysisManager &AM, LazyCallGraph &CG, CGSCCUpdateResult &UR)
    {
        for (LazyCallGraph::Node &Node : SCC)
        {
            Function &F = Node.getFunction();
            errs() << "SCC F: " << F.getName() << "\n";
        }

        return PreservedAnalyses::all();
    }
};

} /* ~Namespace <Anonymous> */

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo()
{
    return
    {
        LLVM_PLUGIN_API_VERSION, PLUGIN_NAME, LLVM_VERSION_STRING,
        [](PassBuilder& PB)
        {
            PB.registerPipelineParsingCallback([](StringRef Name, FunctionPassManager& FPM, ArrayRef<PassBuilder::PipelineElement>)
            {
                if (Name == DP_PLUGIN_NAME)
                {
                    FPM.addPass(DecompositionPass());
                    return true;
                }

                return false;
            });
            PB.registerPipelineParsingCallback([](StringRef Name, CGSCCPassManager& CGPM, ArrayRef<PassBuilder::PipelineElement>)
            {
                if (Name == SCCDP_PLUGIN_NAME)
                {
                    CGPM.addPass(SCCDecompositionPass());
                    return true;
                }

                return false;
            });
        }
    };
}

#undef PLUGIN_NAME
#undef DP_PLUGIN_NAME
#undef SCCDP_PLUGIN_NAME
