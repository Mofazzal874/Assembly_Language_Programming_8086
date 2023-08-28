include emu8086.inc
ORG 100h
MOV AL, 25 ; set AL to 25.
MOV BL, 10 ; set BL to 10.
CMP AL, BL ; compare AL - BL.
JNE not_equal ; jump if AL <> BL (ZF = 0).
JMP equal
not_equal:
; let's assume that here we
; have a code that is assembled
; to more then 127 bytes...
PUTC 'N' ; if it gets here, then AL <> BL,
JMP stop ; so print 'N', and jump to stop.
equal: ; if gets here,
PUTC 'Y' ; then AL = BL, so print 'Y'.
stop:
RET ; gets here no matter what.
END