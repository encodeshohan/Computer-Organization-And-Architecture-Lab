.model small
.stack 100h
.data
    msg1 db 'Before Reverse: $'
    msg2 db 'After Reverse: $'

.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, msg1
    mov ah, 09h
    int 21h 

    mov ah, 2
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h

    mov dl, '?'
    int 21h

    xor cx, cx 

    
read_loop:
    mov ah, 1       
    int 21h
    cmp al, 0Dh     
    je reverse_loop 

    push ax         
    inc cx          
    jmp read_loop   

reverse_loop:
    
    mov ah, 2
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h

    lea dx, msg2
    mov ah, 09h
    int 21h 
    
    mov ah, 2
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    
print_loop:
    pop ax          
    mov dl, al       
    mov ah, 2       
    int 21h
    loop print_loop 

    exit:
    mov ah,4ch
    int 21h
    main endp
end main
