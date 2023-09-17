#include <stdio.h>

// Extern here basically means that the compiler is looking for an external function.

/** Adds two numbers, then returns the result. */
extern int add(int x, int y);

int main()
{
    int result = add(256, 5);
    printf("Result: %i\n", result);
    return 0;
}