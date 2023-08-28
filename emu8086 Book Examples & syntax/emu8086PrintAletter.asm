org 100h


mov ax,0b800h

mov ds,ax

mov cl,41h
MOV CH, 01011111b

mov bx,15Eh

mov [bx],cx

ret