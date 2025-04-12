#pragma once

#include "Build.h"
#include "MyConsumer.h"

namespace Predcp
{

PREDCP_API void InvalidateIntermediateCache(const std::string& InRoot);

PREDCP_API void PutToIntermediate(const std::string& InRoot, std::string&& F, std::vector<MyMacroInfo>&& Macros);
PREDCP_API void PutToIntermediate(const std::string& InRoot, std::map<std::string, std::vector<MyIncludeDirective>>&& InFiles);
PREDCP_API void PutToIntermediate(const std::string& InRoot, std::map<std::string, std::vector<MyMacroInfo>>&& InHeaders);

} /* ~Namespace Predcp */

