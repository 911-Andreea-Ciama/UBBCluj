bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declaring extern functions used in the program
extern exit, printf, scanf ; add printf and scanf as extern functions            
import exit msvcrt.dll    
import printf msvcrt.dll    ; tell the assembler that function printf is found in msvcrt.dll library
import scanf msvcrt.dll     ; similar for scanf

; our data is declared here (the variables needed by our program)


segment data use32 class=data
    a dw 0
    m db 0
    n db 0
    scana dd 0
    scanm dd 0
    scann dd 0
    message1 db "a = ", 0
    message2 db "m = ", 0
    format1 db "%d"
    message3 db "n = ", 0
    format db "The number is %x"

; our code starts here
;Read three numbers a, m and n (a: word, 0 <= m, n <= 15, m > n) from the keyboard. Isolate the bits m-n of a and display the integer represented by those bits in base 16
segment code use32 class=code
    start:
    
        push dword message1
        call [printf]
        add esp, 4 * 1
        
        push dword scana
        push dword format1
        call [scanf]
        add esp, 4 * 2
        
        push dword message2
        call [printf]
        add esp, 4 * 1
        
        push dword scanm
        push dword format1
        call [scanf]
        add esp, 4 * 2
        
        push dword message3
        call [printf]
        add esp, 4 * 1
        
        push dword scann
        push dword format1
        call [scanf]
        add esp, 4 * 2
        
        mov eax, [scana]
        mov [a], eax
        
        mov eax, [scanm]
        mov [m], eax
        
        mov eax, [scann]
        mov [n], eax
        
        mov ax, [a]
        
        mov bl, [m]
        mov cl, 15
        sub cl, bl
        shl ax, cl ; the bits from pos 0 to n-1 become 0
        
        mov cl, 15
        mov dl, [n]
        sub bl, dl ; BL: m-n
        sub cl, bl ; CL: 15 - (m-n)
        shr ax, cl ; the bits from pos m+1 to 15 become 0
        
        mov edx, 0
        mov dx, ax
        push edx
        push dword format
        call [printf]
        
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program