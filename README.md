# Program-1:(Multiplication)
```assembly
;Abstract  :This program multiplies the two 16 bit words in the memory 
           ;location called multiplicand and multiplier . The result is stored in the memory location , Product 
           
           
           
;register used : cs , ds , ax , dx
;port used : None  

data segment 
    
    multiplicand dw 204AH ; declaring a variable called multiplicand with initial value 204A(in hexa) 
                          ;& we are saying that the data is of type word or 16 bit 
                          ;(DB-define byte(8 bit) , DW - Define word , DD - define Double (32bit))
    
    ;Here the will set aside two successive memory locations and assign the name multiplicand to the first location.
    ; so , multication is actually a location or address & we can access it or call it with "muliplicand" .
    ;the starting memory address (first 8 bit) will contain the low byte of the word (4AH) and the second memory address
    ; will contain the high byte of the word(20H)  
                          
                                                                      
    multiplier   dw 3B2AH ;another variable
    
    product dw 2 dup(0)   ; Here we are declaring another variable to store the result of the multiplication for 2 words  in memory(result can be 32 bit) 
                          ; the dup(0) part of the statement tell the assembler to initialize the two words(High byte and low byte) to all zeroes.
                          ;we could have use DD(Define Double -32bits) here.But as we are moving one word at a time , it is more 
                          ;convenient to declare product 2 words.
    
    
    
    ;The figure in the link
    ;(![WIN_20230926_16_12_55_Pro](https://github.com/Mofazzal874/Assembly_Language_Programming_8086/assets/35369040/ea074165-f891-49c7-ab9f-c99d9806abae))
    ; shows how the data for multiplicand and multiplier will actually be arranged in memory starting from the base of the data(segment base address)
    
    
    
ends

stack segment
    dw   128  dup(0)
ends

code segment
    ASSUME CS:code , DS:data
start: 
; set segment registers:
    mov ax, data          ;initializing DS register
    mov ds, ax
    mov es, ax            ;as ES register also works with DS register so we're also initializing ES as part of DS 
    
    
    ;NOTE:
    ;code segment register doesn't need to be initialized .Because Code segment register is 
    ;loaded with the correct starting value by the system command
    ;you use to run the program.




    ; add your code here
    
    mov ax , multiplicand ; 
    MUL multiplier        ; multiplying it with the content of ax.   
    
    
    
    ;CAUTION:
    ;But ax can only contain 16bit(or 1 word) .But the result will be 32bit(2 word) . So the low byte of result will be 
    ; stored in ax and high byte of result will be stored in DX(This is by default by the assembler).
    
    
    
    mov product , ax      ; Here the low byte of result will be stored in product(see the link diagram)
    mov product + 2 , dx  ; store the high byte of result
    
    
    int 3                 ; wait for command from the user  
    
            
    
    
    
    
    
ends

end start ; set entry point and stop the assembler.

```
## Memory Contents:
![WIN_20230926_16_12_55_Pro](https://github.com/Mofazzal874/Assembly_Language_Programming_8086/assets/35369040/ea074165-f891-49c7-ab9f-c99d9806abae)

This is the total execution with memory addressing in the left side :
![WIN_20230926_16_56_03_Pro](https://github.com/Mofazzal874/Assembly_Language_Programming_8086/assets/35369040/85ff4a4a-59ca-4edb-8e86-0c626a79305b)



# Program-02:(Division)

```assembly

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
```







# **Jumps, Flags And Conditional Jumps:**

Jump instructions are used to tell the computer the address to fetch its next instruction from .

->Two types of jump instruction:
- conditional Jumping
- unconditional Jumping


if the JMP destination is in a code segment , the 8086 only has to change the contents of the instruction pointer(IP). This type of jump is referred to as a **Near** or **intrasegment jump** . 

If the JMP instruction is ina code segment which ahs a different name from the segment in which the jump instruction is located , the 8086 has to change the contents of both CS and IP to make the jump . This type of jump is called **far** or **intersegment jump**.


unconditional jump Instructions for intel 8086 diagram :

![WIN_20230926_17_57_56_Pro](https://github.com/Mofazzal874/Assembly_Language_Programming_8086/assets/35369040/402d0d89-0ce0-45ca-84a4-e25e3e5d7058)


## **program-03(JUMP Instruction):**
```assembly
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
```

**8086 conditional Flags** 
Has 6 flags : 
- CF , AF(Auxiliary flag) , PF(parity flag) , ZF(zero flag) , SF(sign flag) , OF(Overflow flag) . 
![WIN_20230926_18_12_36_Pro](https://github.com/Mofazzal874/Assembly_Language_Programming_8086/assets/35369040/ddc96690-e58e-4c8b-94ef-20330b49fae5)

-Parity flag : if a binary number has an even number of 1's than PF =1  and it is called even parity . 


**8086 conditional Jump instructions**
![WIN_20230926_18_15_51_Pro](https://github.com/Mofazzal874/Assembly_Language_Programming_8086/assets/35369040/80532c23-a889-4c49-9e0a-2cd7910475fc)


# **IF_THEN , IF_THEN-ELSE ,  and MULTIPLE IF-THEN-ELSE Programs**


    







