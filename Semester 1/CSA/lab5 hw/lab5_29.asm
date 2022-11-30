bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ;A byte string S is given. Build the string D whose elements represent the sum of each two consecutive bytes of S.
    s db 10, 2, 3, 4, 5, 6
    l equ $-s
    d times l-1 db 0
; our code starts here
segment code use32 class=code
    start:
    
        mov ecx, l-1 ;placing the length of d in ecx for the loop
        mov esi, 0 ;keeping the position of s string in esi 
        jecxz End
        
        Repeat:
            mov al, [s+esi] ;moving the element from s, position esi, in al
            mov dh, [s+esi+1] ;moving the element from s, position esi+1, in dh
      
            add al,dh ;al=al+dh
            mov [d+esi], al ;moving the result of the operation from al to d, on the position esi
            
            inc esi ;esi= esi+1
            
        loop Repeat
        End: ;end of program
  
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program