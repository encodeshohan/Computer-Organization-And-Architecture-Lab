.model small
.stack 100h
.code    
.data

msg db "Predefine Input $"
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9                 
    lea dx,msg                 
    int 21h   
    
    mov ah,1
    int 21h
    mov bl,al
       
    mov ah,2
    mov dl,bl
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main