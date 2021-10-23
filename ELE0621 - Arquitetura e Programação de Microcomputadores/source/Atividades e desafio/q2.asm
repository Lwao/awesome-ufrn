; QUESTAO 2
dosseg
.model small
.stack
.data
    x db 20 dup (0)
.code
main PROC
    ; modo de endere?amento = ME
    mov ax,@data        ; ME imediato
    mov ds,ax           ; ME registro
    
    mov al,20           ; ME imediato 
    xor di,di           ; ME registro
    
    beforeWhile:
        cmp al,0        ; ME imediato
        ja whileLoop
        jmp endProg
    whileLoop:
        mov x[di],1     ; ME imediato
        inc di          ; ME imediato
        dec al          ; ME imediato
        jmp beforeWhile
    jmp endProg         ; jump to program end
endProg:    
    mov ah,4Ch          ; ME imediato
    int 21h
main ENDP
end main
