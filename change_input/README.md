# Change Word program in Assembly Language
To learn how Addressing Modes works in Assembly Language      

## STeps to run the program
To compile - eg: `nasm -f elf64 -o change_word.o change_word.asm` (Ensure you have nasm installed - `sudo apt-get install nasm` for Ubuntu OS)    
    - This generates the .o (change_word.o) file    
To Execute the program - eg: `ld change_word.o -o change_word` (ld is a default linker that comes with Ubuntu OS)    
     - This generates an executable file with the name of your project - change_word  
     - To run the executable file with the name of your project - `./change_word`  
