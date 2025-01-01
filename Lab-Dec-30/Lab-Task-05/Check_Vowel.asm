.model small
.stack 100h
.data    

input_m db 'Enter a Character to check VOWEL : $'
is_v db ' is a VOWEL$' 
not_v db ' is NOT a VOWEL$'  

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, input_m 
    int 21h
    
    mov ah, 1
    int 21h
    mov bl, al
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h   
    
    cmp bl, 'a'
    je is_vowel
    cmp bl, 'e'
    je is_vowel
    cmp bl, 'i'
    je is_vowel
    cmp bl, 'o'
    je is_vowel
    cmp bl, 'u'
    je is_vowel
    
    cmp bl, 'A'
    je is_vowel
    cmp bl, 'E'
    je is_vowel
    cmp bl, 'I'
    je is_vowel
    cmp bl, 'O'
    je is_vowel
    cmp bl, 'U'
    je is_vowel
    
    not_vowel:
        mov ah, 2
        mov dl, bl
        int 21h 
        
        mov ah, 9
        lea dx, not_v
        int 21h
        
        jmp exit
        
    
    is_vowel:
        mov ah, 2
        mov dl, bl
        int 21h
          
        mov ah, 9
        lea dx, is_v
        int 21h
        
   exit:
    mov ah,4ch
    int 21h
    main endp
end main 


                                    
