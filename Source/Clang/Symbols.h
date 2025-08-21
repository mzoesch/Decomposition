#pragma once

#include "Fwd.h"
#include <string>
#include <optional>
#include <vector>
#include <algorithm>
#include <set>

namespace Dcp
{

struct MySymbol
{
    virtual ~MySymbol() = default;

    std::string Identifier;
    std::string Source;
    int64_t Line { INDEX_NONE };
    int64_t Column { INDEX_NONE };

    DCP_API void ExpandAndFollowSourceLocation() const;

    DCP_API virtual bool IsValid() const;
    DCP_API virtual bool operator==(const MySymbol& InOther) const;
};

struct MyRecord : public MySymbol
{
    std::string Type;
    std::set<MyRecordRef> Records;
    bool bAnonymous { false };

    inline bool AddRecordRef(const MyRecordRef& InRecord);
    inline bool AddRecordRef(MyRecordRef&& InRecord);
};

    struct MyTypeDef final : public MySymbol
{
    std::string What;
    std::string Type;
    std::set<MyRecordRef> Records;
    bool bComplex { false };
    int64_t ComplexBeginLine { INDEX_NONE };
    int64_t ComplexBeginColumn { INDEX_NONE };
};

struct MyEnumRecord final : public MyRecord
{
    std::optional<std::string> Enum;
};

struct MyFunctionDecl : public MySymbol
{
};

struct MyFunction final : public MyFunctionDecl
{
    struct Param
    {
        std::string Identifier;
        std::string Type;
    };

    bool bStatic { false };
    std::string Ret;
    std::vector<Param> Params;

    std::set<MyRecordRef> Records;
    std::set<MyVarRef> Vars;

    inline bool AddRecordRef(MyRecordRef&& InRecord);
    inline bool AddVarRef(MyVarRef&& InVarRef);
};

struct MyVariableDecl : public MySymbol
{
    std::string Type;
    bool bStatic { false };
    bool bExtern { false };
};

struct MyVariable final : public MyVariableDecl
{
};

struct MySymbolRef
{
    // Make this safer by combining the declaration of the #Ref with a deferred definition??
    std::string Ref;

    DCP_API bool IsValid() const;
    DCP_API bool operator==(const MySymbolRef& InOther) const;

    bool operator<(const MySymbolRef& InOther) const // Hash
    {
        return this->Ref < InOther.Ref;
    }
};

struct MyFunctionRef final : public MySymbolRef
{
    MyFunctionDecl Caller;
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
    this->Records.emplace(InRecord);
    return true;
}

inline bool MyRecord::AddRecordRef(MyRecordRef&& InRecord)
{
    this->Records.emplace(std::move(InRecord));
    return true;
}

inline bool MyFunction::AddRecordRef(MyRecordRef&& InRecord)
{
    this->Records.emplace(std::move(InRecord));
    return true;
}

inline bool MyFunction::AddVarRef(MyVarRef&& InVarRef)
{
    this->Vars.emplace(std::move(InVarRef));
    return true;
}

} /* ~Namespace Dcp */
