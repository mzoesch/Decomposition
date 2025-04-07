#pragma once

#include "Build.h"
#include "MyConsumer.h"

namespace Predcp
{

PREDCP_API void InvalidateIntermediateCache();

PREDCP_API void PutToIntermediate(MyTypeDef&& Type);

} /* ~Namespace Predcp */

