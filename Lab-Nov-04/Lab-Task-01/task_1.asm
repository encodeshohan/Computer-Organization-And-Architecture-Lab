.model small
.stack
.data
m db "Assembly Language$"     
.code                       
main proc
    mov ax, @data
    mov ds,ax
    
    mov ah,9                 
    lea dx,m                 
    int 21h                                  
    
Exit:
    mov ah,4ch
    int 21h
    main endp
end main    