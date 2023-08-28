
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here

mov al , var1
lea bx , var1

mov b.[bx],44h
mov al , var1




ret

var1 db 22h 



