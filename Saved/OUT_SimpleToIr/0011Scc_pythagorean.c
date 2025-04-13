// SCC: (pythagorean)

#include "0000StructType_struct.Output.h"


extern int g_my_state;


Output square(const int a);
Output add(const int a, const int b);


Output pythagorean(const int a, const int b);


// Function: pythagorean
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/003_Simple/Private/mymath.c
#include ".0011Scc_pythagorean_pythagorean.fwd"
Output pythagorean(const int a, const int b)
{
    ++g_my_state;
    return (Output)
    {
        .value = add(square(a).value, square(b).value).value
    };
}


