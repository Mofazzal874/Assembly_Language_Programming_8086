

main PROC
    MOV CX,15
    MOV BX,0 

BEGIN:
 
    MOV AX,BX  
    MOV SI,2
    DIV SI
    
    TEST AH,1
    JZ EVEN
    MOV DX,0D
    JMP AFTER
    
EVEN:
    MOV DX,1D
    JMP AFTER    
   
AFTER:
INC BX
    



LOOP BEGIN


RET 
    
