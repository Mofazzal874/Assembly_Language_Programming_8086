.model small

.stack 100h

.data 
array db 1,3,11,14,21,8
sum db 0  

.code
main proc
    mov ax , @data
    mov ds,ax
    mov cx , 6
    mov si, 0 
    mov ah , 2 
    
output:
    mov dl, array[si]
    len db array[si]-1 
    mov dh, 2
innner:
    mov bl, array[si]
    mov al , dh
    div bl 
    jz output 
    loop innner
    mov ah,02h
    int 21h 
    inc si
    loop output
main endp
end main