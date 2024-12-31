.model small
.stack 100h
.data
    input_m db 'Enter a Number to Check EVEN or ODD: $'
    even_m db ' is EVEN.$'
    odd_m db ' is ODD.$'
    error_m db ' is not a NUMBER.$'
    input db ?

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

    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h

    mov al, input
    cmp al, '0'
    jl not_number
    cmp al, '9'
    jg not_number

    sub al, '0'

    mov bl, al
    test al, 1
    jz even_number     

odd_number:
    add bl, '0'
    mov dl, bl
    mov ah, 2
    int 21h

    lea dx, odd_m
    mov ah, 9
    int 21h
    jmp exit

even_number:
    add bl, '0'
    mov dl, bl
    mov ah, 2
    int 21h

    lea dx, even_m
    mov ah, 9
    int 21h
    jmp exit

not_number:
    mov dl, input
    mov ah, 2
    int 21h

    lea dx, error_m
    mov ah, 9
    int 21h

exit:
    mov ah,4ch
    int 21h
    main endp
end main
