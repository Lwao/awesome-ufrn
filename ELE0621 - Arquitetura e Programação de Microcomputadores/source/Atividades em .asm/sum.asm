dosseg
.model small
.stack
.data
    str1 db 'Insert first vector elements: ','$'
    str2 db 'Insert second vector elements: ','$'
    str3 db '1. Sum vectors',0Ah,'2. Reinsert vectors values',0Ah,'3. Quit',0Ah,'Choice: ','$'
    ;tamanhostring DW $ - msg2 - 1
    sizev db 5
    choice db ?
    ten db 10
    result  db 5 dup (?)
    vector1 db 5 dup (?)
    vector2 db 5 dup (?)
.code
main PROC
    mov ax,@data    ; AX points to data segment address
    mov ds,ax       ; DS points to data segment address

    begin:
        call breakLine
        
        lea dx,str1     ; mov dx,OFFSET str1
        mov ah,09h      ; write string to STDOUT
        int 21h
        
        ; read vector 1 with two digits
        lea bx,vector1
        mov ch,ch
        mov cl,sizev
        call readDBvec
        
        call breakLine
        
        lea dx,str2     ; mov dx,OFFSET str2
        mov ah,09h      ; write string to STDOUT
        int 21h
        
        ; read vector 2 with two digits
        lea bx,vector2
        mov ch,ch
        mov cl,sizev
        call readDBvec
        
        
    
    menu:
        call breakLine    
    
        lea dx,str3     ; mov dx,OFFSET str1
        mov ah,09h      ; write string to STDOUT
        int 21h
        
        mov ah,01h      ; read character from STDIN
        int 21h
        mov choice,al
        
        call breakLine 
        
        cmp choice,"1"
        je summation
       
        cmp choice,"2"
        je begin
        
        cmp choice,"3"
        je endProg
        
    jmp menu
    
    summation:
        lea si,vector1
        lea di,vector2
        lea bx,result
        mov ch,ch
        mov cl,sizev
        sum:
            mov al,[si]
            add al,[di]
            mov [bx],al
            inc si
            inc di
            inc bx
        loop sum
    lea bx,result
    xor ch,ch
    mov cl,sizev
    call printDBvec
    
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

readDBvec PROC
    xor si,si
    array:
        mov ah,01h      ; read first digit in AL
        int 21h
        xor ah,ah       ; clear AH from int21h
        sub al,48d      ; converts to number 
        mul ten         ; ALouAX = AL*10
        mov dx,ax       ; hold first digit
        mov ah,01h      ; read second digit in AL
        int 21h
        xor ah,ah       ; clear AH from int21h
        sub al,48d      ; converts to number 
        add al,dl       ; Al = 10*AL + DL
        mov [bx],al ; stores read value in vector
        inc bx          ;,TYPE vectorX  
        mov dl,64h      ; print 'd' meaning decimal
        mov ah,02h      ; print   
        int 21h         ; DOS interrupt
        call breakSpace
    loop array
    ret
readDBvec ENDP

printDBvec PROC     
    printResult:
        xor ah,ah   ; allow AX = AHAL = 00AL
        mov al,[bx] ; populate ax with vector element
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
        inc bx      ; increment index 
        call breakSpace 
    loop printResult
    ret
printDBvec ENDP

end main
