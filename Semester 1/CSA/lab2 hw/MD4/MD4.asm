bits 32                                                                                         
global start        
extern exit               
import exit msvcrt.dll    
     

;our data is declared here       
segment data use32 class=data
    a db 10
    b db 2
    c db 98
    d dw 300

;our code starts here

segment code use32 class=code
    start:
        ; [(a+b)*3-c*2]+d, multiplications and divisions, a,b,c as bytes, d as word
        ;(a+b)/2 + (10-a/c)+b/4
        mov AX, [a]
	    add AX, [b]
        mov BL, 2
        div BL          ; AL=(a+b)/2
        
        mov CL, AL ;CX=(a+b)/2
        
        mov AX, [a]
        mov BL, [c]
        div BL           ; AL=a/c
        
        mov BL, 10
        sub BL,AL
     
        
        add CL, BL
        
        mov AX, [b]
        mov BL, 4
        div BL           ; AL=b/4
        
        add CL, BL
        
        
       
        
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program        
