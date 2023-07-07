CC:=i686-elf-gcc
CFLAGS:=-c -Wall
LD:=i686-elf-ld
LDFLAGS:=-T linker.ld -o kernel.bin
ASM:=nasm
ASMFLAGS:=-f bin

boot.o:
	$(ASM) $(ASMFLAGS) -o ../../bin/boot.bin ./boot.asm 

clean:
	$(shell rm -rf *.o boot.o)
