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
    
    
    ;variableName dw ?    ;If you don't care what value a data item is initialized to , then you can indicate this with a "?"
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
