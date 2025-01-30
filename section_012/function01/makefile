function: function.o
			gcc -g -o function function.o -no-pie
function.o: function.asm
			nasm -f elf64 -g -F dwarf function.asm -l function.lst