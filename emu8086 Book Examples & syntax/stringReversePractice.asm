.model small


data segment
msg1 db "Enter the String: " 10, 13, '$'
msg2 db "The string is a palindrome" 10 ,13, '$'
msg3 db "The string is not a palindrome" 10 , 13, '$'

str db 10H dup('$')
data ends

extra segment
    revstr db 10H
extra ends

code segment
    assume cs:code , ds:data , es:extra   
    
start: mov ax,data
       mov ds,ax
       mov ax, extra
       mov es,ax
       
       mov ah,09
       lea dx,str
       int 21h
       
       lea si , str
       inc si 
       mov cl, [si]
       mov bl , cl 
       
        