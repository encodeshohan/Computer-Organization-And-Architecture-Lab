.model small
.stack 100h
.data
a db "Enter two values: $"
b db "Result: $"
.code

main proc
    mov ax,@data
    mov ds,ax
    
    proc1 proc
        mov ah,9
        lea dx,a
        int 21h
        
        mov ah,1
        int 21h
        mov bl,al
        int 21h
        mov bh,al
        call proc2
        ret
        
    proc2 proc
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        mov ah,9
        lea dx,b
        int 21h
        sub bl,bh 
        add bl,'0'
        mov ah,2
        mov dl,bl
        int 21h
            
        cmp bl,13
        jmp exit 
            
    exit:
    mov ah,4ch
    int 21h
end main 
            