#include "Fwd.h"
#include <clang/Basic/SourceManager.h>
#include <llvm/Support/raw_ostream.h>

DCP_API std::vector<std::string> Dcp::ModuleHeaderPaths;

bool Dcp::IsModuleHeader(const std::string_view& InAbsolutePath)
{
    return
    !(
           InAbsolutePath.rfind("/usr/include", 0)       == 0
        || InAbsolutePath.rfind("/include", 0)           == 0
        || InAbsolutePath.rfind("/usr/bin", 0)           == 0
        || InAbsolutePath.rfind("/usr/local/include", 0) == 0
        || InAbsolutePath.rfind("/usr/lib/clang", 0)     == 0
    )
    ;
}
