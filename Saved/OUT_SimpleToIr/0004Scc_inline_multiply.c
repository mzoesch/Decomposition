// SCC: (inline_multiply)

#include "0000StructType_struct.Output.h"


extern int g_my_internal_state;


Output inline_multiply(int a, int b);


// Function: inline_multiply
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/003_Simple/mymath.h
#include ".0004Scc_inline_multiply_inline_multiply.fwd"
inline __attribute__((weak)) Output inline_multiply(int a, int b)
{
    ++g_my_internal_state;
    return (Output){.value = MULTIPLY(a, b)};
}


