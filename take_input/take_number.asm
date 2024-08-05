section .bss
    name resb 20                                ; Uninitialized byte space for name (20 charatcers)
    age resb 5                                  ; Uninitialized byte space for age (5 digits)

section .text
    global _start

_start:
    ; Write message to the user - What is your name (Not longer than 20 letters): 
    mov ecx, userName
    mov edx, lengthUserName
    mov eax, 4
    mov ebx, 1
    int 0x80

    ;Read and store the user's name
    mov ecx, name  
    mov edx, 20
    mov eax, 3
    mov ebx, 2
    int 0x80

   ; Write message to the user - How old are you: 
    mov ecx, userAge
    mov edx, lengthUserAge
    mov eax, 4
    mov ebx, 1
    int 0x80

    ;Read and store the user's age
    mov ecx, age  
    mov edx, 5
    mov eax, 3
    mov ebx, 2
    int 0x80

    ; Write message to the user - 'Hello '
    mov ecx, nameOutput
    mov edx, lengthNameOutput
    mov eax, 4
    mov ebx, 1
    int 0x80

    ; Output the name entered
    mov ecx, name
    mov edx, 20
    mov eax, 4
    mov ebx, 1
    int 0x80

    ; Write message to the user - 'You have lived these years long - '
    mov ecx, ageOutput
    mov edx, lengthAgeOutput
    mov eax, 4
    mov ebx, 1
    int 0x80

    ; Output the age entered
    mov ecx, age
    mov edx, 2
    mov eax, 4
    mov ebx, 1
    int 0x80

    ; Add new line
    mov ecx, newLine
    mov edx, lengthNewLine
    mov eax, 4
    mov ebx, 1
    int 0x80

    ; Exits the program
    mov eax, 1
    int 0x80

section .data
    userName db 'What is your name (Not longer than 20 letters): '
    lengthUserName equ $-userName

    userAge db 'How old are you: '
    lengthUserAge equ $-userAge

    nameOutput db 'Hello '
    lengthNameOutput equ $-nameOutput

    ageOutput db 'You have lived these years long - '
    lengthAgeOutput equ $-ageOutput

    newLine db ' ', 0xa
    lengthNewLine equ $-newLine
