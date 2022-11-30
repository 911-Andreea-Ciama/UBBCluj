bits 32 ;asamblare și compilare pentru arhitectura de 32 biți
; definim punctul de intrare in programul principal
global start

; declaram functiile externe necesare programului nostru 
extern exit, printf, scanf ; indicam asamblorului ca exit exista, chiar daca noi nu o vom defini
import exit msvcrt.dll  
import fopen msvcrt.dll  
import fprintf msvcrt.dll
import fclose msvcrt.dll


import printf msvcrt.dll     ; indicating to the assembler that the printf fct can be found in the msvcrt.dll library
import scanf msvcrt.dll
  ; exit este o functie care incheie procesul, este definita in msvcrt.dll
        ; msvcrt.dll contine exit, printf si toate celelalte functii C-runtime importante

%include "letter.asm"      ; copy the code from function that checks if a char is a letter  
     
; segmentul de date in care se vor defini variabilele 
segment data use32 class=data
; ... 


sir resd 100
formatCitire db "%[^\n]%s", 0
formatAfisare dd "%u ", 0

; segmentul de cod
segment code use32 class=code


start:
; ... 
    push dword sir
    push dword formatCitire
    call [scanf]
    add esp, 4 * 2
    ; loop though the string
    
    mov esi, sir
    mov bl, 0
    mov edx, 0 ; counting here
    start_loop:
        lodsb
        cmp al, 0
        je done
        
        mov bl, 0
        push dword eax
        
        call is_letter
     
        cmp bl, 0
        jg continue_counting
        
        PUSHAD ; if bl=1, then I found a char that is not a letter so I have to print the number of letters of the last word
        push dword edx
        push dword formatAfisare
        call [printf]
        add esp, 4 * 2
        POPAD
        mov edx, 0 ; start counting again from zero the letters of the next work
        continue_counting:
    loop start_loop

    done:
    ; I only need this if i don't read the input from the keyboard
    push dword edx
    push dword formatAfisare
    call [printf]
    add esp, 4 * 2
    
    ; exit(0)
    push dword 0 ; se pune pe stiva parametrul functiei exit
    call [exit] ; apelul functiei exit pentru terminarea executiei programului
