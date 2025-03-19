#include <stdio.h>

int multiply(int a, int b)
{
    return a * b;
}

int add(int a, int b)
{
    return a + b;
}

int square(int a)
{
    return multiply(a, a);
}

int pythagorean(int a, int b)
{
    return add(square(a), square(b));
}

int main()
{
    printf("Number A: ");
    int a; scanf("%d", &a);
    printf("Number B: ");
    int b; scanf("%d", &b);
    int c = pythagorean(a, b);

    printf("The sum of the squares of %d and %d is %d.\n", a, b, c);

    return 0;
}
