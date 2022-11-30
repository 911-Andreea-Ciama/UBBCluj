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
    x dq 4

; our code starts here
segment code use32 class=code
    start:
        ; (a+b)/(c-2)-d+2-x
        mov EDX, 0
        mov DL, [a] ;DL<-a
        add DL,[b]  ;DL<-a+b
        mov AL,DL ;AL<-a+b
        mov AH,0
        mov DL, [c] ;DL<-c
        sub DL,2 ;DL<-c-2
        div DL  ;AL=(a+b)/(c-2)
        mov EDX, 0
        mov edx, [d] ;edx<-d
        mov cl,al
        mov eax,0
        mov al,cl
        sub eax,edx ;eax<-(a+b)/(c-2)-d
        add eax,2 ;eax<-(a+b)/(c-2)-d+2
        mov ecx, eax ;ecx<-(a+b)/(c-2)-d+2
        mov EAX, dword [x+0]
        mov EDX, dword [x+4]
        clc;
        mov EBX,0
        sub ECX,EAX ;ECX<-(a+b)/(c-2)-d+2-x
        sbb EBX,EDX
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
