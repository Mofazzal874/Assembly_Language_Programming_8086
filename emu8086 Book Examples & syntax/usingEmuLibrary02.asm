
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
 
include 'emu8086.inc'

org 100h
    
 
DEFINE_PRINT_STRING
DEFINE_SCAN_NUM
DEFINE_PTHIS
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS



     
     lea si, msg1
     call print_string
     call scan_num 
     
     mov ax , cx
     
      
     call pthis
     db 13,10 ,"You have entered: ",0
     call print_num
     
ret  

msg1 db "Enter a Number : ",0


END


