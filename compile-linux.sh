#!/bin/bash

nasm -f elf32 -o dbg.o iso/src/boot/boot.asm
ld -m elf_i386 -o dbg dbg.o
