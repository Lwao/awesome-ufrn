;.386
;.model flat, stdcall
;.stack 4096

;ExitProcess PROTO, dwExitCOde: DWORD

INCLUDE Irvine32.inc
INCLUDE Macros.inc

.data
	char BYTE 0DBh
	sizeX BYTE ?
	sizeY BYTE ?
	sizeR BYTE ?
	sizeRX BYTE ?
	sizeRY BYTE ? 
	centerX BYTE ?
	centerY BYTE ?
	beginX BYTE ?
	beginY BYTE ?

	myHandle DWORD ?    ; Variable for holding the terminal input handle
	numInp   DWORD ?    ; Variable for holding number of bytes in input buffer
	temp BYTE 16 DUP(?) ; Variable for holding data of type INPUT_RECORD
	bRead    DWORD ?    ; Variable for holding number of read input bytes
.code

main PROC
	;mov eax, green + (black * 16) ; white on black
	;call SetTextColor  
	call resetPOS

	mov dl,10
	mov dh,10

	mov al,2
	mov ah,2

	call drawCIRC

	mov dl,20
	mov dh,10

	mov al,2
	mov ah,3

	call drawELIP
	

	mov dl,30
	mov dh,10

	mov al,4
	mov ah,5

	call drawREC

	INVOKE getStdHandle, STD_INPUT_HANDLE
    mov myHandle,eax
    mov ecx,10

    ; Read two events from buffer
    INVOKE ReadConsoleInput, myHandle, ADDR temp, 1, ADDR bRead
    INVOKE ReadConsoleInput, myHandle, ADDR temp, 1, ADDR bRead

	INVOKE ExitProcess, 0
main ENDP

drawELIP PROC
	; al - RX size
	; ah - RY size
	; dl - X center
	; dh - Y center
	mov sizeRX,al
	mov sizeRY,ah
	mov centerX,dl
	mov centerY,dh

	cmp al,ah
	jae Xhigher
	jmp Yhigher
	
	Xhigher:
	add al,al	; 2R
	inc al		; 2R+1
	xor ah,ah	; 0
	mov sizeX,al
	mov sizeY,ah
	sub dl,al   ; -(2R+1)
	mov beginX,dl

	linex:
		xor ecx,ecx
		mov cl,sizeX
		columnx:
			call drawPX
			add dh,sizeY
			call drawPX
			sub dh,sizeY
			call jumpHorPX
		loop columnx
		dec dh			; go up

		inc sizeY		; increase
		inc sizeY		; Y gradient
		
		inc beginX		; begin from 
		inc beginX		; the next
		mov dl,beginX	; pixel

		dec sizeX		; lose 2px
		dec sizeX		; of sizeX
		
		mov al,centerY	; centerY
		sub al,sizeRY	; minus R
		cmp dh,al		; continue if dh is greater
	jae linex

	ret
	
	Yhigher:
	add ah,ah	; 2R
	inc ah		; 2R+1
	xor al,al	; 0
	mov sizeX,al
	mov sizeY,ah
	sub dh,sizeRY; -R
	mov beginY,dh

	liney:
		xor ecx,ecx
		mov cl,sizeY
		columny:
			call drawPX
			add dl,sizeX
			call drawPX
			sub dl,sizeX
			inc dh
		loop columny
		dec dl			; go 
		dec dl			; left

		inc sizeX		; increase
		inc sizeX		; X gradient
		inc sizeX
		inc sizeX
		
		inc beginY		; begin from 
		mov dh,beginY	; pixel

		dec sizeY		; lose 2px
		dec sizeY		; of sizeY
		
		mov al,centerX	; centerX
		sub al,sizeRX	; -R
		sub al,sizeRX	; -2R
		;dec al
		cmp dl,al		; continue if dl is greater
	jae liney

	ret
drawELIP ENDP

drawCIRC PROC
	; al - R size
	; dl - X center
	; dh - Y center
	mov sizeR,al
	mov centerX,dl
	mov centerY,dh
	; center rectangule size
	mov sizeX,al	;R
	add sizeX,al	;2R
	;inc sizeX		;2R+1
	inc sizeX		;2R+2 ou R+1 px
	; center rectangule ypos
	xor ah,ah
	mov sizeY,ah	;0
	; left side of the circle
	sub dl,al		;-R
	sub dl,al		;-2R 
	dec dl			;-2R-1 
	mov beginX,dl
	

	line:
		xor ecx,ecx
		mov cl,sizeX
		column:
			call drawPX
			add dh,sizeY
			call drawPX
			sub dh,sizeY
			call jumpHorPX
		loop column 
		dec dh			; go up

		inc sizeY		; increase
		inc sizeY		; Y gradient
		
		inc beginX		; begin from 
		inc beginX		; the next
		mov dl,beginX	; pixel

		dec sizeX		; lose 2px
		dec sizeX		; of sizeX
		
		mov al,centerY	; centerY
		sub al,sizeR	; minus R
		cmp dh,al		; continue if dh is greater
	jae line
	ret
drawCIRC ENDP

drawREC PROC
	; al - X size
	; ah - Y size
	; dl - X begin
	; dh - Y begin
	mov beginX,dl
	mov beginY,dh
	mov sizeX,al
	mov sizeY,ah
	line:
		xor ecx,ecx
		mov cl,sizeX
		column:
			call drawPX
			call jumpHorPX
		loop column 
		call jumpVerPX
		mov al,beginY
		add al,sizeY
		cmp dh,al
	jb line
	ret
drawREC ENDP

drawPX PROC
	mov al,char
	call Gotoxy
	call Writechar
	inc dl
	call Gotoxy
	call Writechar
	dec dl
	ret
drawPX ENDP

resetPos PROC
	xor edx,edx
	ret
resetPos ENDP

jumpHorPX PROC
	inc dl
	inc dl
	ret
jumpHorPX ENDP

jumpVerPX PROC
	inc dh
	mov dl,beginX
	ret
jumpVerPX ENDP
END main