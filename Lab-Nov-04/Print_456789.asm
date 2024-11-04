.model small
.stack
.data
.code                       
main proc
    mov ax, @data
    mov ds,ax
    
    ;mov ah,9                                           
    mov cx,6                 
    mov ah,2
    mov dl,'4'                         
           
    
level1:
    int 21h
    inc dl
    loop level1                                     
    
Exit:
    mov ah,4ch
    int 21h
    main endp
end main    