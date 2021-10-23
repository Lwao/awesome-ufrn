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

	myHandle DWORD ?    ; Variable for holding the terminal input handle
	numInp   DWORD ?    ; Variable for holding number of bytes in input buffer
	temp BYTE 16 DUP(?) ; Variable for holding data of type INPUT_RECORD
	bRead    DWORD ?    ; Variable for holding number of read input bytes

.code

main PROC
	; write your assembly code here
	
	; set ground
	mov dl,0
	mov dh,29
	call Gotoxy
	mov edx,OFFSET ground
	call WriteString

	call MoveDown

	
	; ah still contais value of last target string
	cmp ah,yPosShip ; compares if crash into the ship
	je exitGame

	call DrawShip

	xor eax,eax
	push eax		; hold 0 in the stack

	; Get console input handle and store it in memory
    INVOKE getStdHandle, STD_INPUT_HANDLE
    MOV myHandle, EAX
    MOV ECX, 10

    ; Read two events from buffer
    INVOKE ReadConsoleInput, myHandle, ADDR temp, 1, ADDR bRead
    INVOKE ReadConsoleInput, myHandle, ADDR temp, 1, ADDR bRead

    ; Main infinite loop
	
	mainLoop:
		; Test crash
		mov al,yFirstTarget
		cmp al,yPosShip
		jae exitGame


		; Test ray state
		cmp yPosRay,0
		je deleteRay
		cmp isRay,1
		je rayMoving
		
		;Get number of events in input buffer
        INVOKE GetNumberOfConsoleInputEvents, myHandle, ADDR numInp
        MOV ECX, numInp

		pop eax
		inc eax
		push eax
		cmp eax,0000FFFFh
		jbe testBuff
		pop eax
		xor eax,eax
		push eax
		call MoveDown
		testBuff:
		;mov eax,1 ; ms
		;call Delay
		

		CMP ECX, 0                          ; Check if input buffer is empty
        JE mainLoop                         ; Continue loop if buffer is empty
				
		; Read one event from input buffer and save it at temp
        INVOKE ReadConsoleInput, myHandle, ADDR temp, 1, ADDR bRead
        MOV DX, WORD PTR temp               ; Check if EventType is KEY_EVENT,
        CMP DX, 1                           ; which is determined by 1st WORD
        JNE mainLoop                        ; of INPUT_RECORD message
		
		MOV DL, BYTE PTR [temp+4]           ; Skip key released event
        CMP DL, 0
        JE mainLoop
        MOV DL, BYTE PTR [temp+10]			; Copy pressed key into DL
		mov inputChar, dl
				
		ChainOfCommands:
		
		; Actions commands
		cmp inputChar,"X"
		je exitGame
		cmp inputChar,"x"
		je exitGame

		cmp inputChar,"A"
		je moveLeft
		cmp inputChar,"a"
		je moveLeft

		cmp inputChar,"D"
		je moveRight
		cmp inputChar,"d"
		je moveRight

		cmp inputChar,"J"
		je shootRay 
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
	timeOut:
		call MoveDown
		xor eax,eax		; reset time
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

MoveDown PROC
	xor eax,eax
	
	mov ah,yFirstTarget ; position 0
	; set target 0
	mov dl,0
	mov dh,ah
	call Gotoxy
	mov edx,OFFSET target0
	call WriteString

	;inc yFirstTarget ; increment
	

	;mov ah,yFirstTarget ; position 1
	inc ah				 ; position 1
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

	inc yFirstTarget ; increments for next move

	ret
MoveDown ENDP


END main