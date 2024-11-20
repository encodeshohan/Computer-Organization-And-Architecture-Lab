.model small
.stack 100H
.data
.code
main proc
    mov ax, @data      
    mov ds, ax
    
    mov ax, 4        
    mov bx, 2          
    mov cx, 6         
   
    cmp ax, bx
    jge skip_if_1       
    
    cmp bx, cx
    jge skip_if_2       
   
    mov ax, 0
    jmp exit  

skip_if_2:  
    mov bx, 0
    jmp exit   

skip_if_1:   
    jmp exit

exit:
    mov ah,4ch
    int 21h
    main endp
end main