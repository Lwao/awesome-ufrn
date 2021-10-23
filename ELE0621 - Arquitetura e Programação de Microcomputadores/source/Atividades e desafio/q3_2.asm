; QUESTAO 3 PARTE 2
dosseg
.model small
.stack
.data
    ;vetorCodigo db 42d,62d,5d,18d,42d,01d,23d,05d,18d,0d
    vetorCodigo db 42h,62h,5h,18h,42h,01h,23h,05h,18h,0h
    size1 db 10
    vetorOrdenado db 10 dup (0)
    hadSwap db 0
    ;ten db 10
    ten db 10h
.code
main PROC
    mov ax,@data    ; AX points to data segment address
    mov ds,ax       ; DS points to data segment address

    mov si,0
    mov cl,size1
    l0: ; vO = vC
        mov ah,vetorCodigo[si]
        mov vetorOrdenado[si],ah    
        inc si
    loop l0
    
    ;jmp printOut
    ;bubble sort
    pass: ; pass through 
        mov hadSwap,0
        mov si,0
        mov ah,size1
        dec ah
        mov cl,ah
        l1:
            mov ah,vetorOrdenado[si]
            mov al,vetorOrdenado[si+1]
            cmp al,ah
            jb switch
            jnb noswitch
            switch:
                mov vetorOrdenado[si+1],ah
                mov vetorOrdenado[si],al
                mov hadSwap,1
            noswitch:
            inc si
        loop l1
    cmp hadSwap,1 ; if had swap, pass again
    je pass
    
    printOut:
        call breakLine
        ; before print have to determine:
        mov si,OFFSET vetorCodigo   ; pointer to vector
        mov cl,size1                ; size of vector  
        call printDec 
        call breakLine 
        ; before print have to determine:
        mov si,OFFSET vetorOrdenado ; pointer to vector
        mov cl,size1                ; size of vector  
        call printDec 
        call breakLine  
     
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

breakSpace PROC
    mov dl,20h      ; space bar
    mov ah,02h      ; write char to STDOUT
    int 21h
    ret
breakSpace ENDP

printDec PROC
    ;mov si,OFFSET vetorCodigo
    ;mov cl,size1       
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
printDec ENDP

end main

