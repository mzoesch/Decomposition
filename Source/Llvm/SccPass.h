#pragma once

#include "Build.h"
#include "Shared.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"

#define SCCDP_PLUGIN_NAME "decomposition-plugin-sccp"

namespace Dcp
{

struct AnalyzedScc;
struct SccFunctionRef;
struct SccFunction;
struct SccTypeRef;
struct SccGlobalRef;

/** Represents a minimalistic scc. */
struct AnalyzedScc final
{
    std::string Parent;
    std::string Identifier;

    std::vector<SccFunctionRef> FunctionsRefs;
    std::vector<SccFunction>    Functions;

    std::vector<SccTypeRef> TypeRefs;

    std::vector<SccGlobalRef> GlobalRefs;

    /** @return True if added. */
    DCP_API bool AddNode(SccFunctionRef&& Node);
    DCP_API bool AddNode(SccFunction&& Node);

    DCP_API bool AddNode(SccTypeRef&& Node);

    DCP_API bool AddNode(SccGlobalRef&& Node);
};

/** Function node reference. */
struct SccFunctionRef final : public MyNodeRef
{
    DCP_API virtual bool IsValid() const override;
};

/** Function node definition. */
struct SccFunction final : public MyNode
{
    int EndLine = INDEX_NONE;

    /** All includes until function definition. */
    std::vector<std::string> Includes;

    DCP_API virtual bool operator==(const SccFunction& Other) const;
    DCP_API virtual bool IsValid() const override;
};

/** Type node reference. */
struct SccTypeRef final : public MyNodeRef
{
};

/** Global node reference. */
struct SccGlobalRef final : public MyNodeRef
{
};

struct DCP_API SCCDecompositionPass : public llvm::PassInfoMixin<SCCDecompositionPass>
{
    llvm::PreservedAnalyses run
    (
        llvm::LazyCallGraph::SCC&   Scc,
        llvm::CGSCCAnalysisManager& Am,
        llvm::LazyCallGraph&        Cg,
        llvm::CGSCCUpdateResult&    Ur
    );

private:

    void AnalyzeFunctions(AnalyzedScc* Out, const llvm::LazyCallGraph::SCC& Scc);
    void AnalyzeIncludes(SccFunction* Out, const llvm::Function& F, const int UntilLine = INDEX_NONE);
    void AnalyzeFunctionRefs(AnalyzedScc* Out, const llvm::LazyCallGraph::SCC& Scc);
    void AnalyzeFunctionRefs(AnalyzedScc* Out, const llvm::Function& F);
    void AnalyzeStructs(AnalyzedScc* Out, const llvm::LazyCallGraph::SCC& Scc);
    void AnalyzeStructs(AnalyzedScc* Out, const llvm::Module& M, const llvm::Function& F);
    void AnalyzeGlobals(AnalyzedScc* Out, const llvm::LazyCallGraph::SCC& Scc);
};

} /* ~Namespace Dcp */
