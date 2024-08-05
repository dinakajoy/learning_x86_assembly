# Use of Constants in Assembly Language

## STeps to run the program
To compile - eg: `nasm -f elf64 -o use_constants.o use_constants.asm` (Ensure you have nasm installed - `sudo apt-get install nasm` for Ubuntu OS)    
    - This generates the .o (use_constants.o) file    
To Execute the program - eg: `ld use_constants.o -o use_constants` (ld is a default linker that comes with Ubuntu OS)    
    - This generates an executable file with the name of your project - use_constants    
    - To run the executable file with the name of your project - `./use_constants` 
