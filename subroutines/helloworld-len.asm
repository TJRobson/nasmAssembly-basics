; Hello World Program (Subroutines)
; Compile with: nasm -f elf helloworld-len.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 helloworld-len.o -o helloworld-len
; Run with: ./helloworld-len

section .data
msg     db      'Hello, brave new world!', 0Ah

section .text
global  _start

_start:

    mov     eax, msg        ; move the address of our message string into EAX
    call    strlen          ; call our function to calculate the length of the string

    mov     edx, eax        ; our function leaves the result in EAX
    mov     ecx, msg        ; this is all the same as before
    mov     ebx, 1
    mov     eax, 4
    int     80h

    mov     ebx, 0
    mov     eax, 1
    int     80h

strlen:                     ; this is our first function declaration
    push    ebx             ; push the values in EBX onto the stack to preserve it while we use EBX in this function
    mov     ebx, eax        ; move the address of EAX into EBX (both point to the same sement in memory)

nextchar:                   ; this is same as previous less (dir calculate_string_length)    
    cmp     byte [eax], 0
    jz      finished
    inc     eax
    jmp     nextchar

finished:
    sub     eax, ebx
    pop     ebx             ; pop the value off the stack back into EBX
    ret                     ; return to where the function was called
