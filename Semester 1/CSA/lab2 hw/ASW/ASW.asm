bits 32                                                                                         
global start        
extern exit               
import exit msvcrt.dll    
                          
segment data use32 class=data
    a dw 128
    b dw 128
    c dw 240
    d dw 15


segment code use32 class=code
    start:
        ; (a+b+c)-(d+d) from additions, substractions, all variables as words
        mov AL, [a]
        add AL, [b]
        add AL, [c]
        
        mov BL, [d]
	  add BL,[d]
        
        sub AL, BL
     
        
        
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
