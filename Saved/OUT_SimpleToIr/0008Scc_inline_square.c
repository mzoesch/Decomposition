// SCC: (inline_square)

#include "0000StructType_struct.Output.h"


extern int g_my_internal_state;


Output multiply(const int a, const int b);


Output inline_square(int a);


// Function: inline_square
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/003_Simple/mymath.h
#include ".0008Scc_inline_square_inline_square.fwd"
inline __attribute__((weak)) Output inline_square(int a)
{
    ++g_my_internal_state;
    return F_MULTIPLY(a, a);
}


