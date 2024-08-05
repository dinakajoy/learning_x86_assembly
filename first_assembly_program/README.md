# First program in Assembly Language

## Hello World program
This is my first program in Assembly Language that prints "Hello, World!" to the console

## STeps to run the program
To compile - eg: `nasm -f elf64 -o hello.o hello.asm` (Ensure you have nasm installed - `sudo apt-get install nasm` for Ubuntu OS)    
    - This generates the .o (hello.o) file    
To Execute the program - eg: `ld hello.o -o hello` (ld is a default linker that comes with Ubuntu OS)    
    - This generates an executable file with the name of your project - hello    
