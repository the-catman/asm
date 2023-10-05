#include <stdio.h>

// Extern here basically means that the compiler is looking for an external function.

/** Adds all the numbers, then prints it, then returns it. */
extern long add(long a, long b, long c, long d, long e, long f, long g, long h, long i);

int main()
{
    printf("From C: %li\n", add(1, 2, 3, 4, 5, 6, 7, 8, 9));
    return 0;
}