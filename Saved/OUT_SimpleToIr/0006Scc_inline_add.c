// SCC: (inline_add)

#include "0000StructType_struct.Output.h"


extern int g_my_internal_state;


void inline_add_to_ptr(const int *a, const int *b, int *c);


Output inline_add(const int *a, const int *b);


// Function: inline_add
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/003_Simple/mymath.h
#include ".0006Scc_inline_add_inline_add.fwd"
inline __attribute__((weak)) Output inline_add(const int* a, const int* b)
{
    ++g_my_internal_state;
    int result = 0;
    ADD_PTR(a, b, result);
    return (Output){.value = result};
}


