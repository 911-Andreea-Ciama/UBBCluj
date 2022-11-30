;Given the doublewords A si B, obtain the quadword C as follows:
;the bits 0-7 of C are the same as the bits 21-28 of A
;the bits 8-15 of C are the same as the bits 23-30 of B complemented
;the bits 16-21 of C have the value 101010
;the bits 22-31 of C have the value 0
;the bits 32-42 of C are the same as the bits 21-31 of B
;the bits 43-55 of C are the same as the bits 1-13 of A
;the bits 56-63 of C are the same as the bits 24-31 of the result A XOR 0ABh

bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    a dd 01110111010101110111011101010111b
    b dd 10011011101111101001101110111110b
    c dq 0

; our code starts here
segment code use32 class=code
    start:
        mov  ebx, 0 ; we compute the result in ebx

        mov  eax, [a] ; we isolate bits 21-28 of A
        and  eax, 00011111111000000000000000000000b
        mov  cl, 3
        rol  eax, cl ; we rotate 3 positions to the left
        or   ebx, eax ; we put the bits into the result
        
        mov  eax, [b] ; we isolate bits 23-30 of B
        not  eax
        and  eax, 01111111100000000000000000000000b
        mov  cl, 15
        rol  eax, cl ; we rotate 15 positions to the right
        or   ebx, eax ; we put the bits into the result
        
        and  ebx, 11111111111010101111111111111111b ; the bits 16,18,20 of C have the value 0
        or   ebx, 00000000001010100000000000000000b ;the bits 17,19,21 of C have the value 1
        ;the bits 16-21 of C have the value 101010
        
        and  ebx, 00000000001111111111111111111111b ; the bits 22-31 of C have the value 0
        
        mov  edx, 0 ; we compute the result in edx

        mov  eax, [b] ; we isolate bits 21-31 of B
        and  eax, 11111111111000000000000000000000b
        mov  cl, 11
        rol  eax, cl ; we rotate 11 positions to the left
        or   edx, eax ; we put the bits into the result
        
        mov  eax, [a] ; we isolate bits 1-13 of A
        and  eax, 00000000000000000011111111111110b
        mov  cl, 10
        ror  eax, cl ; we rotate 10 positions to the right
        or   edx, eax ; we put the bits into the result
        
        mov  eax, a
        xor  eax, 0ABh ; we put the result of A XOR 0Ah in eax
        and  eax, 11111111000000000000000000000000b
        or   edx, eax ; we put the bits into the result
        
        
        
        
        
        
        
