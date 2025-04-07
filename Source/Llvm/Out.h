#pragma once

#include "SccPass.h"
#include "ModPass.h"

namespace Dcp
{

DCP_API void InvalidateIntermediateCache();

/**
 * Export current metadata to an intermediate file to
 * use it later in the pipeline.
 */
DCP_API void PutToIntermediate(AnalyzedScc&& Nodes);
DCP_API void PutToIntermediate(AnalyzedMod&& Mod);

} /* ~Namespace Dcp */
