; QUESTAO 3 PARTE 1
dosseg
.model small
.stack
.data
    vetorCodigo db 20 dup (?)
    vetorOrdenado db 20 dup (?)
    size1 db 20
    offset1 db 10h
    valorMaior db 0
    valorMenor db 255
	ten db 10d
.code
main PROC
    mov ax,@data    ; AX points to data segment address
    mov ds,ax       ; DS points to data segment address

    xor ch,ch
    mov cl,size1
    xor si,si
    lea bx,vetorCodigo
    ;mov bx,cs
    FetchInCode:
        ;push ds
        ;mov ds,bx
        mov al,cs:10h+si  ; move from code segment
        ;pop ds
        mov [bx+si],al             ; to vetorCodigo in code segment
        mov ah,[bx+si]             ; holds value to compare
        
        cmp ah,valorMaior
        jae ehMaior
        cmp ah,valorMenor
        jbe ehMenor
        jmp goOn
        
        ehMaior:
        mov valorMaior,ah
        jmp goOn
        
        ehMenor:
        mov valorMenor,ah
        jmp goOn
        
        
        goOn:
        inc si
    loop FetchInCode
    
    
   
    call printDBvec
        
    jmp endProg     ; jump to program end
endProg:    
    mov ah,4Ch      ; exit program
    int 21h
main ENDP

printDBvec PROC
    mov si,OFFSET vetorCodigo
    mov cl,size1       
    printResult:
        xor ah,ah   ; allow AX = AHAL = 00AL
        mov al,[si] ; populate ax with vector element
        div ten     ; ax/10 = 10*AH+AL
        push ax     ; stacks second digit
        mov dl,al   ; first digit    
        add dl,48d  ; converts to ASCII
        mov ah,02h  ; print   
        int 21h     ; DOS interrupt
        pop ax      ; recovers second digit
        mov al,ah   ; prepare second digit
        mov dl,al   ; second digit   
        add dl,48d  ; converts to ASCII
        mov ah,02h  ; print   
        int 21h     ; DOS interrupt
        inc si      ; increment index 
        call breakSpace 
    loop printResult
    ret
printDBvec ENDP

breakSpace PROC
    mov dl,20h      ; space bar
    mov ah,02h      ; write char to STDOUT
    int 21h
    ret
breakSpace ENDP

end main

