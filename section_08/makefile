memory: memory.o
			gcc -g -o memory memory.o -no-pie
memory.o: memory.asm
			nasm -f elf64 -g -F dwarf memory.asm -l memory.lst