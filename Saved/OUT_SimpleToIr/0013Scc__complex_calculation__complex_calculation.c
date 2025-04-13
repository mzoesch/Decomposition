// SCC: (_complex_calculation, complex_calculation)

#include "0000StructType_struct.Output.h"
#include "0001StructType_struct.InternalOutput.h"


extern int g_my_state;


Output complex_calculation(const int depth, const int a);
InternalOutput _complex_calculation(const int depth, const int a);


// Function: _complex_calculation
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/003_Simple/Private/mymath.c
#include ".0013Scc__complex_calculation__complex_calculation__complex_calculation.fwd"
InternalOutput _complex_calculation(const int depth, const int a)
{
    ++g_my_state;
    const int b = a - 1;

    if (b % 2 == 0)
    {
        return (InternalOutput){complex_calculation(depth+1, b).value, -1, 2};
    }
    else
    {
        return _complex_calculation(depth+1, b);
    }
}


// Function: complex_calculation
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/003_Simple/Private/mymath.c
#include ".0013Scc__complex_calculation__complex_calculation_complex_calculation.fwd"
Output complex_calculation(const int depth, const int a)
{
    ++g_my_state;
    const int b = a - 1;

    if (b < 0)
    {
        return (Output){.value = depth + 1 };
    }

    if (b % 2 == 0)
    {
        return complex_calculation(depth+1, b);
    }
    else
    {
        return (Output){_complex_calculation(depth+1, b).my_val};
    }
}


