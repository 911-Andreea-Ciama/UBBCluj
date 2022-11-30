bits 32 ; assembling for the 32 bits architecture
 
; declare the EntryPoint (a label defining the very first instruction of the program)
global start        
 
; declare external functions needed by our program
extern exit, fopen, fprintf, fclose, fread, fscanf, fwrite
import exit msvcrt.dll
import fopen msvcrt.dll
import fread msvcrt.dll
import fclose msvcrt.dll
import printf msvcrt.dll
import fprintf msvcrt.dll
import fscanf msvcrt.dll
import fwrite msvcrt.dll
;A text file is given. The text file contains numbers (in base 10) separated by spaces. Read the content of the file, determine the maximum number (from the numbers that have been read) and write the result at the end of file.
; our data is declared here (the variables needed by our program)
segment data use32 class=data
    file_name db "myfile.txt", 0   ; filename to be created
    access_mode db "a+", 0       ; file access mode
    file_descriptor dd -1       ; variable to hold the file descriptor
    format db "%d", 0
    space db 13
    max dd 0
    current dd 0
    
 
; our code starts here
segment code use32 class=code
    start:
        push dword access_mode
        push dword file_name 
        call [fopen]
        add esp, 4*2
 
        mov [file_descriptor], eax
 
        cmp eax, 0
        je final
        my_loop:
            ; fscanf(myFile, format, &numberArray[i])
            push dword current
            push dword format
            push dword [file_descriptor]
            call [fscanf]
            add esp, 4 * 3
 
            cmp eax, -1
            je cleanup
 
            mov ebx, [current]
            cmp ebx, [max]
            jg greater
            jmp step_over
            greater:
                mov [max], ebx
            step_over:
            jmp my_loop
 
        cleanup:
        ; int fwrite(const void *ptr, int size, int count, FILE *descriptor)
        push dword [file_descriptor]
        push dword 1
        push dword 1
        push dword space
        call [fwrite]
        add esp, 4 * 4
 
        ; int fprintf ( FILE * stream, const char * format, int number);
        push dword [max]
        push dword format
        push dword [file_descriptor]
        call [fprintf]
        add esp, 4 * 3
 
        push dword [file_descriptor]
        call [fclose]
        add esp, 4
        final:
         ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program