section .text                                   ; Code segment of the program
    global _start                               ; Declared for linker to know where to start

_start:                                         ; Tells the linker the entry point
    ; Write message to the user - Displaying 10 stars...
    mov edx, length                             ; Declare the mesage length
    mov ecx, message                            ; Holds the message to display
    mov ebx, 1                                  ; File descriptor that means std_out for writing
    mov eax, 4                                  ; System call for write operation (sys_wirte)
    int 0x80                                    ; int means interrupt, calling the kernel to perorm a system interrupt

    ; Holds the star variable and its length
    mov edx, 10                                 ; Declare the length of the stars
    mov ecx, star                               ; Holds the variable to display
    mov ebx, 1                                  ; File descriptor that means std_out for writing
    mov eax, 4                                  ; System call for write operation (sys_wirte)
    int 0x80                                    ; int means interrupt, calling the kernel to perorm a system interrupt

    ; Exits the program
    mov eax, 1
    int 0x80

section .data                                   ; Data segment of the program - to declare constants
    message db "Displaying 10 stars...", 0xa    ; Declare String to be displayed
    length equ $-message                        ; Declares the length of the string displayed
    star times 10 db '*'                        ; Calculates the number of stars to return
