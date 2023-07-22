section .text
global _start

_start:
nop
jmp $

; hexdump2(si(void *) --> data, cx(int) --> dataLen)
;--------------------------------------------------
hexdump2:

hexdump2_loopA:
mov ax, [si]

push dx
push cx

xor dx, dx
mov cx, 0x10

; Do division
div cx

; print / 16
mov si, hexdump_charset
add si, ax
mov ax, [si]
call kputc

; print % 16
;call kputc
pop cx
pop dx

inc si
loop hexdump2_loopA
ret

; kputc(al(char) --> ch)
;--------------------------------------------------
kputc:
mov ah, 0x0e
int 0x10
ret

section .data

hexdump_charset db "0123456789ABCDEF"

