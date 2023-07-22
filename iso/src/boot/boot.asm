[BITS 16]
[ORG 0x7c00]

; -=-=-=-=-=-=-=- Code  -=-=-=-=-=-=-=-

; Code goes here
mov si, bootMsg
mov cx, bootMsgLen
call hexdump3

; Read disk to 

; Loop forever
jmp $

; -=-=-=-=-=-=-=- Functions  -=-=-=-=-=-=-=-

halt:
jmp $

; hex_print(ax(char) --> value)
hex_print:
push dx
push cx
push si

mov dl, 0x10
div dl

movzx cx, ah
push cx

movzx ax, al 
mov si, hexdump_charset
add si, ax 
mov ax, [si]
call kputc

; Get reminder
pop ax
mov si, hexdump_charset
add si, ax 
mov ax, [si]
call kputc

mov ax, 0x20
call kputc

; Restore regs
pop si
pop cx
pop dx

ret


; int_print(si(void *) --> msg, cx(int) --> msgLen)
;--------------------------------------------------
int_print:
mov ah, 0x0e
mov al, [si]

; Boot message
putc:
int 0x10
inc si
mov al, [si]
loop putc
ret


; hexdump3(si(void *) --> data, cx(int) --> dataLen)
;--------------------------------------------------
hexdump3:
hexdump3_loop1:

movzx ax, byte [si]
call hex_print
inc si

loop hexdump3_loop1
ret

; kputc(al(char) --> ch)
;--------------------------------------------------
kputc:
mov ah, 0x0e
int 0x10
ret

_start:
nop


; -=-=-=-=-=-=-=- Data -=-=-=-=-=-=-=-


bootMsg db "Booting os-1", 0
bootMsgLen:  equ $-bootMsg-1
hexdump_charset db "0123456789ABCDEF"

TIMES 510-($-$$) db 0
dw 0xaa55
