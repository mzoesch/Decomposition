#pragma once

#include "Build.h"
#include <string>

namespace Predcp
{

struct MyTypeDef;

struct MyTypeDef
{
    std::string Identifier;
    std::string Source;
    int Line = INDEX_NONE;
    int Column = INDEX_NONE;

    PREDCP_API virtual bool operator==(const MyTypeDef& Other) const;
    PREDCP_API virtual bool IsValid() const;
};

} /* ~Namespace Predcp */
