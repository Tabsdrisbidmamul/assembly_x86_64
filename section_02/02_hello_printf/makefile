hello: hello.o
			gcc -g -o hello hello.o -no-pie
hello.o: hello.asm
			nasm -f elf64 -g -F dwarf hello.asm -l hello.lst