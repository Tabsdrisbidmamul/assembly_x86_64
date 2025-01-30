move: move.o
			gcc -g -o move move.o -no-pie
move.o: move.asm
			nasm -f elf64 -g -F dwarf move.asm -l move.lst