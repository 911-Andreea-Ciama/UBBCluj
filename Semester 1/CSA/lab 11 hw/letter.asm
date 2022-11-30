%ifndef _LETTER_ASM_ ; continuăm dacă _LETTER_ASM_ este nedefinit
%define _LETTER_ASM_ ; și ne asigurăm că devine definit
                        ; astfel, %include permite doar o singură includere                     
                            
;definire procedura
is_letter:
        mov eax, [esp+4]
        cmp al, 0x41 ; "A"
        jl next_char
        cmp al, 0x5A; "Z"
        jle found_letter
        cmp al, 0x61 ; "a"
        jl next_char
        cmp al, 0x7A ;"z"
        jg next_char
        found_letter:]
        inc edx
        mov bl, 1
        next_char:
        
        ret 4

%endif