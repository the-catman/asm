// The second parameter to instructions is the destination, unlike in Intel syntax.
// So for example: movq %rbx, %rax means rax = rbx.

// I'm using 64 bit registers because I said so. Sue me.

.data
mystr: .asciz "From x86-64 assembly: %li\n"

.extern printf

.text
.globl add
add:
    add %rsi, %rdi // rdi (which is a) += rsi (which is b)
    add %rdx, %rdi // rdi (which is a) += rdx (which is c)
    add %rcx, %rdi // rdi (which is a) += rcx (which is d)
    add %r8, %rdi // rdi (which is a) += r8 (which is e)
    add %r9, %rdi // rdi (which is a) += r9 (which is f)
    add 8(%rsp), %rdi // rdi (which is a) += rsp + 8 (which is g)
    add 16(%rsp), %rdi // rdi (which is a) += rsp + 16 (which is h)
    add 24(%rsp), %rdi // rdi (which is a) += rsp + 24 (which is i)

    // Basically, %rdi, %rsi, %rdx, %rcx, %r8 and %r9 are the first, second, third, fourth, fifth and sixth parameters to a function respectively.
    // The rest of the parameters are pushed onto the stack, which we can access using %rsp.
    // (And this ironically means that having 6 or less parameters is nanoseconds more efficient than having 7+ parameters)
    // In this case, we have 9 parameters, 6 go into registers, and the 3 go onto the stack.
    // Think of the stack as a giant array, and rsp is the index of that array.
    // We go up eight by eight on rsp, simply because this is code is for 64 bits. 64 / 8 = 8 bytes.
    // If we had 32 bits, we would go up four by four. 32 / 8 = 4 bytes. But we don't ;)

    mov %rdi, %rsi // rdi = rsi. Move rdi to rsi, which is the register for passing the second parameter to a function.
    // I know we could've added the numbers to rsi directly instead of adding it to rdi then moving it to rsi,
    // but I did it like so for readability and for newbies to understand.
    
    push %rdi // Push rdi to the stack, because calling printf will change a bunch of registers.

    lea mystr(%rip), %rdi // Move string to rdi, which is the register for passing the first parameter to a function. I have no idea what %rip is.
    xor %eax, %eax // Set eax (and consequently %al) to 0 (we have 0 vector registers).
    // Why this is done is explained slightly here: https://stackoverflow.com/questions/6212665/why-is-eax-zeroed-before-a-call-to-printf
    // As well as here: https://cs.brown.edu/courses/csci1310/2020/notes/l08.html
    // Apparently, Vector Registers are used when mixing floating point numbers with printf (XMM0 -> XMM31)
    call printf // Call printf

    pop %rax // Pop our previous rdi to rax, which is the register used for returning stuff.

    ret // Return rax