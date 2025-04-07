#pragma once

#include "mystate.h"

#define MULTIPLY(a, b)     a * b
#define F_MULTIPLY(a, b)   multiply(a, b)
#define ADD(a, b)          a + b

typedef struct Output
{
    int value;
} Output;

Output inline_multiply(int a, int b);
Output inline_add(int a, int b);
Output inline_square(int a);

Output multiply(int a, int b);
Output add(int a, int b);
Output square(int a);

Output pythagorean(int a, int b);

Output complex_calculation(const int depth, const int a);

inline __attribute__((weak)) Output inline_multiply(int a, int b)
{
    ++g_my_internal_state;
    return (Output){.value = MULTIPLY(a, b)};
}

inline __attribute__((weak)) Output inline_add(int a, int b)
{
    ++g_my_internal_state;
    return (Output){.value = ADD(a, b)};
}

inline __attribute__((weak)) Output inline_square(int a)
{
    ++g_my_internal_state;
    return F_MULTIPLY(a, a);
}
