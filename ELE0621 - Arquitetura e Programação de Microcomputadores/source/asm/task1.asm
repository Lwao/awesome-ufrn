dosseg
.model small
.stack
.data
    str1 db 'Specify vectors size: ','$'
    ;str1 db 'Specify vector size: ','$'
    size db ?
    srem db ?
    sum db ?
    vector1 db ?
    vector2 db ?
    ten db 10d
.code
main PROC
    mov ax,@data    ; AX points to data segment address
    mov ds,ax       ; DS points to data segment address

    lea dx,str1     ; mov dx,OFFSET str1
    mov ah,09h      ; write string to STDOUT
    int 21h
    
    mov ah,01h      ; read character from STDIN
    int 21h
    ;sub al,48d     
    mul ten
    mov size,al     ; first digit
    mov ah,01h      ; read character from STDIN
    int 21h
    ;sub al,48d 
    add size,al     ; add second digit 
    
    call breakLine
    
    lea dx,size     ; mov dx,OFFSET size
    mov ah,09h      ; write string to STDOUT
    int 21h
    
    mov ah,0
    mov al,size
    mov dl,10
    div dl
    mov srem,ah     ; resto
    mov dl,al       ; dividendo
    ;add dl,48
    mov ah,02h      ; write char to STDOUT
    int 21h
    mov dl,srem     
    ;add dl,48
    mov ah,02h      ; write char to STDOUT
    int 21h
    
    
    
    
    
    jmp endProg     ; jump to program end
endProg:    
    mov ah,4Ch      ; exit program
    int 21h
main ENDP

breakLine PROC
    mov dl,0Ah      ; break line
    mov ah,02h      ; write char to STDOUT
    int 21h
    ret
breakLine ENDP
end main
