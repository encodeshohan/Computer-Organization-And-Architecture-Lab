.model small
.stack 100h
.data
    input_msg db 'Enter a Binary Number : $'
    output_msg db 'The Binary Number is : $'
.code

main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, input_msg
    int 21h

    xor bx, bx
    mov cl, 8
next_bit:
    mov ah, 1
    int 21h
    cmp al, 0Dh
    je display_result
    sub al, '0'
    cmp al, 1
    ja invalid_input
    shl bx, 1
    or bl, al
    dec cl
    jz display_result
    jmp next_bit

invalid_input:
    mov ah, 9
    lea dx, output_msg
    int 21h
    mov ah, 4Ch
    int 21h

display_result:  
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    mov ah, 9
    lea dx, output_msg
    int 21h

    mov cx, 8
print_bit:
    mov dx, bx
    shr dx, 7
    and dl, 1
    add dl, '0'
    mov ah, 2
    int 21h
    shl bx, 1
    loop print_bit

    exit:
        mov ah, 4Ch
        int 21h
        main endp
end main
