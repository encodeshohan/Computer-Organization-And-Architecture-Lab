.model small
.stack 100h
.data

a db 'Input First Number: $'
b db 'Input Second Number: $'
output db 'Result: $'


.code
main proc

    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, a
    int 21h     

    mov ah, 1
    int 21h
    sub al, '0'   
    mov bl, al   
           
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h   

    mov ah, 9
    lea dx, b
    int 21h

    mov ah, 1
    int 21h
    sub al, '0'     

    
    sub bl, al 
    
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h

    mov ah, 9
    lea dx, output
    int 21h

    add bl, '0'     
    mov dl, bl    
    mov ah, 2
    int 21h
   

    exit:
    mov ah,4ch
    int 21h
    main endp   

end main
