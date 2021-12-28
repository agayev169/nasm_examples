    global  _start

    section .text
_start:
    mov rax, 60                 ; syscall for exit
    mov rdi, 0                  ; error code
    syscall