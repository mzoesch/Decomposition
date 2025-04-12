#pragma once

#include "mystate.h"

#define MULTIPLY(a, b)     a * b
#define F_MULTIPLY(a, b)   multiply(a, b)
#define ADD(a, b)          a + b
#define ADD_PTR(a, b, res) inline_add_to_ptr(a, b, &res)

typedef struct Output // Make this work for all kinds of structs...
{
    int value;
} Output;

Output inline_multiply(int a, int b);
Output inline_add(const int* a, const int* b);
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

inline __attribute__((weak)) void inline_add_to_ptr(const int* a, const int* b, int* c)
{
    ++g_my_internal_state;
    *c = ADD(*a, *b);
    return;
}

inline __attribute__((weak)) Output inline_add(const int* a, const int* b)
{
    ++g_my_internal_state;
    int result = 0;
    ADD_PTR(a, b, result);
    return (Output){.value = result};
}

inline __attribute__((weak)) Output inline_square(int a)
{
    ++g_my_internal_state;
    return F_MULTIPLY(a, a);
}
