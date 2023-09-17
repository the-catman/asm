#include <stdio.h>

// Extern here basically means that the compiler is looking for an external function.

/** Adds all the numbers, then prints it, then returns it. */
extern int add(int a, int b, int c, int d, int e, int f, int g, int h, int i);

int main()
{
    printf("From C: %i\n", add(1, 2, 3, 4, 5, 6, 7, 8, 9));
    return 0;
}