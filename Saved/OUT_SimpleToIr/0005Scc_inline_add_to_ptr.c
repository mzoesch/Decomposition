// SCC: (inline_add_to_ptr)

extern int g_my_internal_state;


void inline_add_to_ptr(const int *a, const int *b, int *c);


// Function: inline_add_to_ptr
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/003_Simple/mymath.h
#include ".0005Scc_inline_add_to_ptr_inline_add_to_ptr.fwd"
inline __attribute__((weak)) void inline_add_to_ptr(const int* a, const int* b, int* c)
{
    ++g_my_internal_state;
    *c = ADD(*a, *b);
    return;
}


