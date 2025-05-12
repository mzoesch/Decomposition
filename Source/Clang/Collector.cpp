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

    if (std::find(Collectables.begin(), Collectables.end(), Qt) == Collectables.end())
    {
        Collectables.emplace_back(std::move(Qt));
        return true;
    }

    return false;
}
