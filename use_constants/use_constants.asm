; Declare reused operations as constants
SYS_EXIT    equ 1
STDOUT      equ 1
STDIN       equ 2
SYS_READ    equ 3
SYS_WRITE   equ 4

section .bss
    name resb 20       ; Uninitialized byte space for name (20 charatcers)
    course resb 20     ; Uninitialized byte space for age (20 charatcers)

section	 .data
    userName db	'Your name please', 0xA,0xD 	
    userNameLength equ $ - userName

    userCourse db	'Your course please', 0xA,0xD 
    userCourseLength equ $ - userCourse

    msg1 db	'Hello, '	
    len1 equ $ - msg1			

    msg2 db 'Welcome to the world of, '
    len2 equ $ - msg2 

section	 .text
    global _start

_start:
    ; Write message to the user - 'Your name please'
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, userName         
    mov edx, userNameLength 
    int 0x80 

    ;Read and store the user's name
    mov eax, SYS_READ 
    mov ebx, STDIN
    mov ecx, name  
    mov edx, 20
    int 0x80

    ; Write message to the user - 'Your course please'
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, userCourse         
    mov edx, userCourseLength 
    int 0x80 

    ;Read and store the user's course
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, course  
    mov edx, 20
    int 0x80

    ; Write message to the user - 'Hello, '
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, msg1         
    mov edx, len1 
    int 0x80   

    ; Output the name entered
    mov eax, SYS_WRITE
    mov ebx, STDOUT 
    mov ecx, name
    mov edx, 20
    int 0x80             

    ; Write message to the user - 'Welcome to the world of, '
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, msg2         
    mov edx, len2 
    int 0x80 

    ; Output the course entered
    mov eax, SYS_WRITE
    mov ebx, STDOUT 
    mov ecx, course
    mov edx, 20
    int 0x80

    mov eax, SYS_EXIT
    int 0x80
