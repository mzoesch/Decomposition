#include "Collectors.h"

using namespace clang;

bool Dcp::MyTypeCollector::VisitVarDecl(const VarDecl* Vd)
{
    this->AddQualifiedType(Vd->getType());
    return true;
}

bool Dcp::MyTypeCollector::VisitCallExpr(const CallExpr* Ce)
{
    if (const FunctionDecl *FD = Ce->getDirectCallee())
    {
        this->AddQualifiedType(FD->getReturnType());
    }

    return true;
}

bool Dcp::MyTypeCollector::AddQualifiedType(QualType&& Qt)
{
    while (Qt->isPointerType() || Qt->isReferenceType())
    {
        Qt = Qt->getPointeeType();
    }

    Qt = Qt.getUnqualifiedType();

    if (Qt->hasUnnamedOrLocalType())
    {
        const QualType CanonicalQt = Qt.getCanonicalType();

        bool bAny { false };
        if (const RecordType* Rt = dyn_cast<RecordType>(CanonicalQt))
        {
            const RecordDecl* Rd = Rt->getDecl();
            for (const FieldDecl* Field: Rd->fields())
            {
                if (this->AddQualifiedType(Field->getType()))
                {
                    bAny = true;
                }

                continue;
            }
        }

        return bAny;
    }

    if (std::find(this->Collectables.begin(), this->Collectables.end(), Qt) == this->Collectables.end())
    {
        this->Collectables.emplace_back(std::move(Qt));
        return true;
    }

    return false;
}

bool Dcp::MyVarRefCollector::VisitDeclRefExpr(const DeclRefExpr* Dre)
{
    if (isa<VarDecl>(Dre->getDecl()) == false)
    {
        return true;
    }

    const VarDecl* Vd = dyn_cast<VarDecl>(Dre->getDecl());
    const DeclContext* Fc = dyn_cast<DeclContext>(Fd);
    const DeclContext* Vc = Vd->getDeclContext();

    if ((Vc == Fc) == false)
    {
        this->Refs.emplace(Vd);
    }

    return true;
}

bool Dcp::MyFuncPointerCollector::VisitVarDecl(const VarDecl* Vd)
{
    if (Vd->hasInit())
    {
        const Expr* Ex = Vd->getInit();

        Ex = Ex->IgnoreImpCasts();

        if (const DeclRefExpr* Dre = llvm::dyn_cast<clang::DeclRefExpr>(Ex))
        {
            if (const FunctionDecl* _Fd = llvm::dyn_cast<clang::FunctionDecl>(Dre->getDecl()))
            {
                if (std::find(this->Fds.begin(), this->Fds.end(), _Fd) == this->Fds.end())
                {
                    this->Fds.emplace(_Fd);
                }
            }
        }
    }

    return true;
}

bool Dcp::MyFuncPointerCollector::VisitBinaryOperator(const BinaryOperator* Bo)
{
    if (Bo->getOpcode() == BO_Assign)
    {
        const Expr* Rhs = Bo->getRHS()->IgnoreImpCasts();

        if (const DeclRefExpr* Ref = llvm::dyn_cast<DeclRefExpr>(Rhs))
        {
            if (const FunctionDecl* Func = llvm::dyn_cast<clang::FunctionDecl>(Ref->getDecl()))
            {
                if (std::find(this->Fds.begin(), this->Fds.end(), Func) == this->Fds.end())
                {
                    this->Fds.emplace(Func);
                }
            }
        }
    }

    return true;
}
