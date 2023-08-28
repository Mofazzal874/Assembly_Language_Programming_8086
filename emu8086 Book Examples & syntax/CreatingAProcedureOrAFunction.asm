
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
include 'emu8086.inc' ;including the library
org 100h 
;defining macros
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

call m1  ;calling a function 
add ax, bx

call print_num ;printing the value stored at ax

ret ;returing to the operating system



m1 proc   ;begining of m1 procedure
    mov bx,5
    mov ax,2 
    ret ;return to the caller
m1 endp ;end of m1 procedure

END
    




