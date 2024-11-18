.model small
.stack 100h
.data
;arr db 1,2,3,4,6
array db 'a','b','c','d'

.code  
main proc 
    
    mov ax,@data
    mov ds,ax
    
    mov dl,array[3]
    ;add dl,48
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
    main endp
end main
