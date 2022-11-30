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
    b db 30
    c db 7
    d dd 5
    x dq 3

; our code starts here
segment code use32 class=code
    start:
        ; (a+b)/(c-2)-d+2-x
        mov edx, 0
        mov dl, [a] ;DL<-a
        add dl,[b]  ;DL<-a+b
        mov al,dl ;AL<-a+b
        cbw ;signed conversion from al to ax
        
        mov cl, [c] ; cl<-c
        sub cl,2 ; cl<-c-2
        idiv cl ; al=(a+b)/(c-2)
        cbw ;signed conversion from al to ax
        cwde ;signed conversion from ax to eax
        mov ebx, eax ;we save (a+b)/(c-2) in ebx so that we can use eax for d	
       
        mov eax,[d] ;eax <- d
        sub ebx, eax ;ebx=(a+b)/(c-2)-d	
        add ebx, 2;;ebx=(a+b)/(c-2)-d+2	
        mov eax, ebx
        
        cdq ;edx:eax = (a+b)/(c-2)-d+2	
        
        sub eax, dword [x]
        sbb edx, dword [x+4] ;edx:eax = (a+b)/(c-2)-d+2-x
        clc
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
