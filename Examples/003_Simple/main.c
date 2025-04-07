#include <stdio.h>
#include "mymath.h"

extern Output pythagorean(int a, int b);

int main()
{
    printf("Number A: ");
    int a; scanf("%d", &a);
    printf("Number B: ");
    int b; scanf("%d", &b);

    const Output c = pythagorean(a, b);
    printf("The sum of the squares of %d and %d is %d.\n", a, b, c.value);

    printf("Global state: %d.\n", g_my_state);
    printf("Global inline state: %d.\n", g_my_internal_state);
}
