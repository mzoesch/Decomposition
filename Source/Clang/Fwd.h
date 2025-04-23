#pragma once

#include "Build.h"
#include <string>
#include <vector>

namespace Dcp
{

DCP_API extern std::vector<std::string> ModuleHeaderPaths;
DCP_API bool IsModuleHeader(const std::string_view& InAbsolutePath);

class MyMacroCollector;
class MyAstConsumer;

struct MyXCompilerInclude;

struct MySymbolRef;
    struct MySymbol;
        struct MyTypeDef;
        struct MyRecord;
        struct MyFunction;
        struct MyMacroInfo;
        struct MyIncludeDirective;
    struct MyFunctionRef;

} /* ~Namespace Dcp */
