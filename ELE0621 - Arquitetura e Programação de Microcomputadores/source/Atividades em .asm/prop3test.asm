; QUESTAO 3 PARTE 2
dosseg
.model small
.stack
.data
    vetorCodigo db 42h,62h,15h,01h,23h,05h,18h,0h
    vetorOrdenado db 8 dup (0)
    size1 db 8
    hadSwap db 0
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
        mov si,OFFSET vetorCodigo
        mov cl,size1       
        printResult1:
            xor al,al
            mov ah,[si]
            mov dl,10
            div dl      ; ax/dh = 10*AL+AH
            mov dh,ah
            mov dl,al   ; first digit   
            add dl,48d
            mov ah,02h  ; print   
            int 21h
            mov dl,ah   ; second digit   
            add dl,48d
            mov ah,02h  ; print   
            int 21h
            inc si        
            call breakSpace  
            loop printResult1
        call breakLine   
        mov si,OFFSET vetorOrdenado
        mov cl,size1       
        printResult2:
            mov al,[si]     
            add al,48d      
            mov dl,al       
            mov ah,02h      
            int 21h
            inc si 
            call breakSpace        
        loop printResult2
        
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

end main

