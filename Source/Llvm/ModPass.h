#pragma once

#include "Build.h"
#include "Shared.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"

#define MODDP_PLUGIN_NAME "decomposition-plugin-mp"

namespace Dcp
{

struct AnalyzedMod;
struct ModGlobal;

/** Represents a module. */
struct AnalyzedMod final
{
    std::string Identifier;

    std::vector<ModGlobal> Globals;

    /** @return True if added. */
    DCP_API bool AddNode(ModGlobal&& Node);
};

struct ModGlobal final : public MyNode
{
};

struct DCP_API ModDecompositionPass : public llvm::PassInfoMixin<ModDecompositionPass>
{
    llvm::PreservedAnalyses run
    (
        llvm::Module& M,
        llvm::ModuleAnalysisManager& Mam
    );

private:

    void GetAllGlobals(AnalyzedMod* Out, const llvm::Module& M);
    void GetAllTypes(AnalyzedMod* Out, const llvm::Module& M);
};

} /* ~Namespace Dcp */
