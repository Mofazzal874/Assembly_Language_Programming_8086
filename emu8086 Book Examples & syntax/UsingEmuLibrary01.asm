
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
 
 
include 'emu8086.inc'  ;this include the emu libaray

org 100h

; add your code here

PRINT "Hello World!"  ;print command prints a string


gotoxy 10,5     ;move the cursor to x,y position
putc 65 
putc 'B'
gotoxy 10,7  
printn "What is this?"

ret    ;return to the operating system
 
end    ;directive to stop the compiler




