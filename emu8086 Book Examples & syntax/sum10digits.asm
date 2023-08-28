array DW 10,20,30, 40,50
mov si,0

loop_start:
mov ax , array[si]
add dx,ax

inc si ;
inc si; 
 
cmp si,10 ;

jl loop_start 

hlt