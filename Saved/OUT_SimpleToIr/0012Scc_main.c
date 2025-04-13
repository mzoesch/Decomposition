// SCC: (main)

#include "0000StructType_struct.Output.h"


#include "stdio.h"


extern int g_my_state;
extern int g_my_internal_state;


Output pythagorean(const int a, const int b);


int main();


// Function: main
// Path: /mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/003_Simple/main.c
#include ".0012Scc_main_main.fwd"
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


