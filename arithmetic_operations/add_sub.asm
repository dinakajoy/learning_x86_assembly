STDIN     equ 0
STDOUT    equ 1
SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4

segment .data 
   msg1 db "Enter a digit: "
   len1 equ $- msg1 

   msg2 db "Please enter a second digit: "
   len2 equ $- msg2 

   msg3 db "The sum is: "
   len3 equ $- msg3

   msg4 db "The subtraction is: "
   len4 equ $- msg4

   newline db " ", 0xa
   newlineLen equ $- newline

segment .bss
   num1 resb 2 
   num2 resb 2 
   sum resb 2   
   subtraction resb 2   

section	.text
   global _start
	
_start:
   ; Prompt to recieve first digit
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg1         
   mov edx, len1 
   int 0x80                

   ; Read first digit
   mov eax, SYS_READ 
   mov ebx, STDIN  
   mov ecx, num1 
   mov edx, 2
   int 0x80            

   ; Prompt to recieve second digit
   mov eax, SYS_WRITE        
   mov ebx, STDOUT         
   mov ecx, msg2          
   mov edx, len2         
   int 0x80

   ; Read second digit
   mov eax, SYS_READ  
   mov ebx, STDIN  
   mov ecx, num2 
   mov edx, 2
   int 0x80        

   ; Add and display result
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg3          
   mov edx, len3         
   int 0x80

   mov eax, [num1]   ; Move the first number to eax register
   sub eax, '0'      ; Subtracting ascii '0' to convert it into a decimal number
   mov ebx, [num2]   ; Move the second number to ebx
   sub ebx, '0'      ; Subtract ascii '0' to convert it into a decimal number
   add eax, ebx      ; Add eax and ebx
   add eax, '0'      ; Add '0' to to convert the sum from decimal to ASCII
   mov [sum], eax    ; Store the result in memory location sum

   ; Print the sum 
   mov eax, SYS_WRITE        
   mov ebx, STDOUT
   mov ecx, sum        
   mov edx, 2       
   int 0x80

   ; Print newline 
   mov eax, SYS_WRITE        
   mov ebx, STDOUT
   mov ecx, newline         
   mov edx, newlineLen      
   int 0x80

   ; Subtract and display result
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg4          
   mov edx, len4         
   int 0x80

   ; Subtract and display result
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg4          
   mov edx, len4         
   int 0x80

   mov eax, [num1]         ; Move the first number to eax register
   sub eax, '0'            ; Subtracting ascii '0' to convert it into a decimal number
   mov ebx, [num2]         ; Move the second number to ebx
   sub ebx, '0'            ; Subtract ascii '0' to convert it into a decimal number
   sub eax, ebx            ; Subtract eax from ebx
   add eax, '0'            ; Add '0' to to convert the sum from decimal to ASCII  
   mov [subtraction], eax  ; Store the result in memory location subtraction

   ; print the subtraction
   mov eax, SYS_WRITE        
   mov ebx, STDOUT
   mov ecx, subtraction         
   mov edx, 2       
   int 0x80

   ; print newline 
   mov eax, SYS_WRITE        
   mov ebx, STDOUT
   mov ecx, newline         
   mov edx, newlineLen      
   int 0x80

exit:    
   mov eax, SYS_EXIT   
   xor ebx, ebx 
   int 0x80