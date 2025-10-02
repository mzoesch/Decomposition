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

enum class EDeclBool
{
    None,
    True,
    False
};

struct MyDecl : public MySymbol
{
    EDeclBool bStatic { EDeclBool::None };
    EDeclBool bExtern { EDeclBool::None };
    bool bDef { false };
};

struct MyRecord : public MySymbol
{
    int64_t RBraceLine { INDEX_NONE };
    int64_t RBraceColumn { INDEX_NONE };

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
    bool bNoTag { false };
    int64_t NoTagLine { INDEX_NONE };
    int64_t NoTagColumn { INDEX_NONE };
    int64_t RNoTagLine { INDEX_NONE };
    int64_t RNoTagColumn { INDEX_NONE };

    DCP_API void AddRecordRef(const MyRecordRef& InRecord);
};

struct MyEnumRecord final : public MyRecord
{
    std::optional<std::string> Enum;
};

struct MyFunction final : public MySymbol
{
    struct Param
    {
        std::string Identifier;
        std::string Type;
    };

    int64_t RBraceLine { INDEX_NONE };
    int64_t RBraceColumn { INDEX_NONE };

    bool bStatic { false };
    std::string Ret;
    std::vector<Param> Params;

    std::set<MyRecordRef> Records;
    std::set<MyVarRef> Vars;

    inline bool AddRecordRef(const MyRecordRef& InRecord);
    inline bool AddRecordRef(MyRecordRef&& InRecord);
    inline bool AddVarRef(MyVarRef&& InVarRef);
};

struct MyVariable final : public MySymbol
{
    std::string Type;
    bool bStatic { false };
    bool bExtern { false };
    std::optional<std::string> Init;
};

struct MySymbolRef
{
    // Make this safer by combining the declaration of the #Ref with a deferred definition??
    std::string Ref;
    mutable bool bStrong { true };

    DCP_API bool IsValid() const;
    DCP_API bool operator==(const MySymbolRef& InOther) const;

    bool operator<(const MySymbolRef& InOther) const // Hash
    {
        return this->Ref < InOther.Ref;
    }
};

struct MyFunctionRef final : public MySymbolRef
{
    MyDecl Caller;
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

inline bool MyFunction::AddRecordRef(const MyRecordRef& InRecord)
{
    auto R = this->Records.find(InRecord);
    if (R == this->Records.end())
    {
        this->Records.emplace(InRecord);
        return true;
    }

    if (R->bStrong == false && InRecord.bStrong == true)
    {
        R->bStrong = true;
        return true;
    }

    return false;
}

inline bool MyFunction::AddRecordRef(MyRecordRef&& InRecord)
{
    auto R = this->Records.find(InRecord);
    if (R == this->Records.end())
    {
        this->Records.emplace(std::move(InRecord));
        return true;
    }

    if (R->bStrong == false && InRecord.bStrong == true)
    {
        R->bStrong = true;
        return true;
    }

    return false;
}

inline bool MyFunction::AddVarRef(MyVarRef&& InVarRef)
{
    this->Vars.emplace(std::move(InVarRef));
    return true;
}

} /* ~Namespace Dcp */
