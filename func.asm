    global _start

    section .text
_start:
    mov     rbp, rsp                        ; init new call frame; pushing rbp would be required if this was a function
                                            ; so that we could restore our state

    push    qword 3                         ; push arg2
    push    qword 5                         ; push arg1

    call    sum

    sub     rsp, 16                         ; restore rsp

    mov     rdi, rax
    mov     rax, 60
    syscall

sum:
    push    rbp                             ; storing rbp so that we can ret in the end
                                            ; not really needed, since we do not call anything else
                                            ; it's here just for the convention

    mov     rax, qword [rbp - 8]            ; get arg1
    mov     rcx, qword [rbp - 16]           ; get arg2

    add     rax, rcx                        ; rax (retval) = rax + rcx = arg1 + arg2

    pop     rbp                             ; restoring rbp to return back
    ret