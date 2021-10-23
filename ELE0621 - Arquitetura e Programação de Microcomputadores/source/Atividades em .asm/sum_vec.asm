dosseg
.model small
.stack
.data
    str1 db 'Insert first vector elements: ','$'
    str2 db 'Insert second vector elements: ','$'
    str3 db '1. Sum vectors',0Ah,'2. Subtract 2 from 1',0Ah,'3. Subtract 1 from 2',0Ah,'4. Reinsert vectors values',0Ah,'5. Quit',0Ah,'Choice: ','$'
    sizev db 5
    choice db ?
    result  db 5 dup (0)
    vector1 db 5 dup (0)
    vector2 db 5 dup (0)
.code
main PROC
    mov ax,@data    ; AX points to data segment address
    mov ds,ax       ; DS points to data segment address

    begin:
        call breakLine
        
        lea dx,str1     ; mov dx,OFFSET str1
        mov ah,09h      ; write string to STDOUT
        int 21h
        
        mov di,OFFSET vector1
        mov cl,sizev
        array1:
            mov ah,01h      ; read character from STDIN
            int 21h
            mov [di],al
            inc di          ;,TYPE vector1
            call breakSpace
        loop array1
        
        call breakLine
        
        lea dx,str2     ; mov dx,OFFSET str2
        mov ah,09h      ; write string to STDOUT
        int 21h
        
        mov di,OFFSET vector2
        mov cl,sizev
        array2:
            mov ah,01h      ; read character from STDIN
            int 21h
            mov [di],al
            inc di          ;,TYPE vector2
            call breakSpace
        loop array2
        
        
    
    menu:
        call breakLine    
    
        lea dx,str3     ; mov dx,OFFSET str1
        mov ah,09h      ; write string to STDOUT
        int 21h
        
        mov ah,01h      ; read character from STDIN
        int 21h
        mov choice,al
        
        cmp choice,"1"
        je choice1
        
        cmp choice,"2"
        je choice2
        
        cmp choice,"3"
        je choice3
        
        cmp choice,"4"
        je begin
        
        cmp choice,"5"
        je endProg
        
    jmp menu
    
    choice1:
        call breakLine
        lea si,vector1
        lea di,vector2
        lea bx,result
        mov cl,5
        sumLoop:
            mov al,[si]
            add al,[di]
            mov [bx],al
            inc si
            inc di
            inc bx          
        loop sumLoop
        call printResultSum
        jmp menu
    choice2:
        call breakLine
        lea si,vector1
        lea di,vector2
        lea bx,result
        mov cl,5
        sub1Loop:
            mov al,[si]
            sub al,[di]
            mov [bx],al
            inc si
            inc di
            inc bx          
        loop sub1Loop
        call printResultSub
        jmp menu    
    choice3:
        call breakLine
        lea di,vector1
        lea si,vector2
        lea bx,result
        mov cl,5
        sub2Loop:
            mov al,[si]
            sub al,[di]
            mov [bx],al
            inc si
            inc di
            inc bx          
        loop sub2Loop
        call printResultSub
        jmp menu   

    
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

printResultSum PROC
    mov si,OFFSET result
    mov cl,5
    printResultLoopSum:
        mov al,[si]
        sub al,48d    ; char 0 with its ASCII code
        mov dl,al
        mov ah,02h
        int 21h
        inc si
    loop printResultLoopSum
    ret
printResultSum ENDP

printResultSub PROC
    mov si,OFFSET result
    mov cl,5
    printResultLoopSub:
        mov al,[si]
        add al,48d    ; char 0 with its ASCII code
        mov dl,al
        mov ah,02h
        int 21h
        inc si
    loop printResultLoopSub
    ret
    printResultSub ENDP
end main

;mov ah,01h      ; read character from STDIN
    ;int 21h
    ;mov size,al
