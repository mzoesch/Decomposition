#include "Build.h"
#include "ModPass.h"
#include "Out.h"
#include "dwarf.h"
#include "llvm/IR/DebugLoc.h"
#include "llvm/Support/Path.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/DebugInfo.h"

using namespace llvm;

bool Dcp::AnalyzedMod::AddNode(ModGlobal&& Node)
{
    dcp_check( Node.IsValid() )

    if (std::find(this->Globals.begin(), this->Globals.end(), Node) == this->Globals.end())
    {
        this->Globals.emplace_back(std::move(Node));
        return true;
    }

    return false;
}

PreservedAnalyses Dcp::ModDecompositionPass::run(Module& M, ModuleAnalysisManager& Mam)
{
    AnalyzedMod Mod
    {
        .Identifier = M.getName().str(),
    };

    this->GetAllGlobals(&Mod, M);
    this->GetAllTypes(&Mod, M);

    PutToIntermediate(std::move(Mod));
    return PreservedAnalyses::all();
}

void Dcp::ModDecompositionPass::GetAllGlobals(AnalyzedMod* Out, const Module& M)
{
    dcp_check( Out )

    for (const GlobalVariable& Gv : M.globals())
    {
        SmallVector<DIGlobalVariableExpression*> DiGves(1);
        Gv.getDebugInfo(DiGves);

        if (Gv.getName().starts_with('.')) // Internal stuff. We do not care.
        {
            continue;
        }

        ModGlobal G;
        G.Identifier = Gv.getName().str();

        for (const DIGlobalVariableExpression* Expr: DiGves)
        {
            if (Expr == nullptr)
            {
                continue;
            }

            const DIGlobalVariable* DiGv = Expr->getVariable();
            if (DiGv == nullptr)
            {
                continue;
            }

            const DIFile* File = DiGv->getFile();
            dcp_check( File )

            G.Line = static_cast<int>(DiGv->getLine());
            G.Source = File->getDirectory().str() + '/' + File->getFilename().str();

            break;
        }

        Out->AddNode(std::move(G));
        continue;
    }

    return;
}

void Dcp::ModDecompositionPass::GetAllTypes(AnalyzedMod* Out, const Module& M)
{
    dcp_check( Out )
    NamedMDNode *CU_Nodes = M.getNamedMetadata("llvm.dbg.cu");
    if (!CU_Nodes) {
        errs() << "No debug information found.\n";
        return;
    }


    return;
}
