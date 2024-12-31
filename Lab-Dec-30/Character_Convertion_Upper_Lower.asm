.model small
.stack 100h
.data
    input_m db 'Enter a character to convert to Upper or Lower: $'
    result_m db 'Converted Character: $'
    error_m db 'Invalid Character.$'
    input db ?
    output db ?

.code
main proc
    mov ax, @data
    mov ds, ax 
    
    mov ah, 9
    lea dx, input_m
    int 21h
    
    mov ah, 1
    int 21h
    mov input, al
 
    cmp al, 'A'
    jl check_lowercase
    cmp al, 'Z'
    jg check_lowercase

    or al, 20h           
    mov output, al
    jmp print_result

check_lowercase:
    cmp al, 'a'
    jl not_char
    cmp al, 'z'
    jg not_char

    and al, 5Fh          
    mov output, al
    jmp print_result

not_char:
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h

    lea dx, error_m
    mov ah, 9
    int 21h
    jmp exit

print_result:
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    lea dx, result_m
    mov ah, 9
    int 21h
    
    mov dl, output
    mov ah, 2
    int 21h

exit:
    mov ah,4ch
    int 21h
    main endp
end main
