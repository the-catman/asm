; The first parameter to instructions is the destination, unlike in AT&T syntax.
; So for example, mov rax, rbx means rax = rbx.

; I'm using 64 bit registers because I said so. Sue me.

global add
add:
    add rdi, rsi ; rdi (which is x) += rsi (which is y)
    mov rax, rdi ; rax = rdi. rax is the register for returning stuff.
    ret ; Return