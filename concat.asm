    global _start

    section .text
_start:
    mov     rax, 0
    mov     rbx, buf1_size

buf1_copy:
    cmp     rbx, rax

    jle     end_buf1_copy

    mov     bl, byte [buf1 + rax]
    mov     byte [resstr + rax], bl

    inc     rax
    jmp     buf1_copy

end_buf1_copy:
    mov     rax, 0
    mov     rbx, buf2_size

buf2_copy:
    cmp     rbx, rax

    jle     end_buf2_copy

    mov     bl, byte [buf2 + rax]
    mov     byte [resstr + rax + buf1_size], bl

    inc     rax
    jmp     buf2_copy

end_buf2_copy:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, resstr
    mov     rdx, 14
    syscall

    mov     rax, 60
    mov     rdi, 0
    syscall

    section .data
buf1:       db      "Hello, "
buf2:       db      "World!", 10

    section .bss
buf1_size   equ     7
buf2_size   equ     7

resstr      resb    14