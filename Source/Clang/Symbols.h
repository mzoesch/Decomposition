#pragma once

#include "Fwd.h"
#include <string>

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

struct MySymbolRef
{
    // Make this more safe by combining the declaration of the #Ref with a deferred definition??
    std::string Ref;
};

struct MyTypeDef final : public MySymbol
{
    std::string What;
};

struct MyRecord final : public MySymbol
{
    std::string Type;
};

struct MyFunction final : public MySymbol
{
    struct Param
    {
        std::string Identifier;
        std::string Type;
    };

    bool bStatic = false;
    std::string Ret;
    std::vector<Param> Params;
};

struct MyFunctionRef final : public MySymbolRef
{
    MyFunction Caller;
};

} /* ~Namespace Dcp */
