;.386
;.model flat, stdcall
;.stack 4096

;ExitProcess PROTO, dwExitCOde: DWORD

INCLUDE Irvine32.inc
INCLUDE Macros.inc

.data
	; define your variables here

	ground BYTE "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\", 0
	target1 BYTE "   _       o           O    / \- /      o        o                _              O                    o                 ", 0
	target2 BYTE "                              o        oo O      o                _              O                    o                 ", 0
	target3 BYTE "                 oo                     oooO      o                _            OOO              o         O         __  ", 0
	target0 BYTE "                                                                                                                         ", 0
	xPosShip BYTE 60 ; min0 max119 delta120
	yPosShip BYTE 27 ; min0 max40 delta41
	xPosRay BYTE 60
	yPosRay BYTE 27
	isRay BYTE 0
	inputChar BYTE ?
	yFirstTarget BYTE 0
	
.code

main PROC
	; write your assembly code here
	
	; set ground
	mov dl,0
	mov dh,29
	call Gotoxy
	mov edx,OFFSET ground
	call WriteString

	mov ah,yFirstTarget ; position 0
	; set target 0
	mov dl,0
	mov dh,ah
	call Gotoxy
	mov edx,OFFSET target0
	call WriteString

	inc yFirstTarget ; increment
	
	mov ah,yFirstTarget ; position 1
	; set target 1	
	mov dl,0
	mov dh,ah
	call Gotoxy
	mov edx,OFFSET target1
	call WriteString
			
	inc ah				; position 2
	; set target 2
	mov dl,0
	mov dh,ah
	call Gotoxy
	mov edx,OFFSET target2
	call WriteString

	inc ah				 ; position 3
	; set target 3
	mov dl,0
	mov dh,ah
	call Gotoxy
	mov edx,OFFSET target3
	call WriteString

	cmp ah,yPosShip ; compares if crash into the ship
	je exitGame

	call DrawShip
	
	mainLoop:
		
		
		; Test ray state
		cmp yPosRay,0
		je deleteRay
		cmp isRay,1
		je rayMoving
		

		mov  eax,50          ; sleep, to allow OS to time slice
		call Delay
			
		; Read command
		call ReadChar ; put in AL
		mov inputChar,al

			
		; Actions commands
		cmp inputChar,"x"
		je exitGame

		cmp inputChar,"a"
		je moveLeft

		cmp inputChar,"d"
		je moveRight

		cmp inputChar,"j"
		je shootRay 

	jmp mainLoop

	
	moveLeft:
		cmp xPosShip,0
		je mainLoop
		call ExtractShip
		dec xPosShip
		call DrawShip
		jmp mainLoop
	moveRight:
		cmp xPosShip,119
		je mainLoop
		call ExtractShip
		inc xPosShip
		call DrawShip
		jmp mainLoop
	shootRay:
		cmp isRay,1
		je mainLoop
		mov isRay,1
		mov ah,xPosShip
		mov xPosRay,ah
		mov ah,yPosShip
		mov yPosRay,ah
		dec yPosRay
		call DrawRay
		jmp mainLoop
	rayMoving:
		call ExtractRay
		dec yPosRay
		call DrawRay
		mov eax,20 ; ms
		call Delay
		jmp mainLoop
	deleteRay:
		call ExtractRay
		mov ah,yPosShip
		mov yPosRay,ah
		mov isRay,0
		movzx esi,xPosRay
		mov ah," "
		mov target1[esi], ah
		mov target2[esi], ah
		mov target3[esi], ah
		jmp mainLoop
	exitGame:

	INVOKE ExitProcess, 0
main ENDP

ExtractShip PROC
	mov dl,xPosShip
	mov dh,yPosShip
	call Gotoxy ; Content in DL (x-axis) and DH (y-axis)
	mov al," "
	call WriteChar
	ret
ExtractShip ENDP

DrawShip PROC
	mov dl,xPosShip
	mov dh,yPosShip
	call Gotoxy ; Content in DL (x-axis) and DH (y-axis)
	mov al,"A"
	call WriteChar
	ret
DrawShip ENDP

DrawRay PROC
	mov dl,xPosRay
	mov dh,yPosRay
	call Gotoxy
	mov al,"|"
	call WriteChar
	ret
DrawRay ENDP

ExtractRay PROC
	mov dl,xPosRay
	mov dh,yPosRay
	call Gotoxy
	mov al," "
	call WriteChar
	ret
ExtractRay ENDP
END main