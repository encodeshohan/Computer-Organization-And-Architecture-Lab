.model small
.stack
.data
m db 'Lab Task$'     ; $ sign indicate the end of the string mean before $ sign text will be executed
.code                       ; We can use single Quotation as well
main proc
    mov ax, @data
    mov ds,ax
    
    mov ah,9                 ; 9 used for Character String output
    lea dx,m                 ; lea= Load Effective Address
    int 21h
    
    ; NEW LINE
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
                             ; Loop works on cx register
    mov cx,6
    mov ah,2
    mov dl,4
    
level1:
    int 21h
    inc dl
    loop level1                                     
    
Exit:
    mov ah,4ch
    int 21h
    main endp
end main    