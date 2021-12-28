    global _start

    section .text
_start:
    mov rax, 3
    mov rdi, 10
    add rdi, rax                ; error code = rax + rdi = 3 + 10 = 13
    mov rax, 60                 ; syscall for exit
    syscall