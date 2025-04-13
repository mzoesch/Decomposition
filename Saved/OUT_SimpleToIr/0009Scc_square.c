// SCC: (square)

#include "0000StructType_struct.Output.h"


extern int g_my_state;


Output inline_square(int a);


Output square(const int a);


// Function: square
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/003_Simple/Private/mymath.c
#include ".0009Scc_square_square.fwd"
Output square(const int a)
{
    ++g_my_state;
    return inline_square(a);
}


