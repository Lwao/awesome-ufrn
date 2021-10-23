; MUL AX (LSB) and DX (MSB), resultado AX
; DIV AX (LSB) and DX (MSB), quociente AX resto DX

; modos de endereçamento
; MOV AX,BX 			por registro			V
; MOV AL,17h 			imediato				V
; MOV BX,[1102h] 		direto					V
; MOV AX,[BX] 			indireto por registro	V
; MOV CX,[BX+0102h] 	por base				
; MOV DX,[0100h+SI] 	indexado
; MOV AH,[BX+0100h+SI] 	por base indexada		V

dosseg
.model small
.stack
.data
	msg0 db 0Ah,'Deseja voltar ao DOS? ','$' 
    msg1 db 0Ah,'Insert the power: ','$'
    msg2 db 0Ah,'Invalid option!','$' 
	msg3 db 0Ah,'Polynomial coefficients: ','$'
    msg4 db 0Ah,'(A+B)',5Eh,'$'
	msg5 db 0Ah,'(A-B)',5Eh,'$' 
	msgx db ' = ','$'
    n dw ?
    k dw ?
    nmk dw ?
	ten dw 10
	two dw 2
	choice dw ?
	opcao db ?
    poly_coef dw 8 dup(?)
	itr dw 0
.code
main PROC
    mov ax,@data    ; AX points to data segment address ; ME DIRETO
    mov ds,ax       ; DS points to data segment address ; ME POR REGISTRO
	
    begin:
	
	lea dx,msg1     ; mov dx,OFFSET msg1				; ME IMEDIATO
    mov ah,09h      ; write string to STDOUT			; ME IMEDIATO
    int 21h         ; asks for n
    
    mov ah,01h      ; read character from STDIN
    int 21h         ; inputs n
    sub al,48d      ; converts to number   				; ME IMEDIATO
    xor ah,ah
    mov n,ax        ; stores n
	
	cmp n,7			; compares with limit
	jbe continues	; n<=7 continue to calculation
	lea dx,msg2     ; mov dx,OFFSET msg2				; ME IMEDIATO
    mov ah,09h      ; write string to STDOUT			; ME IMEDIATO
    int 21h         ; warning
	jmp begin		; n>7 return to reinsert n	
	
	continues:
	
	call breakLine
    call binomial
	call polyPrint
	
	lea dx,msg0     ; repet or not
    mov ah,09h      ; write string to STDOUT
    int 21h
        
    mov ah,01h      ; read character from STDIN
    int 21h
    mov opcao,al
        
    call breakLine
        
    cmp opcao,"s"
    je endProg
        
    cmp opcao,"S"
    je endProg
	
    jmp begin
endProg:    
    mov ah,4Ch      ; exit program
    int 21h
main ENDP

factorial PROC 
    ;mov cx,n     ; define CX as parameter
    mov ax,1      ; atribute 1 a AX						; ME IMEDIATO
    xor bx,bx     ; null BX								; ME POR REGISTRO
    cmp cx,bx      ; compares if n is 0
    je isZero
    loopFAC:
        inc bx    ; BX++
        mul bx    ; AX*=BX
    loop loopFAC
    isZero: 
        ret
factorial ENDP

combination PROC
    ;mov si,k       ; define DI as parameter
	mov k,si		; k based on input parameter		; ME POR REGISTRO
	
    xor bx,bx		; null BX							; ME POR REGISTRO
    mov ax,n		; prepare SUB						; ME DIRETO
    sub ax,k		; realize SUB						; ME DIRETO
    mov nmk,ax      ; calculates (n-k)					; ME POR REGISTRO
    
    mov cx,k        ; define factorial parameter
    call factorial  ; return k! in AX
    mov bx,ax       ; stores in BX
	push bx			; guarantee that BX still the same
    
    mov cx,nmk      ; define factorial parameter
    call factorial  ; return (n-k)! in AX
	pop bx			; retrieve BX
    mul bx          ; calculates (n-k)!*k!
	mov bx,ax		; and stores in BX
	push bx			; guarantee that BX still the same
    
    mov cx,n        ; define factorial parameter
    call factorial  ; return n! in AX
    pop bx			; retrieve BX
	div bx          ; calculates C(n,k) in AX
	
	ret
combination ENDP

binomial PROC
	lea bx,poly_coef									; ME IMEDIATO
	mov cx,n											; ME DIRETO
	inc cx
	xor si,si											; ME POR REGISTRO
	loopBIN:
		push bx				; preserves BX
		push cx				; preserves CX
		call combination	; readies AX
		pop cx				; retrieve CX
		pop bx				; retrieve BX
		mov [bx+si],ax		; feeds the poly. coef.		; ME POR BASE INDEXADA
		inc si
	loop loopBIN
	lea bx,poly_coef		; is already pointing
    mov cx,n
	inc cx
	
	lea dx,msg3     		; mov dx,OFFSET msg3		; ME IMEDIATO
    mov ah,09h      		; write string to STDOUT	; ME IMEDIATO
    int 21h         		; will list coefficients
	
	call printDWvec
	ret
binomial ENDP

printDWvec PROC
    ;lea bx,poly_coef		
    ;mov cx,n    
	xor si,si
    printResult:
        xor dx,dx
		mov ax,[bx+si]	; AX with vector element		; ME POR BASE INDEXADA
		xor ah,ah		; to not affect division
		xor dx,dx		; to not affect division
        div ten     	; AX/10 = 10*AX+DX
		push dx			; guarantee that DX still the same
        
		xor dh,dh		; clear DH
		mov dl,al   	; first digit    
        add dl,48d  	; converts to ASCII
        mov ah,02h  	; print   
        int 21h     	; DOS interrupt
        
		pop dx      	; retrieve DX
        ;mov dl,dl   	; second digit 
		xor dh,dh		; clear DH		
        add dl,48d  	; converts to ASCII
        mov ah,02h  	; print   
        int 21h     	; DOS interrupt
        
		inc si      	; increment index 
        call breakSpace 
    loop printResult
	call breakLine
    ret
printDWvec ENDP

polyPrint PROC
	lea dx,msg4     ; print msg4
    mov ah,09h      ; (A+B)
    int 21h         ; 

	mov dx,n;     
    add dl,48d  	; print n
    mov ah,02h  	;

	lea dx,msgx     ; print msgx
    mov ah,09h      ; =
    int 21h         ; 
	
	mov ax,1		
	mov choice,ax	; index of A+B
	call AB
	
	lea dx,msg5     ; print msg4
    mov ah,09h      ; (A-B)
    int 21h         ; 

	mov dx,n   		;     
    add dl,48d  	; print n
    mov ah,02h  	;

	lea dx,msgx     ; print msgx
    mov ah,09h      ; =
    int 21h         ; 
	
	mov ax,0		 
	mov choice,ax	; index of A-B
	call AB
	ret
polyPrint ENDP

AB PROC
	lea bx,poly_coef
	mov cx,n
	inc cx	
	xor si,si			; power of B
	mov di,n			; power of A
	
	printn:
		; printing the coefficient
		mov ax,[bx]	    ; populate AX with vector element			; ME INDIRETO POR REGISTRO
		xor ah,ah		; beacuse it contains the next digit
		xor dx,dx		; to not affect division
		div ten     	; AX/10 = 10*AX+DX
		push dx			; guarantee that DX still the same
			
		xor dh,dh		; clear DH
		mov dl,al   	; first digit    
		add dl,48d  	; converts to ASCII
		mov ah,02h  	; print   
		int 21h     	; DOS interrupt
			
		pop dx      	; retrieve DX
		;mov dl,dl   	; second digit 
		xor dh,dh		; clear DH		
		add dl,48d  	; converts to ASCII
		mov ah,02h  	; print   
		int 21h     	; DOS interrupt
		; end printing the coefficient
		
		call dot
		
		call printA
		
		mov dx,di       ; power of A
		add dl,48d  	; converts to ASCII
		mov ah,02h      ; write char to STDOUT
		int 21h
		
		call printB
		
		mov dx,si       ; power of B
		add dl,48d  	; converts to ASCII
		mov ah,02h      ; write char to STDOUT
		int 21h
		
		
		inc si
		dec di
		inc bx
		
		mov ax,n
		inc ax
		cmp si,ax		; tests if is last product
		je noSign		; if it is the last don't print sign
		
		; choose between A+B (choice=1) and A-B (choice=0) 
		mov ax,choice	
		cmp ax,0
		je testSignMinus; choice A-B
		call plus		; choice A+B
		jmp noSign
		testSignMinus:	
			xor dx,dx
			mov ax,di	; checks the A pow
			div two		; AX/2, remaining in DX
			cmp dx,0	; check remaining
			je isEven	; if remaing is 0, DI is even
			isOdd:		; if odd, means sign +
				call plus
				jmp noSign
			isEven:		; if even, means sign -
				call minus
				jmp noSign
		noSign:
	loop printn

	ret
AB ENDP

breakLine PROC
    mov dl,0Ah      ; break line
    mov ah,02h      ; write char to STDOUT
    int 21h
    ret
breakLine ENDP

printA PROC
    mov dl,41h      ; A
    mov ah,02h      ; write char to STDOUT
    int 21h
	call pow
    ret
printA ENDP

printB PROC
    mov dl,42h      ; B
    mov ah,02h      ; write char to STDOUT
    int 21h
	call pow
    ret
printB ENDP

pow PROC
    mov dl,5Eh      ; power
    mov ah,02h      ; write char to STDOUT
    int 21h
    ret
pow ENDP

dot PROC
	mov dl,2Eh      ; dot
    mov ah,02h      ; write char to STDOUT
    int 21h
    ret
dot ENDP

plus PROC
	call breakSpace
	mov dl,2Bh      ; plus
    mov ah,02h      ; write char to STDOUT
    int 21h
    call breakSpace
	ret
plus ENDP

minus PROC
	call breakSpace
	mov dl,2Dh      ; minus
    mov ah,02h      ; write char to STDOUT
    int 21h
    call breakSpace
	ret
minus ENDP

breakSpace PROC
    mov dl,20h      ; space bar
    mov ah,02h      ; write char to STDOUT
    int 21h
    ret
breakSpace ENDP
	
end main
