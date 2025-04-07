#include "mymath.h"

Output multiply(const int a, const int b)
{
    ++g_my_state;
    return inline_multiply(a, b);
}

Output add(const int a, const int b)
{
    ++g_my_state;
    return inline_add(a, b);
}

Output square(const int a)
{
    ++g_my_state;
    return inline_square(a);
}

Output pythagorean(const int a, const int b)
{
    ++g_my_state;
    return (Output)
    {
        .value = add(square(a).value, square(b).value).value
    };
}

typedef struct InternalOutput
{
    int my_val;
    int my_other_val;
    int value;
} InternalOutput;

Output complex_calculation(const int depth, const int a);
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
