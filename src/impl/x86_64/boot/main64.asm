global long_mode_start
extern kernel_main

section .text
bits 64
long_mode_start:
    ; setup data segments
    mov ax, 0   ; can't write to ds/es directly
    mov ds, ax
    mov es, ax

    ; setup stack
    mov ss, ax
    mov fs, ax
    mov gs, ax

    call kernel_main
    hlt