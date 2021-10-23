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
.code
main PROC
    mov ax,@data    ; AX points to data segment address
    mov ds,ax       ; DS points to data segment address

    xor ch,ch
    mov cl,size1
    xor si,si
    lea di,vetorCodigo
    mov bx,cs
    FetchInCode:
        push ds
        mov ds,bx
        mov al,[offset1+si]  ; move from code segment
        pop ds
        mov [di],al             ; to vetorCodigo in data segment
        mov ah,[di]             ; holds value to compare
        
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
        inc di
    loop FetchInCode
    
    
    printOut:
    mov si,OFFSET vetorCodigo
    mov cl,20       
    printResultLoop:
    mov al,[si]     
    add al,48d      
    mov dl,al       
    mov ah,02h      
    int 21h
    inc si          
    loop printResultLoop
    
        
    jmp endProg     ; jump to program end
endProg:    
    mov ah,4Ch      ; exit program
    int 21h
main ENDP
end main

