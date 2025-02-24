STDIN     equ 0
STDOUT    equ 1
SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4

segment .data 
    counter dd 0

    msg1 db "This is a number guessing game. \n You have 5 slots to guess the correct trophy number. \n Let's begin!", 0xA,0xD 
    len1 equ $- msg1 

    msg2 db "Guess a number between 1 and 100: "
    len2 equ $- msg2 

    highMsg db "Too high, try again. "
    highMsgLen equ $- highMsg 

    lowMsg db "Too low, try again. "
    lowMsgLen equ $- lowMsg 

    rightGuess db "Wow, you guessed correctly!", 0xA,0xD 
    rightGuessLen equ $- rightGuess

    wrongGuess db "Oh no! All 5 guesses are wrong!", 0xA,0xD 
    wrongGuessLen equ $- wrongGuess

    newline db " ", 0xa
    newlineLen equ $- newline

segment .bss
    computerguess resd 1
    userguess resb 1

section	.text
   global _start
	
_start:
    ; Generate random number and store it
    rdtsc
    mov eax, edx
    mov ecx, 100
    xor edx, edx 
    div ecx 
    mov [computerguess], edx 
    mov eax, [computerguess] 
    add eax, 1 
    mov [computerguess], eax

    ; print the computerguess
    mov eax, SYS_WRITE        
    mov ebx, STDOUT
    mov ecx, computerguess        
    mov edx, 1      
    int 0x80
    ; print newline 
    mov eax, SYS_WRITE        
    mov ebx, STDOUT
    mov ecx, newline         
    mov edx, newlineLen      
    int 0x80

    ; First prompt for game details
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, msg1         
    mov edx, len1 
    int 0x80  

    jmp prompt_read_and_compare

lesser:
    ; Print lowMsg msg and propmt retry 
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, lowMsg         
    mov edx, lowMsgLen 
    int 0x80  

    jmp prompt_read_and_compare

greater:
    ; Print highMsg msg and propmt retry 
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, highMsg         
    mov edx, highMsgLen 
    int 0x80  

    jmp prompt_read_and_compare

equal: 
    ; Print rightGuess msg and exit 
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, rightGuess         
    mov edx, rightGuessLen 
    int 0x80 

    jmp exit 

end: 
    ; Print wrongGuess msg and exit 
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, wrongGuess         
    mov edx, wrongGuessLen 
    int 0x80 

    jmp exit 

prompt_read_and_compare:
    ; Count and check prompt counter
    mov eax, [counter]
    inc eax
    mov [counter], eax
    cmp eax, 5
    jg end 

    ; Prompt to recieve guess
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, msg2         
    mov edx, len2 
    int 0x80 

    ; Read guess
    mov eax, SYS_READ 
    mov ebx, STDIN  
    mov ecx, userguess 
    mov edx, 2
    int 0x80    

    ; Compare userguess with computerguess
    mov eax, [computerguess]     
    mov ebx, [userguess]
    sub ebx, '0'
    cmp eax, ebx
    jg greater 
    jl lesser 
    je equal 

exit:    
    mov eax, SYS_EXIT   
    xor ebx, ebx 
    int 0x80