icalc: icalc.o
			gcc -g -o icalc icalc.o -no-pie
icalc.o: icalc.asm
			nasm -f elf64 -g -F dwarf icalc.asm -l icalc.lst