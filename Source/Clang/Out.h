#pragma once

#include "Build.h"
#include "Fwd.h"
#include <vector>
#include <llvm/ADT/StringRef.h>


namespace Dcp
{

DCP_API void PutToIntermediate(const llvm::StringRef& File, const std::vector<MyXCompilerInclude>& Include);
DCP_API void PutToIntermediate(const MyTypeDef& InTypeDef);
DCP_API void PutToIntermediate(const MyRecord& InRecord);
DCP_API void PutToIntermediate(const MyFunction& InFunction);
DCP_API void PutToIntermediate(const MyFunctionRef& InFunctionRef);

} /* ~Namespace Dcp */
