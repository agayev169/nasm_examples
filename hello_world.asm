    global _start

    section .text
_start:
    mov rax, 1                  ; write syscall
    mov rdi, 1                  ; writing to 1 - stdout
    mov rsi, buffer             ; buffer will be written to stdout
    mov rdx, 14
    syscall
    
    mov rax, 60                 ; syscall for exit
    mov rdi, 0                  ; error code
    syscall

    section .data
buffer:
    db "Hello, World!", 10      ; "Hello, World!" + new line char