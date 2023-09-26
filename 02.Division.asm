;abstract       : This program calculate two given temperature and give their average temperature as output 



;Registers used : DS  , CS , AX , BL 
;ports          : None used 

data segment
    hi_temp db 92H    ; first temperature
    lo_temp db 52H    ; 2nd temperature
    avg_temp db ?     ; average temp 
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    ASSUME CS:code , DS: Data
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here

    mov al , hi_temp  ; we're using db , so al register should be used 
    add al ,lo_temp   ; 
    
    ;Now after the adding , we have to check if the result is greater than FFH. That means the result can not be held
    ;in 8 bit(al) register . we have to use AH to store the rest(High byte).
    ;For this, firstly we'll clear the AH(set it's contents to 00H)
    ;secondly we'll do ADC operation.ADC is just like add but it also add the carry flag .
     
    ;ADC syntax: ADC register , contents(we'll do-> ADC AH , 00H)
    
    ;It will do  00H + 00H + carryflag(CF) , so that the least significant bit in AH will be equal to carry flag .
     
     
    mov AH , 00H ;clearing the AH to 00000000B
    adc ah , 00H ; put carry in LSB of AH  ; it is actually doing 00H + 00H + CF

    ;Now the AX contains the result of lo_temp+hi_temp 
        
    mov bl , 02H ; Now we need to divide the result in ax by 2
    div Bl       ; divide ax by Bl 
    
    ;Division Operation ;
     
    ;:8-Bit:
    
    ;quotient:AL
    ;remainder:AH 
    ;If you divide a 16 bit number by a 8 bit number , the quotient will be in Al and Remainder will be in AH.(Because if you divide a number 
    ;with 8 bit number x , the result will always be less than or equal that number x). So it will be contained in Al 
    ;16-bit; 
    ;quotient : AX(16 bit) 
    ;Remainder:DX (16bit)
    ;If you divide a 32 bit nuber by a 16 bit number, then the quotient will be in AX and Remainder will be  in DX . 
       
    
     
     
     mov avg_temp , al ; mov the quotient in al to variable avg_temp ; 
    
    
    
    ;Here goes Nothing!!!
    ;This part is not that important 
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
