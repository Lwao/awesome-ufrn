dosseg
.model small
.stack
.data
    num1    DB      ?
    num2    DB      ?
.code
main PROC
    mov ax,@data    ; AX points to data segment address
    mov ds,ax       ; DS points to data segment address

    mov al,2

    jmp endProg     ; jump to program end
endProg:    
    mov ah,4Ch      ; exit program
    int 21h
main ENDP
end main
