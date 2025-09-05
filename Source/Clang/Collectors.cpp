#include "Collectors.h"
#include "Symbols.h"
#include "Visitor.h"

using namespace clang;

namespace
{

QualType GetBasicName(QualType&& Qt)
{
    if (Qt->isFunctionPointerType())
    {
        if (Qt->isTypedefNameType() == false)
        {
            Qt = Qt->getPointeeType();
        }

        return Qt;
    }

    while (Qt->isPointerType() || Qt->isReferenceType())
    {
        Qt = Qt->getPointeeType();
    }

    Qt = Qt.getUnqualifiedType();

    return Qt;
}

} /* ~Namespace <Anonymous> */

bool Dcp::MyVarRefCollector::VisitDeclRefExpr(const DeclRefExpr* Dre)
{
    if (!Dre)
    {
        return true;
    }

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
    if (!Vd)
    {
        return true;
    }

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
    if (!Bo)
    {
        return true;
    }

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

bool Dcp::MyRefCollector::VisitVarDecl(const VarDecl* Vd)
{
    if (!Vd)
    {
        return true;
    }

    this->AddQualRecord(Vd->getType());

    return true;
}

bool Dcp::MyRefCollector::VisitDeclRefExpr(const DeclRefExpr* Dre)
{
    if (!Dre)
    {
        return true;
    }

    this->AddQualRecord(Dre->getType());

    return true;
}

bool Dcp::MyRefCollector::VisitFieldDecl(const FieldDecl* Fd)
{
    if (!Fd)
    {
        return true;
    }

    this->AddQualRecord(Fd->getType());

    return true;
}

bool Dcp::MyRefCollector::VisitParmVarDecl(const ParmVarDecl* Pd)
{
    if (!Pd)
    {
        return true;
    }

    this->AddQualRecord(Pd->getType());

    return true;
}

bool Dcp::MyRefCollector::VisitUnaryExprOrTypeTraitExpr(UnaryExprOrTypeTraitExpr* E)
{
    if (!E)
    {
        return true;
    }

    if (E->getKind() == UETT_SizeOf)
    {
        if (E->isArgumentType())
        {
            QualType Qt = E->getArgumentType();
            AddQualRecord(Qt);
        }
        else
        {
            if (Expr* Arg = E->getArgumentExpr(); Arg)
            {
                QualType Qt = Arg->getType();
                AddQualRecord(Qt);
            }
        }
    }

    return true;
}

bool Dcp::MyRefCollector::VisitUnaryOperator(UnaryOperator* Uo)
{
    if (!Uo)
    {
        return true;
    }

    if (Uo->getOpcode() == UO_Deref)
    {
        Expr* E = Uo->getSubExpr();
        this->AddQualRecord(E->getType()->getPointeeType());
    }

    else
    {
        switch (Uo->getOpcode())
        {
            case UO_PostInc:
            case UO_PostDec:
            case UO_PreInc:
            case UO_PreDec:
            {
                if (const QualType Qt = Uo->getSubExpr()->getType(); Qt->isPointerType())
                {
                    this->AddQualRecord(Qt->getPointeeType());
                }

                break;
            }

            default:
            {
                break;
            }
        }
    }

    return true;
}

bool Dcp::MyRefCollector::VisitBinaryOperator(const BinaryOperator* Bo)
{
    if (!Bo)
    {
        return true;
    }

    if (Bo->isAdditiveOp() || Bo->isMultiplicativeOp() || Bo->isComparisonOp())
    {
        QualType LQt = Bo->getLHS()->getType();
        QualType RQt = Bo->getRHS()->getType();

        if (LQt->isPointerType())
        {
            QualType Pointee = LQt->getPointeeType();
            this->AddQualRecord(Pointee);
        }

        if (RQt->isPointerType())
        {
            QualType Pointee = RQt->getPointeeType();
            this->AddQualRecord(Pointee);
        }
    }

    return true;
}

bool Dcp::MyRefCollector::VisitMemberExpr(const MemberExpr* Me)
{
    if (!Me)
    {
        return true;
    }

    if (Me->isArrow())
    {
        const Expr* E = Me->getBase();

        if (const QualType Qt = E->getType(); Qt->isAnyPointerType())
        {
            const QualType PointeeQt = Qt->getPointeeType();
            this->AddQualRecord(PointeeQt);
        }
        else
        {
            /* This should never actually be the case. */
            this->AddQualRecord(Qt);
        }

        if (const ValueDecl* Vd = Me->getMemberDecl())
        {
            this->AddQualRecord(Vd->getType());
        }
    }
    else
    {
        const Expr* E = Me->getBase();
        this->AddQualRecord(E->getType());
    }

    return true;
}

void Dcp::MyRefCollector::AddQualRecord(const QualType Qt)
{
    if (const auto* Ft = Qt->getAs<FunctionType>(); Ft)
    {
        if (const auto* Fpt = llvm::dyn_cast<FunctionProtoType>(Ft); Fpt)
        {
            QualType ReturnType = Fpt->getReturnType();
            unsigned NumParams = Fpt->getNumParams();

            for (unsigned i = 0; i < NumParams; ++i)
            {
                AddQualRecord(Fpt->getParamType(i));
            }

            AddQualRecord(ReturnType);
        }
        else if (llvm::isa<FunctionNoProtoType>(Ft))
        {
            AddQualRecord(Ft->getReturnType());
        }

        return;
    }

    MyRecordRef Ref;
    Ref.Ref = ::GetBasicName(QualType{Qt}).getAsString();
    Ref.bStrong = MyAstVisitor::IsStrongQual(Qt);

    if (const auto R = this->Refs.find(Ref); R == this->Refs.end())
    {
        this->Refs.emplace(std::move(Ref));
    }
    else if (R->bStrong == false && Ref.bStrong == true)
    {
        R->bStrong = true;
    }

    return;
}
