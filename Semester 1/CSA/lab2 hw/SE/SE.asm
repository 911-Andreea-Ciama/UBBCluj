bits 32                                                                                         
global start        
extern exit               
import exit msvcrt.dll    
                          
segment data use32 class=data
    a db 256
    b db 1


segment code use32 class=code
    start:
        ; 256*1-excersise 23 from Simple Excersises
        mov AL, [a]
        mov BL, [b]
        mul BL
        
        
        
        
        
        
        
        
        
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
