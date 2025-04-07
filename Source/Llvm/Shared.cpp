#include "Build.h"
#include "Shared.h"

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

bool Dcp::MyNode::operator==(const MyNode& Other) const
{
    if (const bool bEquals = MyNodeRef::operator==(Other); bEquals == false)
    {
        return false;
    }

    return this->Line == Other.Line;
}
