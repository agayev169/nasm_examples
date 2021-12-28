    global _start

    section .text
_start:
    ; print "What is your name?"
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, get_name_buf
    mov     rdx, 21
    syscall

    ; get name
    mov     rax, 0
    mov     rdi, 0
    mov     rsi, name_buf
    mov     rdx, name_buf_size
    syscall                                     ; after this, rax contains the number of bytes read

    ; remove \n from the end if present
    mov     bl, byte [name_buf + rax - 1]
    cmp     bl, 10

    jne     print_hello

    sub     rax, 1

    push    rax                                 ; push number of bytes read (without \n) to use later

print_hello:
    ; print "Hello, "
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, hello_buf
    mov     rdx, 7
    syscall

    ; print name
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, name_buf
    pop     rdx                                 ; number of bytes were pushed earlier
    syscall

    ; print suffix
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, suffix_buf
    mov     rdx, 2
    syscall
    
    mov     rax, 60
    mov     rdi, 0
    syscall

    section .bss
name_buf_size   equ     128
name_buf:       resb    name_buf_size

    section .data
get_name_buf:   db      "What is your name?", 10, "> "
hello_buf:      db      "Hello, "
suffix_buf:     db      "!", 10