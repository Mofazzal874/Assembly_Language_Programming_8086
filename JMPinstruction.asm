; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
    assume cs:code , DS: data

 
start:
;Example of backward jump 
BACK: 
    ADD al , 03H ; 
    NOP          ;Dummy operations 
    NOP          ; 
    JMP BACK     ; here the IP's displacement will be negative , indicating a Backward Jump . 
    
    
;Example of forward jump 
JMP Forward      ; Here the IP's displacement will be positive , indication a forward jump .

    NOP  ; 
    NOP  ;
    
    
Forward :
     MOV al , 03H ;  
     NOP ; 
     NOP ; 
     NOP ; 
 


    
ends

end start ; set entry point and stop the assembler.
