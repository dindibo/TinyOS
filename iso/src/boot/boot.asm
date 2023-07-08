[BITS 16]
[ORG 0x7c00]

; -=-=-=-=-=-=-=- Code  -=-=-=-=-=-=-=-

; Code goes here
mov si, bootMsg
mov cx, bootMsgLen
call int_print

; Read disk to 

; Loop forever
jmp $

; -=-=-=-=-=-=-=- Functions  -=-=-=-=-=-=-=-

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

; -=-=-=-=-=-=-=- Data -=-=-=-=-=-=-=-

bootMsg db "Booting os-1", 0
bootMsgLen:  equ $-bootMsg-1

TIMES 510-($-$$) db 0
dw 0xaa55
