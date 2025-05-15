#include "Collector.h"

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

    if (std::find(this->Collectables.begin(), this->Collectables.end(), Qt) == this->Collectables.end())
    {
        this->Collectables.emplace_back(std::move(Qt));
        return true;
    }

    return false;
}

bool Dcp::MyVarRefCollector::VisitDeclRefExpr(const DeclRefExpr* Dre)
{
    if (isa<clang::VarDecl>(Dre->getDecl()) == false)
    {
        return true;
    }

    const VarDecl* Vd = dyn_cast<VarDecl>(Dre->getDecl());
    const DeclContext* Fc = dyn_cast<DeclContext>(Fd);
    const DeclContext* Vc = Vd->getDeclContext();

    if ((Vc == Fc) == false)
    {
        this->Refs.insert(Vd);
    }

    return true;
}
