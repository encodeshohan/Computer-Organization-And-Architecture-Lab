.model small
.stack 100h
.data
    input_msg db 'Enter a hexadecimal number (0-F): $'
    output_msg db 'The binary number is: $'
.code

main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, input_msg
    int 21h

    xor bx, bx 
    
next_digit:
    mov ah, 1
    int 21h
    cmp al, 0Dh
    je display_result
    shl bx, 4
    cmp al, 'A'
    jl digit_num
    sub al, 37h
    jmp store_digit

digit_num:
    sub al, '0'

store_digit:
    or bl, al
    jmp next_digit

display_result:
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov ah, 9
    lea dx, output_msg
    int 21h

    mov cx, 16
      
print_binary_bit:
    mov dx, bx
    shr dx, 15  
    and dl, 1   
    add dl, '0' 
    mov ah, 2   
    int 21h
    shl bx, 1   
    loop print_binary_bit

    exit:
        mov ah, 4Ch
        int 21h
main endp
end main
