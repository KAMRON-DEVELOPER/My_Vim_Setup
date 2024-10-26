section .data
    hello db 'Hello, World!', 0    ; The string to be printed

section .text
    global _start               ; Entry point for the linker

_start:
    ; Write the string to stdout
    mov eax, 4                  ; The system call for sys_write
    mov ebx, 1                  ; File descriptor 1 - stdout
    mov ecx, hello              ; Pointer to the string
    mov edx, 13                 ; Number of bytes to write
    int 0x80                    ; Call kernel

    ; Exit the program
    mov eax, 1                  ; The system call for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

