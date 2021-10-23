;.386
;.model flat, stdcall
;.stack 4096

;ExitProcess PROTO, dwExitCOde: DWORD

INCLUDE Irvine32.inc
INCLUDE Macros.inc

.data
	; define your variables here
	; 5 bits x 5 bits grid
	;earth BYTE B2h
	;water BYTE B0h

	; screen
	hor_bar BYTE 0B0h
	ver_bar BYTE 0B0h
	iniX_screen BYTE 0d
	endX_screen BYTE 78d
	iniY_screen BYTE 0d
	endY_screen BYTE 26d

	inputChar BYTE ?
;	screen BYTE 1024 dup (?)

	
.code

main PROC
	call printBorder
	mainLoop:		
		; Read command
		call ReadChar ; put in AL
		mov inputChar,al

			
		; Actions commands
		cmp inputChar,"x"
		je exitGame
	jmp mainLoop

	exitGame:
	INVOKE ExitProcess, 0
main ENDP

printBorder PROC
	mov al,hor_bar

	; upper horizontal bar
	mov dl,iniX_screen			
	mov dh,iniY_screen			
	xor ecx,ecx
	mov cl,endX_screen
	sub cl,iniX_screen
	inc cl
	UHB:
		call Gotoxy
		call Writechar
		inc dl
	loop UHB
	
	; lower horizontal bar
	mov dl,iniX_screen			
	mov dh,endY_screen			
	xor ecx,ecx
	mov cl,endX_screen
	sub cl,iniX_screen
	inc cl
	LHB:
		call Gotoxy
		call Writechar
		inc dl
	loop LHB

	mov al,ver_bar

	; left vertical bar
	mov dl,iniX_screen			
	mov dh,iniY_screen			
	xor ecx,ecx
	mov cl,endY_screen
	sub cl,iniY_screen
	inc cl
	LVB:
		call Gotoxy
		call Writechar
		inc dh
	loop LVB
	
	; right vertical bar
	mov dl,endX_screen			
	mov dh,iniY_screen			
	xor ecx,ecx
	mov cl,endY_screen
	sub cl,iniY_screen
	inc cl
	RVB:
		call Gotoxy
		call Writechar
		inc dh
	loop RVB
	
	
printBorder ENDP

END main