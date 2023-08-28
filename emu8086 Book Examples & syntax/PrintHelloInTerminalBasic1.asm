
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

;This program prints "Hello!" in terminal

mov ah , 0Eh



mov al,'H'
int 10h
mov al, 'e'
int 10h
mov al, 'l'
int 10h 
mov al, 'l'
int 10h
mov al , 'o'
int 10h
mov al, '!'
int 10h  

ret




