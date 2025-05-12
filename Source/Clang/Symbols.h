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
    int64_t Line = INDEX_NONE;
    int64_t Column = INDEX_NONE;

    DCP_API virtual bool IsValid() const;
    DCP_API virtual bool operator==(const MySymbol& InOther) const;
};

struct MyTypeDef final : public MySymbol
{
    std::string What;
    std::string Type;
};

struct MyRecord : public MySymbol
{
    std::string Type;
    std::vector<MyRecordRef> Records;

    inline bool AddRecord(const MyRecordRef& InRecord);
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

    bool bStatic = false;
    std::string Ret;
    std::vector<Param> Params;

    std::vector<MyRecordRef> Records;

    inline bool AddRecord(const MyRecordRef& InRecord);
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

inline bool MyRecord::AddRecord(const MyRecordRef& InRecord)
{
    if (std::find(Records.begin(), Records.end(), InRecord) == Records.end())
    {
        Records.emplace_back(InRecord);
        return true;
    }

    return false;
}

inline bool MyFunction::AddRecord(const MyRecordRef& InRecord)
{
    if (std::find(Records.begin(), Records.end(), InRecord) == Records.end())
    {
        Records.emplace_back(InRecord);
        return true;
    }

    return false;
}

} /* ~Namespace Dcp */
