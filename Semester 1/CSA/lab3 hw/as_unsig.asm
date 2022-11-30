bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    a db 20
    b dw 30
    c dd 10
    d dq 100

; our code starts here
segment code use32 class=code
    start:
        ; d+c-b+(a-c)
        ;d-(a+b)+(c+c)
        mov EBX, dword [d+0]
        mov EAX, dword [d+4] ;EAX:EBX = d
        clc; ;CF=0
        
        mov EDX, 0
        ;mov DL, [c] 
        mov DL, [a]
        add DL, [b] ;DL= a+b
        
        sub EBX, EDX
        sbb EAX,0 ;EAX:EBX = d-(a+b)
        
        
        mov EDX, 0
        mov DL, [c] 
        mov ECX, 0
        mov CX, [c]
        add EDX,ECX
        clc
        add EBX,EDX
        adc EAX, 0
        
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
