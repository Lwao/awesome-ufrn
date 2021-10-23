; QUESTAO 4
dosseg
.model small
.stack
.data
    msg1 db '1. SubString',0Ah,'2. SubVetor',0Ah,'Entre com uma opcao: ','$'
    msg2 db 0Ah,'Opcao invalida. Deseja voltar ao DOS? ','$' 
    opcao db ?
    string1 db 'AJSUA','$'
    compString1 db $ - string1 - 1
    string2 db 'AJSUD','$'
    compString2 db $ - string2 - 1
    str1 db 0Ah,'As strings sao identicas!',0Ah,'$'
    str2 db 0Ah,'As strings diferenciam no seu comprimento!',0Ah,'$'
    str3 db 0Ah,'As strings sao de mesmo comprimento mas diferenciam em seu conteudo!',0Ah,'$'
    vetor1 db 1,1,1
    vetor2 db 1,2,3
    vetorXOR db 3 dup(0); result 0 3 2
    nElementos db 3
.code
main PROC
    mov ax,@data    ; AX points to data segment address
    mov ds,ax       ; DS points to data segment address
        
    menu:
        lea dx,msg1     ; mov dx,OFFSET str1
        mov ah,09h      ; write string to STDOUT
        int 21h
        
        mov ah,01h      ; read character from STDIN
        int 21h
        mov opcao,al
        
        cmp opcao,"1"
        je choice1
        
        cmp opcao,"2"
        je choice2
        
        lea dx,msg2     ; mov dx,OFFSET str1
        mov ah,09h      ; write string to STDOUT
        int 21h
        
        mov ah,01h      ; read character from STDIN
        int 21h
        mov opcao,al
        
        call breakLine
        
        cmp opcao,"s"
        je endProg
        
        cmp opcao,"S"
        je endProg
        
        jmp menu
    jmp menu
    
    choice1: 
        call SubString
        jmp menu
    choice2: 
        call SubVetor
        jmp menu

    jmp endProg     ; jump to program end
endProg:    
    mov ah,4Ch      ; exit program
    int 21h
main ENDP


SubString PROC
    mov ah,compString1
    cmp ah,compString2
    je testEQU
    lea dx,str2     ; diferentes em tamanho
    mov ah,09h      ; write string to STDOUT
    int 21h
    ret
    testEQU:
        xor si,si
        xor ch,ch
        mov cl,compString1 ; whatever since both are equal
        loopEQU:
            mov al,string1[si]
            xor al,string2[si] ; if 00h equal FFh different
            jnz different
            inc si
        loop loopEQU
        lea dx,str1     ; iguais
        mov ah,09h      ; write string to STDOUT
        int 21h
        ret
     different:
        lea dx,str3        ; diferentes em conteudo
        mov ah,09h      ; write string to STDOUT
        int 21h
        ret
SubString ENDP

SubVetor PROC
    mov si,0
    mov cl,nElementos
    loopXOR:
        mov al,vetor1[si]
        xor al,vetor2[si]
        mov vetorXOR[si],al
        inc si
    loop loopXOR
    call breakLine
    mov si,OFFSET vetorXOR
    mov cl,nElementos
    printResult:
        mov al,[si]
        add al,48d    ; char 0 with its ASCII code
        mov dl,al
        mov ah,02h
        int 21h
        inc si
    loop printResult
    call breakLine
    ret
SubVetor ENDP

breakLine PROC
    mov dl,0Ah      ; break line
    mov ah,02h      ; write char to STDOUT
    int 21h
    ret
breakLine ENDP

end main
