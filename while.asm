    global _start

    section .text
_start:
    mov     rbx, 10

while:
    cmp     rbx, 0

    jle     end                         ; if rbx <= 0, exit the loop

    ; print a star
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, char
    mov     rdx, 1
    syscall

    dec     rbx
    jmp     while

end:
    ; print new line
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, newline
    mov     rdx, 1
    syscall

    mov     rax, 60
    mov     rsi, 0
    syscall

    section .data
char        db  "*"
newline     db  10