.model small
.stack 100H
.data
.code

main proc
    mov ax, @data       
    mov ds, ax

    mov ax, -4         
    cmp ax, 0
    jnl end_if
    mov bx, -1  

end_if:

    
exit:
    mov ah,4ch
    int 21h
    main endp
end main