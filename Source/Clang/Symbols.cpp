#include "Symbols.h"
#include <clang/AST/ExprObjC.h>
#include <filesystem>

namespace fs = std::filesystem;

namespace Dcp
{

void MySymbol::ExpandAndFollowSourceLocation() const
{
    dcp_check( this->Source.empty() == false )

    const_cast<MySymbol*>(this)->Source = std::filesystem::absolute(std::filesystem::path{this->Source}.lexically_normal());

    return;
}

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

void MyTypeDef::AddRecordRef(const MyRecordRef& InRecord)
{
    const std::set<MyRecordRef>::iterator R = this->Records.find(InRecord);
    if (R == this->Records.end())
    {
        this->Records.emplace(InRecord);
        return;
    }

    if (InRecord.bStrong)
    {
        R->bStrong = InRecord.bStrong;
    }

    return;
}

bool MySymbolRef::IsValid() const
{
    return this->Ref.empty() != false;
}

bool MySymbolRef::operator==(const MySymbolRef& InOther) const
{
    return this->Ref == InOther.Ref;
}

} /* ~Namespace Dcp */
