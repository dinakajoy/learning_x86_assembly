section	.text
   global _start
_start:
	
   ;writing the name 'Dina Joy'
   mov	edx, 9 
   mov	ecx, name
   mov	ebx, 1
   mov	eax, 4
   int	0x80
	
   mov	[name],  dword 'Naka'    ; Changed the name to Naka Joy
	
   ;writing the name 'Naka Joy'
   mov edx, 8
   mov ecx, name
   mov ebx, 1
   mov eax, 4
   int 0x80

    ; Add new line
    mov ecx, newLine
    mov edx, lengthNewLine
    mov eax, 4
    mov ebx, 1
    int 0x80
	
    ; Exits the program
    mov	eax,1
    int	0x80

section	.data
    name db 'Dina Joy '
    newLine db ' ', 0xa
    lengthNewLine equ $-newLine
