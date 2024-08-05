# Third program in Assembly Language

## Collect User Input program
This is my third program in Assembly Language that asks a user for an input and prints the data to the console

## STeps to run the program
To compile - eg: `nasm -f elf64 -o take_number.o take_number.asm` (Ensure you have nasm installed - `sudo apt-get install nasm` for Ubuntu OS)    
    - This generates the .o (take_number.o) file    
To Execute the program - eg: `ld take_number.o -o take_number` (ld is a default linker that comes with Ubuntu OS)    
    - This generates an executable file with the name of your project - take_number    
