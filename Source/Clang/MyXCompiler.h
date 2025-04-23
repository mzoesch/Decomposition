#pragma once

#include "Fwd.h"
#include <string>

namespace Dcp
{

struct MyXCompilerInclude final
{
    MyXCompilerInclude() = default;
    MyXCompilerInclude(const std::string& InPath, const int64_t InGroup = 0)
        : Path(InPath), Group(InGroup) {}

    std::string Path;
    int64_t Group = 0;
};

} /* ~Namespace Dcp */
