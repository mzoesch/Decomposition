#include "Build.h"
#include "SccPass.h"
#include "Out.h"
#include <dwarf.h>
#include <llvm/IR/DebugLoc.h>
#include <llvm/Support/Path.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/IR/DebugInfo.h>
#include <filesystem>
#include <fstream>

using namespace llvm;
namespace fs = std::filesystem;

namespace
{

std::string ToAbsolutePath(const DISubprogram& DiSp)
{
    const DIFile* File = DiSp.getFile();
    dcp_check( File )

    const std::string FileName = File->getFilename().str();
    const std::string DirName  = File->getDirectory().str();

    if (!DirName.empty() && !sys::path::is_absolute(FileName))
    {
        SmallString<256> Absolute(DirName);
        sys::path::append(Absolute, FileName);
        return Absolute.str().str();
    }

    return FileName;
}

const Module* FindModule(const LazyCallGraph::SCC& Scc)
{
    for (LazyCallGraph::Node& Node : Scc)
    {
        const Function& F = Node.getFunction();
        if (const Module* M = F.getParent(); M)
        {
            return M;
        }

        continue;
    }

    return nullptr;
}

const Module* FindModuleChecked(const LazyCallGraph::SCC& Scc)
{
    const Module* M = FindModule(Scc);
    dcp_check( M )
    return M;
}

struct StructDefinition
{
    std::string Name;
    std::string Filename;
    int Line = INDEX_NONE;
    bool IsValid() const
    {
        return this->Line != INDEX_NONE
            && this->Filename.size() > 0
            && this->Name.size() > 0;
    }
    std::string ToString() const
    {
        return this->Name + " (" + this->Filename + ":" + std::to_string(this->Line) + ")";
    }
};
StructDefinition FindStructDefinition(const StructType& STy, const Module& M)
{
    std::string STyName;
    if (STy.getName().starts_with("struct."))
    {
        STyName = STy.getName().substr(::strlen("struct."));
    }
    else
    {
        STyName = STy.getName();
    }

    DebugInfoFinder Finder;
    Finder.processModule(M);

    for (const DIType* DIComp : Finder.types())
    {
        if (DIComp->getTag() != DW_TAG_structure_type)
        {
            continue;
        }

        if (DIComp->getName() == STyName)
        {
            std::string AbsolutePath = DIComp->getDirectory().str() + '/' + DIComp->getFilename().str();
            return
            {
                DIComp->getName().str(),
                std::move(AbsolutePath),
                static_cast<int>(DIComp->getLine())
            };
        }

        continue;
    }

    return { };
}

} /* ~Namespace <Anonymous> */

bool Dcp::AnalyzedScc::AddNode(SccFunctionRef&& Node)
{
    dcp_check( Node.IsValid() )

    if (std::find(this->FunctionsRefs.begin(), this->FunctionsRefs.end(), Node) == this->FunctionsRefs.end())
    {
        this->FunctionsRefs.emplace_back(std::move(Node));
        return true;
    }

    return false;
}

bool Dcp::AnalyzedScc::AddNode(SccFunction&& Node)
{
    dcp_check( Node.IsValid() )

    if (std::find(this->Functions.begin(), this->Functions.end(), Node) == this->Functions.end())
    {
        this->Functions.emplace_back(std::move(Node));
        return true;
    }

    return false;
}

bool Dcp::AnalyzedScc::AddNode(SccTypeRef&& Node)
{
    dcp_check( Node.IsValid()  )

    if (std::find(this->TypeRefs.begin(), this->TypeRefs.end(), Node) == this->TypeRefs.end())
    {
        this->TypeRefs.emplace_back(std::move(Node));
        return true;
    }

    return false;
}

bool Dcp::AnalyzedScc::AddNode(SccGlobalRef&& Node)
{
    dcp_check( Node.IsValid() )

    if (std::find(this->GlobalRefs.begin(), this->GlobalRefs.end(), Node) == this->GlobalRefs.end())
    {
        this->GlobalRefs.emplace_back(std::move(Node));
        return true;
    }

    return false;
}

bool Dcp::SccFunctionRef::IsValid() const
{
    // There may be no debug information if we call a function from a different module.
    return this->Identifier.size() > 0;
}

bool Dcp::SccFunction::operator==(const SccFunction& Other) const
{
    if (const bool bEquals = MyNode::operator==(Other); bEquals == false)
    {
        return false;
    }

    return this->EndLine == Other.EndLine
        && this->Includes == Other.Includes;
}

bool Dcp::SccFunction::IsValid() const
{
    if (const bool bValid = MyNode::IsValid(); bValid == false)
    {
        return false;
    }

    for (const Param& Param : this->Params)
    {
        if (Param.Identifier.empty() || Param.Type.empty())
        {
            return false;
        }
    }

    return this->EndLine > INDEX_NONE && this->EndLine != std::numeric_limits<int>::max()
        && this->EndLine >= this->Line
        && this->Ret.size() > 0;
}

PreservedAnalyses Dcp::SCCDecompositionPass::run
(
    LazyCallGraph::SCC&   Scc,
    CGSCCAnalysisManager& Am,
    LazyCallGraph&        Cg,
    CGSCCUpdateResult&    Ur
)
{
    AnalyzedScc Nodes =
    {
        .Parent = FindModuleChecked(Scc)->getName().str(),
        .Identifier = Scc.getName(),
    };

    this->AnalyzeFunctions(&Nodes, Scc);
    this->AnalyzeFunctionRefs(&Nodes, Scc);
    this->AnalyzeStructs(&Nodes, Scc);
    this->AnalyzeGlobals(&Nodes, Scc);

    PutToIntermediate(std::move(Nodes));
    return PreservedAnalyses::all();
}

void Dcp::SCCDecompositionPass::AnalyzeFunctions(AnalyzedScc* Out, const LazyCallGraph::SCC& Scc)
{
    dcp_check( Out )

    for (LazyCallGraph::Node& NativeNode : Scc)
    {
        const Function& F = NativeNode.getFunction();
        dcp_check( F.isDeclaration() == false )

        const DISubprogram* DiSp = F.getSubprogram();
        dcp_check( DiSp )

        SccFunction Node;
        Node.Identifier = F.getName();
        Node.Source = ToAbsolutePath(*DiSp);
        Node.Line = static_cast<int>(DiSp->getLine());

        for (const BasicBlock& Bb : F)
        {
            const DebugLoc& Dl = Bb.getTerminator()->getDebugLoc();
            dcp_check( Dl )
            if (Node.EndLine < static_cast<int>(Dl->getLine()))
            {
                Node.EndLine = static_cast<int>(Dl->getLine());
            }

            continue;
        }

        const Type* RetTy = F.getReturnType();
        dcp_check( RetTy )
        if (RetTy->isVoidTy())
        {
            Node.Ret = "void";
        }
        else
        {
            if (const DISubroutineType* Type = DiSp->getType())
            {
                /* The first element is the return type. */
                if (DIType* ReturnType = Type->getTypeArray()[0])
                {
                    Node.Ret = ReturnType->getName().str();
                }
            }
        }

        for (const BasicBlock& BB: F)
        {
            for (const Instruction& Inst: BB)
            {
                for (DbgRecord& Dr: Inst.getDbgRecordRange())
                {
                    // How do we handle labels?
                    dcp_check( Dr.getRecordKind() == DbgRecord::ValueKind )

                    const DbgVariableRecord* Dvr = dyn_cast<DbgVariableRecord>(&Dr);
                    dcp_check( Dvr )

                    const DILocalVariable* DiLv = Dvr->getVariable();
                    dcp_check( DiLv )
                    dcp_check( DiLv->getScope() == DiSp )

                    // If #getArg() == 0, then it is a local variable
                    if (DiLv->getArg() == 0)
                    {
                        continue;
                    }

                    const DIType* DiTy = DiLv->getType();
                    dcp_check( DiTy )

                    struct
                    {
                        bool bConst = false;
                        bool bVolatile = false;
                        bool bRestrict = false;
                        bool bPointer = false;
                        std::string Name;
                    } ParamFactory;

                    const DIType* Cursor = DiTy;
                    while (Cursor)
                    {
                        if (Cursor->getTag() == DW_TAG_const_type)
                        {
                            ParamFactory.bConst = true;
                        }
                        else if (Cursor->getTag() == DW_TAG_volatile_type)
                        {
                            ParamFactory.bVolatile = true;
                        }
                        else if (Cursor->getTag() == DW_TAG_restrict_type)
                        {
                            ParamFactory.bRestrict = true;
                        }
                        else if (Cursor->getTag() == DW_TAG_pointer_type)
                        {
                            ParamFactory.bPointer = true;
                        }
                        else if (Cursor->getTag() == DW_TAG_base_type)
                        {
                            ParamFactory.Name = Cursor->getName().str();
                            break;
                        }
                        else
                        {
                            dcp_noentry( "Unknown tag." )
                        }

                        if (const DIDerivedType* DiDty = dyn_cast<DIDerivedType>(Cursor); DiDty)
                        {
                            Cursor = DiDty->getBaseType();
                        }
                        else
                        {
                            Cursor = nullptr;
                        }

                        continue;
                    }

                    dcp_check( ParamFactory.Name.empty() == false )
                    std::stringstream Ss;
                    if (ParamFactory.bConst)
                    {
                        Ss << "const ";
                    }
                    if (ParamFactory.bVolatile)
                    {
                        Ss << "volatile ";
                    }
                    if (ParamFactory.bRestrict)
                    {
                        Ss << "restrict ";
                    }
                    Ss << ParamFactory.Name;
                    if (ParamFactory.bPointer)
                    {
                        Ss << " *";
                    }

                    SccFunction::Param Param;
                    Param.Identifier = DiLv->getName().str();
                    Param.Type = Ss.str();

                    dcp_check( DiLv->getArg() == Node.Params.size() + 1 )

                    Node.Params.emplace_back(std::move(Param));

                    continue;
                }
                continue;
            }
            continue;
        }

        this->AnalyzeIncludes(&Node, F, Node.EndLine);

        Out->AddNode(std::move(Node));
        continue;
    }

    return;
}

void Dcp::SCCDecompositionPass::AnalyzeIncludes(SccFunction* Out, const Function& F, const int UntilLine /* = INDEX_NONE */)
{
    dcp_check( Out && Out->Source.empty() == false )

    std::ifstream In(Out->Source);
    dcp_check( In.is_open() )

    std::string Line;
    int LineNumber = 0;
    while (std::getline(In, Line))
    {
        if (++LineNumber > UntilLine && UntilLine != INDEX_NONE)
        {
            break;
        }

        if (Line.find("#include") != std::string::npos)
        {
            Out->Includes.push_back(Line);
        }

        continue;
    }

    return;
}

void Dcp::SCCDecompositionPass::AnalyzeFunctionRefs(AnalyzedScc* Out, const LazyCallGraph::SCC& Scc)
{
    for (LazyCallGraph::Node& NativeNode : Scc)
    {
        const Function& F = NativeNode.getFunction();
        dcp_check( F.isDeclaration() == false )
        this->AnalyzeFunctionRefs(Out, F);
        continue;
    }
}

void Dcp::SCCDecompositionPass::AnalyzeFunctionRefs(AnalyzedScc* Out, const Function& F)
{
    dcp_check( Out )

    for (const BasicBlock& BB : F)
    {
        for (const Instruction& I : BB)
        {
            if (const CallBase* CB = dyn_cast<CallBase>(&I))
            {
                if (const Function* Callee = CB->getCalledFunction(); Callee)
                {
                    SccFunctionRef Ref;
                    Ref.Identifier = Callee->getName();
                    if (const DISubprogram* Disp = Callee->getSubprogram(); Disp)
                    {
                        Ref.Source = ToAbsolutePath(*Disp);
                    }

                    Out->AddNode(std::move(Ref));
                }
            }
            continue;
        }
        continue;
    }

    return;
}

void Dcp::SCCDecompositionPass::AnalyzeStructs(AnalyzedScc* Out, const LazyCallGraph::SCC& Scc)
{
    const Module* M = FindModuleChecked(Scc);

    for (LazyCallGraph::Node& NativeNode : Scc)
    {
        Function& F = NativeNode.getFunction();
        dcp_check( F.isDeclaration() == false )
        this->AnalyzeStructs(Out, *M, F);

        continue;
    }

    return;
}

void Dcp::SCCDecompositionPass::AnalyzeStructs(AnalyzedScc* Out, const Module& M, const Function& F)
{
    dcp_check( Out )

    const FunctionType* FTy = F.getFunctionType();

    std::set<const StructType*> Structs;
    std::set<std::string> DeferredSymbols;

    // Return type
    {
        // Return type: If not lost due to optimization (in register pass)
        if (const StructType* RetTy = dyn_cast<StructType>(FTy->getReturnType()); RetTy && RetTy->getName().empty() == false)
        {
            Structs.insert(RetTy);
            errs() << "Return Type: " << F.getName() << " - " << RetTy->getName().str() << "\n";
        }
        // Recovered return type if not trivial
        else if (const DISubprogram* SP = F.getSubprogram())
        {
            const DISubroutineType* Types = SP->getType();
            SmallVector<const Metadata*, 8> Meta;
            for (const DIType* Node: Types->getTypeArray())
            {
                Meta.push_back(Node);
            }

            if (Meta.empty() == false)
            {
                // First index, because the return type is the first one as stated in llvm documentation
                if (const DIType* RetDIType = dyn_cast_or_null<DIType>(Meta[0]))
                {
                    if
                    (
                        const std::string Name = RetDIType->getName().str();
                        std::find(DeferredSymbols.begin(), DeferredSymbols.end(), Name) == DeferredSymbols.end()
                    )
                    {
                        DeferredSymbols.emplace(std::move(Name));
                    }
                }
            }
        }
    }

    // Parameters
    for (const Type* ParamTy : FTy->params())
    {
        if (const StructType* STy = dyn_cast<StructType>(ParamTy))
        {
            Structs.insert(STy);
        }
        continue;
    }

    // Function body
    for (const BasicBlock& BB : F)
    {
        for (const Instruction& I : BB)
        {
            if (const AllocaInst* Ai = dyn_cast<AllocaInst>(&I))
            {
                if (const StructType* STy = dyn_cast<StructType>(Ai->getAllocatedType()))
                {
                    Structs.insert(STy);
                }
            }
            else if (const LoadInst* LI = dyn_cast<LoadInst>(&I))
            {
                if (const StructType* STy = dyn_cast<StructType>(LI->getType()))
                {
                    Structs.insert(STy);
                }
            }
            else if (const StoreInst* SI = dyn_cast<StoreInst>(&I))
            {
                if (const StructType* STy = dyn_cast<StructType>(SI->getValueOperand()->getType()))
                {
                    Structs.insert(STy);
                }
            }
            continue;
        }
        continue;
    }

    for (const std::string& Name : DeferredSymbols)
    {
        // TODO Resolve this.
    }

    for (const StructType* STy : Structs)
    {
        if (STy->isLiteral() || STy->hasName() == false)
        {
            continue;
        }

        StructDefinition Def = FindStructDefinition(*STy, M);
        if (Def.IsValid() == false)
        {
            errs() << "Failed to find definition for struct: " << STy->getName() << "\n";
            dcp_noentry()
            continue;
        }

        SccTypeRef Type;
        Type.Identifier = Def.Name;
        Type.Source = Def.Filename;

        Out->AddNode(std::move(Type));

        continue;
    }

    return;
}

void Dcp::SCCDecompositionPass::AnalyzeGlobals(AnalyzedScc* Out, const LazyCallGraph::SCC& Scc)
{
    SmallPtrSet<const GlobalVariable*, 16> UsedGlobals;

    for (const LazyCallGraph::Node& Node : Scc)
    {
        const Function& F = Node.getFunction();

        for (const BasicBlock& BB : F)
        {
            for (const Instruction& I : BB)
            {
                if (auto *GEP = dyn_cast<GetElementPtrInst>(&I))
                {
                    if (auto *GV = dyn_cast<GlobalVariable>(GEP->getPointerOperand()))
                    {
                        UsedGlobals.insert(GV);
                    }
                }
                else if (auto *LI = dyn_cast<LoadInst>(&I))
                {
                    if (auto *GV = dyn_cast<GlobalVariable>(LI->getPointerOperand()))
                    {
                        UsedGlobals.insert(GV);
                    }
                }
                else if (auto *SI = dyn_cast<StoreInst>(&I))
                {
                    if (auto *GV = dyn_cast<GlobalVariable>(SI->getPointerOperand()))
                    {
                        UsedGlobals.insert(GV);
                    }
                }

                continue;
            }

            continue;
        }

        continue;
    }

    for (const GlobalVariable* Gv : UsedGlobals)
    {
        dcp_check( Gv->hasInitializer() )

        const MDNode* MdNode = Gv->getMetadata("dbg");
        dcp_check( MdNode )

        if (const DIGlobalVariableExpression* Gve = dyn_cast<DIGlobalVariableExpression>(MdNode))
        {
            const DIGlobalVariable* DiGv = Gve->getVariable();
            dcp_check( DiGv )

            std::string AbsolutePath = DiGv->getDirectory().str() + '/' + DiGv->getFilename().str();

            SccGlobalRef Global;
            Global.Identifier = DiGv->getName().str();
            Global.Source = std::move(AbsolutePath);

            Out->AddNode(std::move(Global));
        }

        continue;
    }

    return;
}
