// The second destination is the destination, unlike in Intel syntax.
// So for example: movq %rbx, %rax means rax = rbx.

// I'm using 64 bit registers because I'm lazy. Sue me.

.data
format: .asciz "From x86-64 assembly: %d\n"

.extern printf

.text
.globl add
add:
    addq %rsi, %rdi // rdi (which is a) += rsi (which is b)
    addq %rdx, %rdi // rdi (which is a) += rdx (which is c)
    addq %rcx, %rdi // rdi (which is a) += rcx (which is d)
    addq %r8, %rdi // rdi (which is a) += r8 (which is e)
    addq %r9, %rdi // rdi (which is a) += r9 (which is f)

    addq $8, %rsp // Add 8 to stack pointer. This is because when we have more than 6 parameters, we push the rest of the parameteres onto the stack.

    popq %rdx // Pop g from stack and save it to rdx
    addq %rdx, %rdi // rdi (which is a) += rdx (which is g)

    popq %rdx // Pop h from stack and save it to rdx
    addq %rdx, %rdi // rdi (which is a) += rdx (which is h)

    popq %rdx // Pop i from stack and save it to rdx
    addq %rdx, %rdi // rdi (which is a) += rdx (which is i)

    movq %rdi, %rsi // rdi = rsi. Move string to rsi, the register for passing the second parameter to a function
    
    pushq %rdi // Push rdi to the stack, because calling printf will change a bunch of registers.

    lea format(%rip), %rdi // Move string to rdi, the register for passing the first parameter to a function
    xor %eax, %eax // Set eax to 0, this is basically the amount of parameters we have on the stack (so, none)
    call printf // Call printf

    popq %rax // Pop our previous rdi to rax, which is the register used for returning stuff.
    subq $32, %rsp // Return our stack pointer back to where it was. We popped 4 times, therefore we need to go back 4 * 8 = 32 in rsp. (Since we're in 64 bit mode,
    // each stuff is 8 bytes).

    retq // Return