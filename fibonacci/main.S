.data
num: .asciz "%li "
newline: .asciz "\n"

.extern printf // extern int printf(const char *__restrict__ __format, ...);

.text
.globl fibonacci_asm    // extern void fibonacci_asm(int len)
fibonacci_asm:          //

                        // {
    
    push %r12               // Save registers
    push %r13               //
    push %r14               //

    xor %r12, %r12          // long int r12 = 0;

    mov $1, %r13            // long int r13 = 1;

    mov %rdi, %r14          // long int r14 = len;

L0:                         // L0:

    lea num(%rip), %rdi     // printf("%li ", r12);
    xor %eax, %eax          //
    mov %r12, %rsi          //
    call printf             //

    mov %r13, %rax          // rax = r13;

    add %r12, %r13          // r13 += r12;

    mov %rax, %r12          // r12 = rax;

    dec %r14                // if(--r14 >= 0) goto L0;
    cmp $0, %r14            //
    jge L0                  //

    lea newline(%rip), %rdi // printf("\n");
    xor %eax, %eax          //
    call printf             //

    pop %r12                // Restore registers
    pop %r13                // Restore registers
    pop %r14                // Restore registers

    ret                     // return;

                        // }