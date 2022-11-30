bits 32                                                                                         
global start        
extern exit               
import exit msvcrt.dll  
                           

;our data is declared here                           
segment data use32 class=data
    a db 64
    b db 4
    d db 5

    ;our code starts here
segment code use32 class=code
    start:
        ;[(a+b)*2]/(a+d)
        mov AL, [a]
	    add AL, [b]
        mov BL, 2
        mul BL          ; AX=2*(a+b)
        
        
        mov BL, [a]
        add BL, [d]     ;BL=a+d
        
        div BL      
        
        
        
        
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program

