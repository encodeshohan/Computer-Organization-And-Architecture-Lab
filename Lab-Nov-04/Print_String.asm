.model small
.stack
.data
m db "I Love Assembly$"     ; $ sign indicate the end of the string mean before $ sign text will be executed
.code                       ; We can use single Quotation as well
main proc
    mov ax, @data
    mov ds,ax
    
    mov ah,9                 ; 9 used for Character String output
    lea dx,m                 ; lea= Load Effective Address
    int 21h                                  
    
Exit:
    mov ah,4ch
    int 21h
    main endp
end main    