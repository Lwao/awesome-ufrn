dosseg
.model small
.stack
.data
    x db 20 dup (0)
.code
main PROC ; modo de endere?amento = ME 
    mov ax,@data    ; ME direto
    mov ds,ax       ; ME por registro

    mov al,20       ; ME imediato
    mov di,0        ; ME imediato
    
beforeWhile:
    cmp al,0        ; ME imediato
    ja whileLoop    
    jmp printOut
whileLoop:
    mov x[di],1     ; ME imediato
    inc di          ; ME imediato
    dec al          ; ME imediato
    jmp beforeWhile
printOut:
    mov si,OFFSET x ; ME direto
    mov cl,20       ; ME imediato
printResultLoop:
    mov al,[si]     ; ME indireto por registro
    add al,48d      ; ME imediato
    mov dl,al       ; ME por registro
    mov ah,02h      ; ME imediato
    int 21h
    inc si          ; ME imediato
loop printResultLoop
    jmp endProg    
endProg:    
    mov ah,4Ch      ; ME imediato
    int 21h
main ENDP
end main
