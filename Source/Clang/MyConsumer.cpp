#include "MyConsumer.h"

bool Predcp::MyTypeDef::operator==(const MyTypeDef& Other) const
{
    return this->Identifier == Other.Identifier
        && this->Source == Other.Source;
}

bool Predcp::MyTypeDef::IsValid() const
{
    return this->Identifier.size() > 0
        && this->Source.size() > 0
        && this->Line != INDEX_NONE
        && this->Column != INDEX_NONE;
}
