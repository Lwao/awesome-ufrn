DOSSEG
.MODEL small
.STACK
.DATA
    num1    DB      ?
    num2    DB      ?
    num3    DB      ?
    char1   DB      '1'
    soma12  DW      0
    result  DB      0
    resultR DB      0
.CODE
main PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AL,[Char1]
    CMP AL,'1'
    JZ cfaca1
    CALL faca2
    JMP fim
cfaca1: CALL faca1
fim:    
    MOV AH,4Ch
    INT 21h
main ENDP

faca1 PROC
    MOV AL,[num1]
    MOV BL,[num2]
    XOR AH,AH
    XOR BH,BH
    ADD AX,BX
    MOV [soma12],AX
    RET
faca1 ENDP
        
faca2 PROC
    MOV AL,[num1]
    MOV BL,[num2]
    MOV CL,[num3]
    MUL BL
    DIV CL
    MOV [result],AL
    MOV [resultR],AH
    RET
faca2   ENDP
END main
