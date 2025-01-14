.model small
.stack 100h
.data
    before db "Before Reverse: $"
    after db "After Reverse: $"
.code

main proc
    mov ax, @data
    mov ds, ax

    lea dx, before      
    mov ah, 9           
    int 21h

    xor cx, cx          

read_input:
    mov ah, 1           
    int 21h
    cmp al, 0Dh         
    je done_input       
    push ax             
    inc cx              
    jmp read_input      

done_input:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h

    lea dx, after       
    mov ah, 9           
    int 21h

    mov cx, cx          

print_reverse:
    pop ax              
    mov dl, al          
    mov ah, 2           
    int 21h             
    loop print_reverse  

    exit:
    mov ah,4ch
    int 21h
    main endp
end main
