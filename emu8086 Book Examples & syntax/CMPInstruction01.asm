
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
 
 
include 'emu8086.inc' ;including 8086 library

org 100h  ;instructions will start from 100h address


DEFINE_PTHIS ;defining the macro for pthis
 

mov al,25  ; set al to 25 
mov bl,10  ;set bl to 10 

cmp al,bl  ;comparing al-bl

je equal   ;checking the flags.If ZF=1 , that means al=bl.
            ;In this case program control 
            ;will jump to "equal" segment

call pthis  ;printing a null terminated string "No"
db 13,10 "NO",0   ; db = define bytes
                  ; 13,10 for a new line after printing.13,10 is same as /r/n
                  ;this means after printing a newline control will move to the 
                  ;begining of the line(leftmost side)
                                    
jmp stop ;jump to stop segment after the job done

equal:
call pthis
db 13,10 "YES",0



stop:
ret
 
END




