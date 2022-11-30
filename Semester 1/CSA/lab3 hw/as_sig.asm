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
        ; (a+a)-(b+b)-(c+d)+(d+d)
        mov EDX, 0
        mov DL, [c]
        mov EBX, dword [d+0]
        mov EAX, dword [d+4]
        clc
        add EBX, EDX
        adc EAX,0 ;d+c 
        mov EDX, 0
        mov DL, [a] 
        add EDX, EDX
        mov ECX, 0
        mov CX, [b]
        add ECX,ECX
        sub EDX,ECX
        clc
        sub EDX,EBX
        sbb EAX,0
        mov EBX, dword [d+0]
        mov EAX, dword [d+4]
        clc
        add EBX,EBX
        adc EAX,EAX
        clc
        add EDX, EBX
        adc EAX, 0
        
        
        
        
        
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
