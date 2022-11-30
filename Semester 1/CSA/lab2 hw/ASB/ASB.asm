bits 32                                                                                         
global start        
extern exit               
import exit msvcrt.dll    
                          
segment data use32 class=data
    a db 5
    b db 8
    c db 1
    d db 9


segment code use32 class=code
    start:
        ; (a-c)+(b+b+d) from additions, substractions, all variables as bytes
        ;a+13-c+d-7+b
        mov AL, [a]
        add AL, 13
        sub AL, [c]          
        add AL, [d]
        sub AL, 7
        add AL, [b]

        
        
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
