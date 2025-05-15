#pragma once

#include "Fwd.h"
#include <string>
#include <optional>
#include <vector>
#include <algorithm>

namespace Dcp
{

struct MySymbol
{
    virtual ~MySymbol() = default;

    std::string Identifier;
    std::string Source;
    int64_t Line { INDEX_NONE };
    int64_t Column { INDEX_NONE };

    DCP_API virtual bool IsValid() const;
    DCP_API virtual bool operator==(const MySymbol& InOther) const;
};

struct MyRecord : public MySymbol
{
    std::string Type;
    std::vector<MyRecordRef> Records;
    bool bAnonymous { false };

    inline bool AddRecordRef(const MyRecordRef& InRecord);
    inline bool AddRecordRef(MyRecordRef&& InRecord);
};

    struct MyTypeDef final : public MySymbol
{
    std::string What;
    std::string Type;
    bool bComplex { false };
    int64_t ComplexBeginLine { INDEX_NONE };
    int64_t ComplexBeginColumn { INDEX_NONE };
    std::optional<MyRecord> ComplexTypeRef;
};

struct MyEnumRecord final : public MyRecord
{
    std::optional<std::string> Enum;
};

struct MyFunctionForward : public MySymbol
{
};

struct MyFunction final : public MyFunctionForward
{
    struct Param
    {
        std::string Identifier;
        std::string Type;
    };

    bool bStatic { false };
    std::string Ret;
    std::vector<Param> Params;

    std::vector<MyRecordRef> Records;
    std::vector<MyVarRef> Vars;

    inline bool AddRecordRef(MyRecordRef&& InRecord);
    inline bool AddVarRef(MyVarRef&& InVarRef);
};

struct MySymbolRef
{
    // Make this more safe by combining the declaration of the #Ref with a deferred definition??
    std::string Ref;

    DCP_API bool IsValid() const;
    DCP_API bool operator==(const MySymbolRef& InOther) const;
};

struct MyFunctionRef final : public MySymbolRef
{
    MyFunctionForward Caller;
};

struct MyRecordRef final : public MySymbolRef
{
};

struct MyVarRef final : public MySymbolRef
{
    std::string Type;
};

inline bool MyRecord::AddRecordRef(const MyRecordRef& InRecord)
{
    if (std::find(this->Records.begin(), this->Records.end(), InRecord) == this->Records.end())
    {
        this->Records.emplace_back(InRecord);
        return true;
    }

    return false;
}

inline bool MyRecord::AddRecordRef(MyRecordRef&& InRecord)
{
    if (std::find(this->Records.begin(), this->Records.end(), InRecord) == this->Records.end())
    {
        this->Records.emplace_back(std::move(InRecord));
        return true;
    }

    return false;
}

inline bool MyFunction::AddRecordRef(MyRecordRef&& InRecord)
{
    if (std::find(this->Records.begin(), this->Records.end(), InRecord) == this->Records.end())
    {
        this->Records.emplace_back(std::move(InRecord));
        return true;
    }

    return false;
}

inline bool MyFunction::AddVarRef(MyVarRef&& InVarRef)
{
    if (std::find(this->Vars.begin(), this->Vars.end(), InVarRef) == this->Vars.end())
    {
        this->Vars.emplace_back(std::move(InVarRef));
        return true;
    }

    return false;
}

} /* ~Namespace Dcp */
