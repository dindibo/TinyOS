[BITS 16]
[ORG 0x7c00]

; Code goes here
mov ah, 0x0e

; Loop init
mov cx, bootMsgLen
mov si, bootMsg
mov al, [si]

; Boot message
putc:
int 0x10
inc si
mov al, [si]
loop putc

; Loop forever
jmp $

; Data
bootMsg db "Booting os-1", 0
bootMsgLen:  equ $-bootMsg-1

TIMES 510-($-$$) db 0
dw 0xaa55
