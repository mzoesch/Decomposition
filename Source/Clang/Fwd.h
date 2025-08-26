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
class MyAstVisitor;
class MyTypeCollector;

struct CompilerIncludePath;

struct MySymbol;
    struct MyTypeDef;
    struct MyRecord;
        struct MyEnumRecord;
    struct MyFunction;
    struct MyMacroInfo;
    struct MyIncludeDirective;
    struct MyDecl;
    struct MyVariable;

struct MySymbolRef;
    struct MyFunctionRef;
    struct MyRecordRef;
    struct MyVarRef;

} /* ~Namespace Dcp */
