.model small
.stack 100H
.data
.code

main proc
    mov ax, 1
    mov bx, 0         
    mov cx, 50

sum_loop:
    add bx, ax          
    add ax, 4          
    loop sum_loop
    
    mov dx, bx 

exit:
    mov ah,4ch
    int 21h
    main endp
end main