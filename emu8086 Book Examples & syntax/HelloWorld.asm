
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


mov ah,09h
mov dx,offset message

int 21h
mov ah,4ch
int 21h

endp
message db "hello world$"
end main



ret




