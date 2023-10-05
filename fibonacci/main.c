extern int printf(const char *__restrict__ __format, ...);

extern void fibonacci_asm(int len);

void fibonacci_c(int r14)
{
    long int r12 = 0;
    long int r13 = 1;
    L0:
    printf("%li ", r12);
    long int rax = r13;
    r13 += r12;
    r12 = rax;
    if(--r14 >= 0) goto L0;
    printf("\n");
    return;
}

int main()
{
    printf("Assembly fibonacci sequence: "); fibonacci_asm(10);
    printf("C fibonacci sequence: ");  fibonacci_c(10);
    return 0;
}