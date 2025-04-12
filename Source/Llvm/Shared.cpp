#include "Build.h"
#include "Shared.h"

#include <llvm/IR/DebugInfo.h>

using namespace llvm;

bool Dcp::MyNodeRef::operator==(const MyNodeRef& Other) const
{
    return this->Identifier == Other.Identifier
        && this->Source == Other.Source;
}

bool Dcp::MyNodeRef::IsValid() const
{
    return this->Identifier.size() > 0
        && this->Source.size() > 0;
}

bool ::Dcp::MyNode::IsValid() const
{
    if (const bool bValid = MyNodeRef::IsValid(); bValid == false)
    {
        return false;
    }

    return this->Line > INDEX_NONE && this->Line != std::numeric_limits<int>::max();
}

const DIType* Dcp::FindDiType(const Module& M, const dwarf::Tag Tag, const StringRef& InName)
{
    std::string Name;
    if (const size_t Idx = InName.find("."); Idx != StringRef::npos)
    {
        Name = InName.substr(Idx + 1);
    }
    else
    {
        Name = InName;
    }

    DebugInfoFinder Finder; Finder.processModule(M);

    for (const DIType* DiTy : Finder.types())
    {
        if (DiTy->getTag() != Tag)
        {
            continue;
        }

        if (DiTy->getName() != Name)
        {
            continue;
        }

        return DiTy;
    }

    return nullptr;
}

bool Dcp::MyNode::operator==(const MyNode& Other) const
{
    if (const bool bEquals = MyNodeRef::operator==(Other); bEquals == false)
    {
        return false;
    }

    return this->Line == Other.Line;
}
