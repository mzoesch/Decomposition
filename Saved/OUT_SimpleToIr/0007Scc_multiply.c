// SCC: (multiply)

#include "0000StructType_struct.Output.h"


extern int g_my_state;


Output inline_multiply(int a, int b);


Output multiply(const int a, const int b);


// Function: multiply
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/003_Simple/Private/mymath.c
#include ".0007Scc_multiply_multiply.fwd"
Output multiply(const int a, const int b)
{
    ++g_my_state;
    return inline_multiply(a, b);
}


