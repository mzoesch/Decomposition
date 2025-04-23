#include "Symbols.h"

namespace Dcp
{

bool MySymbol::IsValid() const
{
    return this->Identifier.empty() != false
        && this->Source.empty() != false
        && this->Line != INDEX_NONE
        && this->Column != INDEX_NONE;
}

bool MySymbol::operator==(const MySymbol& InOther) const
{
    return this->Identifier == InOther.Identifier
        && this->Source == InOther.Source
        && this->Line == InOther.Line
        && this->Column == InOther.Column;
}

} /* ~Namespace Dcp */
