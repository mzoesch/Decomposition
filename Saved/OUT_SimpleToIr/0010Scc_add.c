// SCC: (add)

#include "0000StructType_struct.Output.h"


extern int g_my_state;


Output inline_add(const int *a, const int *b);


Output add(const int a, const int b);


// Function: add
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/003_Simple/Private/mymath.c
#include ".0010Scc_add_add.fwd"
Output add(const int a, const int b)
{
    ++g_my_state;
    return inline_add(&a, &b);
}


