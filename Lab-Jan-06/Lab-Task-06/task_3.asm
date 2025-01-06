.model small
.stack 100h
.data
    input_msg db 'Enter a Binary Number : $'
    output_msg db 'The Hexadecimal Number is : $'
.code 

main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, input_msg
    int 21h

    xor bx, bx
next_bit:
    mov ah, 1
    int 21h
    cmp al, 0Dh
    je display_result
    sub al, '0'
    shl bx, 1
    or bl, al
    jmp next_bit

display_result:
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov ah, 9
    lea dx, output_msg
    int 21h

    mov cx, 4 
    
print_digit:
    mov dx, bx
    shr dx, 12 
    and dl, 0Fh 
    cmp dl, 9
    jg letter_hex
    add dl, '0'
    jmp print_char
    
letter_hex:
    add dl, 37h

print_char:
    mov ah, 2
    int 21h
    shl bx, 4
    loop print_digit

    exit:
        mov ah, 4Ch
        int 21h
        main endp
end main
