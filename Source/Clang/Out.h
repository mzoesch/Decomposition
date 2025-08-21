#pragma once

#include "Build.h"
#include "Fwd.h"
#include <vector>
#include <llvm/ADT/StringRef.h>
#include <map>

namespace Dcp
{

DCP_API bool InitializeOutStream();
DCP_API void CloseOutStream();

DCP_API void PutToIntermediate(const llvm::StringRef& File, const std::vector<CompilerIncludePath>& Include);
DCP_API void PutToIntermediate(const std::map<std::string, std::vector<MyIncludeDirective>>& Files);
DCP_API void PutToIntermediate(const std::map<std::string, std::vector<MyMacroInfo>>& Files);
DCP_API void PutToIntermediate(const MyTypeDef& InTypeDef);
DCP_API void PutToIntermediate(const MyRecord& InRecord);
DCP_API void PutToIntermediate(const MyEnumRecord& InEnumRecord);
DCP_API void PutToIntermediate(const MyFunctionDecl& InFunction);
DCP_API void PutToIntermediate(const MyFunction& InFunction);
DCP_API void PutToIntermediate(const MyFunctionRef& InFunctionRef);
DCP_API void PutToIntermediate(const MyVariableDecl& InVariable);
DCP_API void PutToIntermediate(const MyVariable& InVariable);

} /* ~Namespace Dcp */
