#include "Build.h"
#include "ModPass.h"
#include "Out.h"
#include <dwarf.h>
#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/Support/Path.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/DebugInfo.h>

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

bool Dcp::AnalyzedMod::AddNode(ModType&& Node)
{
    dcp_check( Node.IsValid() )

    if (std::find(this->Types.begin(), this->Types.end(), Node) == this->Types.end())
    {
        this->Types.emplace_back(std::move(Node));
        return true;
    }

    return false;
}

bool Dcp::ModGlobal::IsValid() const
{
    if (const bool bValid = MyNode::IsValid(); bValid == false)
    {
        return false;
    }

    return this->Type.size() > 0;
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

            const DIType* DiTy = DiGv->getType();
            dcp_check( DiTy )
            G.Type = DiTy->getName().str();

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
    dcp_check( M.getNamedMetadata("llvm.dbg.cu") )

    for (const StructType* STy : M.getIdentifiedStructTypes())
    {
        const DIType* DiTy = FindDiTypeChecked(M, static_cast<dwarf::Tag>(DW_TAG_structure_type), STy->getName());

        ModType Ty;
        Ty.Identifier = STy->getName().str();
        Ty.Source = DiTy->getDirectory().str() + '/' + DiTy->getFilename().str();
        Ty.Line = static_cast<int>(DiTy->getLine());

        Out->AddNode(std::move(Ty));
        continue;
    }

    return;
}
