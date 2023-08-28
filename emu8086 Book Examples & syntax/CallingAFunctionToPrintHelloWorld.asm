
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt



include 'emu8086.inc'   
 
org 100h 

LEA SI,msg1  ;loading the effective address(DS:SI) of msg1 variable into SI register

call printf  ; calling printf procedure/function

RET          ;return to operating system 


msg1 DB 'Hello World!' ,0     ;You must declare variable between RET and END .


printf PROC  ;printf procedure to print "Hello World" in the terminal
    
    repeat:    ;this is same as for loop c/c++ higher language
    
    ;if(s[i] == '/0') then stop 
    
    CMP b.[SI], 0  
    JE stop       ;above line does- [SI]-0. If the result is zero then jump to stop 
    
    ;else
    putc [SI]  ;print the character
    
    INC SI ;increment the SI pointer
    JMP repeat     ;start the loop again
    
    stop:
    RET    ;(return to the caller- 'printf')
    
printf ENDP  ; end of printf procedure/function

END
    
    




