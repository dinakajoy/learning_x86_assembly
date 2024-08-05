# Second program in Assembly Language

## Stars program
This is my second program in Assembly Language that prints 10 stars to the console

## STeps to run the program
To compile - eg: `nasm -f elf64 -o stars.o stars.asm` (Ensure you have nasm installed - `sudo apt-get install nasm` for Ubuntu OS)    
    - This generates the .o (stars.o) file    
To Execute the program - eg: `ld stars.o -o stars` (ld is a default linker that comes with Ubuntu OS)    
    - This generates an executable file with the name of your project - stars    
