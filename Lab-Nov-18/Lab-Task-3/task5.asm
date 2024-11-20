.model small
.stack 100H
.data
.code      

main proc
    mov ax, @data
    mov ds, ax

    mov ax, 4
    mov bx, 2
    mov cx, 6

    cmp ax, bx
    jge skip

    mov dx, 0
    jmp exit

skip:
    cmp bx, cx
    jge set_one

    mov dx, 0
    jmp exit

set_one:
    mov dx, 1

exit:
    mov ah,4ch
    int 21h
    main endp
end main