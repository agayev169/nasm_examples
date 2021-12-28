    global _start

    section .text
_start:
    mov     rax, 1
    mov     rbx, 2
    cmp     rax, rbx

    jl      less                                ; if rax (1) < rbx(2), print less_buf, otherwise print ge

    mov     rsi, ge
    mov     rdx, 17

    jmp     print

less:
    mov     rsi, less_buf
    mov     rdx, 5

print:
    mov     rax, 1
    mov     rdi, 1
    syscall

    mov     rax, 60
    mov     rdi, 0
    syscall

    section .data
less_buf:   db      "Less", 10
ge:         db      "Greater or equal", 10