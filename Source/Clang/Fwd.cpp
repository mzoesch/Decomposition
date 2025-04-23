#include "Fwd.h"

#include <clang/Basic/SourceManager.h>
#include <llvm/Support/raw_ostream.h>

DCP_API std::vector<std::string> Dcp::ModuleHeaderPaths;

bool Dcp::IsModuleHeader(const std::string_view& InAbsolutePath)
{
    // Just temp. Will not work with other libs.

    if
    (
        InAbsolutePath.find("/usr/include")       == 0
     || InAbsolutePath.find("/include")           == 0
     || InAbsolutePath.find("/usr/bin")           == 0
     || InAbsolutePath.find("/usr/local/include") == 0
     || InAbsolutePath.find("/usr/lib/clang")     == 0
    )
    {
        return false;
    }

    return true;
}
