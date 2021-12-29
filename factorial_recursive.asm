    global _start

    section .text
; copied from an implementation of a dump function written in C and compiled to nasm
dump:
    sub         rsp, 40
    mov         rcx, rdi
    xor         edi, edi
    mov         r9, 7378697629483820647
    mov         BYTE [rsp+19], 10
    lea         r8, [rsp+18]
.L2:
    mov         rax, rcx
    sub         r8, 1
    imul        r9
    mov         rax, rcx
    sar         rax, 63
    sar         rdx, 2
    sub         rdx, rax
    mov         rax, rcx
    lea         rsi, [rdx+rdx*4]
    add         rsi, rsi
    sub         rax, rsi
    add         eax, 48
    mov         BYTE [r8+1], al
    mov         rax, rcx
    mov         rcx, rdx
    mov         edx, edi
    add         edi, 1
    cmp         rax, 9
    jg          .L2
    movsx       rdi, edi
    mov         eax, 19
    add         edx, 2
    sub         rax, rdi
    movsx       rdx, edx
    mov         edi, 1
    lea         rsi, [rsp+rax]
    mov         rax, 1
    syscall
    add         rsp, 40
    ret

factorial:
    mov         rax, rdi
    cmp         rdi, 1                      ; if the base case is reached,
    je          factorial_ret               ; return 1 (1! == 1)

    push        rax                         ; save the argument for the recursive call
    dec         rax                         ; decrement the argument to pass it to the recursive call

    mov         rdi, rax
    call        factorial

    mov         rdx, rax                    ; result is moved to rdx
    pop         rax                         ; restore the argument
    mul         rdx                         ; rax = rax * rdx

factorial_ret:
    ret

_start:
    mov         rdi, 10                     ; rdi is the first argument to factorial function
    call        factorial

    mov         rdi, rax                    ; rax is the result of factorial(10) and rdi is the value to be printed

    call        dump

exit:
    mov         rdi, 0
    mov         rax, 60
    syscall