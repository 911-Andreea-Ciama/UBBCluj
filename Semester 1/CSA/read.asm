
bits 32        


extern exit, scanf, printf               
import exit msvcrt.dll    
import scanf msvcrt.dll                       
import printf msvcrt.dll

global _read

segment data public data use32
    formats db "%d", 0
    s resd 100
    segment code public code use32
    _read:
            push ebp
            mov ebp, esp   
            pushad
        my_loop:
            
            push dword s
            push dword formats
            call [scanf]
            add ESP, 4*2
            
            jmp my_loop
            popad 
            mov eax, a 
            mov esp, ebp
            pop ebp            
        ret
        
       
