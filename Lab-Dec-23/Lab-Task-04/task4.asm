.model small
.stack 100H
.data
.code

main proc
    mov ah, 1
    int 21h
    mov bl, al
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov ah, 2
    mov cx, 50
    mov dl, bl

print_loop:
    int 21h          
    loop print_loop 

exit:
    mov ah,4ch
    int 21h
    main endp
end main