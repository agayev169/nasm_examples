    global _start

    section .text
_start:
    ; retrieving random number
    mov     rax, 318                    ; getrandom syscall
    mov     rdi, buffer                 ; buffer that will get a random byte
    mov     rsi, buffer_size            ; size of the buffer to fill
    mov     rdx, 0                      ; flags
    syscall
    
    ; deciding whether shot happened
    mov     ax, word [buffer]           ; moving generated number to ax to divide it later
    mov     bl, 6                       ; moving divider to bl
    div     bl                          ; dividing ax by bl; ref: https://stackoverflow.com/a/33109351/9134119

    cmp     ah, 0                       ; the mod is saved in ah, so comparing it to 0 (any other x, 0 <= x < 6 is fine)

    jne     win                         ; for any non-zero value, it's a win, otherwise we continue

    ; lose buffer
    mov     rsi, lose_str               ; rsi <-> buffer
    mov     rdx, 12                     ; rdx <-> buffer size

    jmp     print

win:
    ; win buffer
    mov     rsi, win_str                ; rsi <-> buffer
    mov     rdx, 12                     ; rdx <-> buffer size

print:
    mov     rax, 1                      ; write syscall
    mov     rdi, 1                      ; 1 == stdout
    syscall
    
    mov     rax, 60                     ; exit syscall
    mov     rdi, 0                      ; error code
    syscall

    section .bss
buffer_size equ     1
buffer:     resb    buffer_size

    section .data
lose_str:   db      "You lost :(", 10
win_str:    db      "You won! :)", 10