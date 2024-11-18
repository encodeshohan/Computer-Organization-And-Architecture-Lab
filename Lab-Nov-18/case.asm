.model small
.stack 100h
.data
.code
main proc
    mov ax, @data 
    mov ds, ax
    
    MOV AX,-2

    CMP AX, 0  
    JL NEGATIVE  
    JE ZERO      
    JG POSITIVE  

NEGATIVE:
    MOV BX,"N"
    MOV AH,2
    MOV DX,BX
    INT 21H   
    JMP END_CASE 

ZERO:
    MOV BX,"0" 
    MOV AH,2
    MOV Dl,Bl
    INT 21h   
    JMP END_CASE 

POSITIVE:
    MOV BX,"P"
    MOV AH,2
    MOV DL,BL
    INT 21H    

END_CASE:
    mov ah, 4Ch  
    int 21h      

main endp
end main
