;MOV EAX, white + (black * 16) ; white on black
;CALL SetTextColor           


;.386
;.model flat, stdcall
;.stack 4096

;ExitProcess PROTO, dwExitCOde: DWORD

INCLUDE Irvine32.inc
INCLUDE Macros.inc

.data
	; screen
	hor_bar BYTE 0B0h
	ver_bar BYTE 0B0h
	ini_sizeX_screen BYTE 0d
	ini_sizeY_screen BYTE 0d
	end_sizeX_screen BYTE 42d
	end_sizeY_screen BYTE 16d
	ini_sizeX_game BYTE ?
	end_sizeX_game BYTE ?
	ini_sizeY_game BYTE ?
	end_sizeY_game BYTE ?
	netX BYTE 21d
	help BYTE "Keys:",0Ah,"     Player 1 - (W/S)",0Ah,"     Player 2 - (I/K)",0Ah,"Velocity:",0Ah,"     Slow    - 1",0Ah,"     Default - 2",0Ah,"     Fast    - 3",0

	; players
	p1_begin BYTE 6d
	p2_begin BYTE 6d
	p1Points BYTE 0d
	p2Points BYTE 0d
	p1GoingUp BYTE 0d
	p2GoingUp BYTE 0d
	player_length BYTE 3d
	playerPiece BYTE 0DBh	
	msg1 BYTE "Press any key to start",0

	; ball
	ballX BYTE 21d
	ballY BYTE 5d
	vel_x BYTE 1 ; 1-forward -1-backward
	vel_y BYTE 1 ; 1-down -1-up
	velocity DWORD 1Dh
	was_point BYTE 0d

	; draw
	char BYTE 0DBh
	beginX BYTE ?
	beginY BYTE ?
	sizeX BYTE ?
	sizeY BYTE ?
	
	; key input
	inputChar BYTE ?
	myHandle DWORD ?    ; Variable for holding the terminal input handle
	numInp   DWORD ?    ; Variable for holding number of bytes in input buffer
	temp BYTE 16 DUP(?) ; Variable for holding data of type INPUT_RECORD
	bRead    DWORD ?    ; Variable for holding number of read input bytes
.code

main PROC
	; begin set game window dimensions
	mov al,ini_sizeX_screen
	inc al
	mov	ini_sizeY_game,al

	mov al,ini_sizeY_screen
	inc al
	mov	ini_sizeX_game,al

	mov al,end_sizeX_screen
	dec al
	mov end_sizeX_game,al

	mov al,end_sizeY_screen
	dec al
	mov end_sizeY_game,al

	mov dl,ini_sizeX_screen
	mov dh,end_sizeY_screen
	; end set game window dimensions

	inc dh
	call Gotoxy
	mov edx,OFFSET help
	call WriteString	; print help message

	call printBorder	; print screen borders
	
	mov al,1 ; write
	call namePONG		; print name PONG

	resetPoint:

	call printPlayers	; print players
	;call printBorder
	call consoleHandle	; prepare for game begin
	
	mov al,0 ; erase
	call namePONG		; delete name PONG

	xor eax,eax
	push eax	; ball moving counter
	call printBall		; initialize print the ball
	mainLoop:
		; tests if someone won 'n end the game
		mov al,10
		cmp al,p1Points
		jbe exitGame
		cmp al,p1Points
		jbe exitGame

		; structural delay
		mov eax,1 ; ms
		call Delay
	
		; ball movement
		pop eax
		inc eax
		push eax
		cmp eax,velocity	; compares if ball counter
		jbe GoOn			; was surpassed
		pop eax
		xor eax,eax
		push eax
		call moveBall		; then move the ball
		mov al,was_point	; check if a point was scored
		cmp al,1			; 1-scored 0-no
		je reset			; reset interface if a point was scored

		GoOn:

		;Get number of events in input buffer
        INVOKE GetNumberOfConsoleInputEvents, myHandle, ADDR numInp
        mov ecx,numInp
		cmp ecx,0                           ; Check if input buffer is empty
        je mainLoop                         ; Continue loop if buffer is empty
				
		; Read one event from input buffer and save it at temp
        INVOKE ReadConsoleInput, myHandle, ADDR temp, 1, ADDR bRead
        mov dx,WORD PTR temp                ; Check if EventType is KEY_EVENT,
        cmp dx,1                            ; which is determined by 1st WORD
        jne mainLoop                        ; of INPUT_RECORD message
		
		mov dl,BYTE PTR [temp+4]            ; Skip key released event
        cmp dl,0
        je mainLoop
        mov dl,BYTE PTR [temp+10]			; Copy pressed key into DL
		mov inputChar,dl					; inputChar contains keyb input
		
			
		; Actions commands
		cmp inputChar,"X"
		je exitGame
		cmp inputChar,"x"
		je exitGame

		cmp inputChar,"W"
		je p1Up
		cmp inputChar,"w"
		je p1Up

		cmp inputChar,"S"
		je p1Down
		cmp inputChar,"s"
		je p1Down

		cmp inputChar,"I"
		je p2Up
		cmp inputChar,"i"
		je p2Up

		cmp inputChar,"K"
		je p2Down
		cmp inputChar,"k"
		je p2Down

		cmp inputChar,"1"
		je vel1
		
		cmp inputChar,"2"
		je vel2

		cmp inputChar,"3"
		je vel3
	jmp mainLoop
	vel1: ; ball velocity slow
		mov eax,40h
		mov velocity,eax
		jmp mainLoop
	vel2: ; ball velocity default
		mov eax,1Dh
		mov velocity,eax
		jmp mainLoop
	vel3: ; ball velocity fast
		mov eax,10h
		mov velocity,eax
		jmp mainLoop
	p1Up: ; player 1 goes up
		mov al,1
		mov p1GoingUp,al
		mov al,p1_begin
		cmp al,ini_sizeY_game		; first line
		je mainLoop
		dec p1_begin
		call printPlayers
		jmp mainLoop
	p1Down: ; player 1 goes down
		mov al,-1
		mov p1GoingUp,al
		mov al,p1_begin
		add al,player_length
		dec al
		cmp al,end_sizeY_game		; last line
		je mainLoop
		inc p1_begin
		call printPlayers
		jmp mainLoop
	p2Up: ; player 2 goes up
		mov al,1
		mov p2GoingUp,al
		mov al,p2_begin
		cmp al,ini_sizeY_game		; first line
		je mainLoop
		dec p2_begin
		call printPlayers
		jmp mainLoop
	p2Down: ; player 2 goes down
		mov al,-1
		mov p2GoingUp,al
		mov al,p2_begin
		add al,player_length
		dec al
		cmp al,end_sizeY_game		; last line
		je mainLoop
		inc p2_begin
		call printPlayers
		jmp mainLoop
	reset:
		xor eax,eax
		mov was_point,al
		mov al,playerPiece
		push eax
		mov al," "
		mov playerPiece,al
		call printPlayers
		pop eax
		mov playerPiece,al
		call initPositions
		jmp resetPoint
	exitGame: ; guarantees that program end doesn't mess the interface
		call moveBall
		xor dl,dl
		mov dh,end_sizeY_screen
		add dh,9
		call Gotoxy
	INVOKE ExitProcess, 0
main ENDP


printBorder PROC
	mov al,hor_bar

	; upper horizontal bar
	mov dl,ini_sizeX_screen			; starts X=0
	mov dh,ini_sizeY_screen			; starts Y=0
	xor ecx,ecx
	mov cl,end_sizeX_screen
	sub cl,ini_sizeX_screen
	inc cl
	;mov al,0DFh
	UHB:
		call Gotoxy
		call Writechar
		inc dl
	loop UHB
		
	
	; lower horizontal bar
	mov dl,ini_sizeX_screen			; starts X=0
	mov dh,end_sizeY_screen			; starts Y=64
	xor ecx,ecx
	mov cl,end_sizeX_screen
	sub cl,ini_sizeX_screen
	inc cl
	;mov al,0DCh
	LHB:
		call Gotoxy
		call Writechar
		inc dl
	loop LHB

	mov al,ver_bar

	; left vertical bar
	mov dl,ini_sizeX_screen			; starts X=0
	mov dh,ini_sizeY_screen			; starts Y=0
	xor ecx,ecx
	mov cl,end_sizeY_screen
	sub cl,ini_sizeY_screen
	inc cl
	;mov al,0DDh
	LVB:
		call Gotoxy
		call Writechar
		inc dh
	loop LVB
	
	; right vertical bar
	mov dl,end_sizeX_screen	; starts X=16
	mov dh,ini_sizeY_screen			; starts Y=0
	xor ecx,ecx
	mov cl,end_sizeY_screen
	sub cl,ini_sizeY_screen
	inc cl
	;mov al,0DEh
	RVB:
		call Gotoxy
		call Writechar
		inc dh
	loop RVB
	
	ret
printBorder ENDP

printPlayers PROC
	; screen limits for character
	; X=1,Y=1  ; player 1
	; X=1,Y=15 ; player 1
	; X=63,Y=1 ; player 2
	; X=63,Y=15; player 2

	; initialize player 1
	xor ecx,ecx
	mov cl,player_length
	mov bx,WORD PTR p1_begin ; position of player begin
	mov al,playerPiece
	mov dl,ini_sizeX_game	 ; starts X=1
	mov dh,p1_begin			 ; starts Y=6
	p1:
		call Gotoxy
		call Writechar
		inc dh
	loop p1
	
	mov al," "

	p1Top: ;erases top
	cmp dh,end_sizeY_screen
	je p1Bottom
	call Gotoxy
	call Writechar

	p1Bottom: ;erases bottom
	sub dh,player_length
	dec dh
	cmp dh,ini_sizeY_screen
	je p1p2Between
	call Gotoxy
	call Writechar
	
	p1p2Between:

	; initialize player 2
	xor ecx,ecx
	mov cl,player_length
	mov bx,WORD PTR p2_begin ; position of player begin
	mov al,playerPiece
	mov dl,end_sizeX_game    ; starts X=63
	mov dh,p2_begin			 ; starts Y=6
	p2:
		call Gotoxy
		call Writechar
		inc dh
	loop p2

	mov al," "

	p2Top: ;erases top
	cmp dh,end_sizeY_screen
	je p2Bottom
	call Gotoxy
	call Writechar

	p2Bottom: ;erases bottom
	sub dh,player_length
	dec dh
	cmp dh,ini_sizeY_screen
	je p1p2End
	call Gotoxy
	call Writechar

	p1p2End:

	ret
printPlayers ENDP

moveBall PROC
	call eraseBall
	; move in X
	xor eax,eax
	mov al,vel_x
	add ballX,al
	; move in Y
	xor eax,eax
	mov al,vel_y
	add ballY,al

	; test hit box

	hit_left:	
	mov al,ballX
	mov ah,ini_sizeX_game	; wall position
	inc ah					; player position
	cmp al,ah				; hit the player
	jne hit_left_wall
		
		hit_left_player:
		mov al,p1_Begin			; begin of p1
		cmp ballY,al
		jb hit_left_wall
		add al,player_length	; end of p1
		dec al
		cmp ballY,al
		ja hit_left_wall
		neg vel_x
		mov al,vel_y
		sub al,p2GoingUp		;if sub is zero, neg vel_y
		jnz hit_left_wall
		neg vel_y

		hit_left_wall:
		mov al,ballX
		cmp al,ini_sizeX_game	; hit the wall
		jne hit_right
		neg vel_x		; changes direction for next player
		call pointUp
		ret
		;xor ah,ah
		;mov vel_x,ah
		;mov vel_y,ah


	hit_right:
	mov al,ballX
	mov ah,end_sizeX_game	; wall position
	dec ah					; player position
	cmp al,ah				; hit the player
	jne hit_right_wall
		
		hit_right_player:
		mov al,p2_Begin			; begin of p2
		cmp ballY,al
		jb hit_right_wall
		add al,player_length	; end of p2
		dec al
		cmp ballY,al
		ja hit_right_wall
		neg vel_x
		mov al,vel_y
		sub al,p1GoingUp		;if sub is zero, neg vel_y
		jnz hit_right_wall
		neg vel_y

		hit_right_wall:
		mov al,ballX
		cmp al,end_sizeX_game	; hit the wall
		jne hit_up
		neg vel_x		; changes direction for next player
		call pointUp
		ret
		;xor ah,ah
		;mov vel_x,ah
		;mov vel_y,ah
	

	hit_up:
	mov al,ballY
	cmp al,ini_sizeY_game
	jne hit_down
	neg vel_y

	hit_down:
	mov al,ballY
	cmp al,end_sizeY_game
	jne end_mov
	neg vel_y

	end_mov:
	call printBall

	push eax

	; print points
	xor eax,eax
	xor ebx,ebx

	mov dl,netX
	sub dl,2
	mov dh,1
	mov al,p1Points
	add al,48d
	call Gotoxy
	call Writechar
	mov dl,netX
	add dl,2
	mov al,p2Points
	add al,48d
	call Gotoxy
	call Writechar

	; print net
	mov al,end_sizeY_game
	sub al,ini_sizeY_game
	xor ecx,ecx
	mov cl,al
	inc cl
	mov al,"|"
	mov dl,netX
	mov dh,1
	net:
		call Gotoxy
		call Writechar
		inc dh
	loop net

	pop eax
	ret
moveBall ENDP

initPositions PROC
	mov al,6d
	mov p1_begin,al		; will always be this way
	mov p2_begin,al		; will always be this way
	
	call Randomize		; reset seed

	mov eax,11			; posição
	call Randomrange	; randômica
	add al,3			; da bola
	mov ballY,al		; Y = 3:13

	mov eax,7			; posição 
	call Randomrange	; randômica
	add al,18			; da bola
	mov ballX,al		; X = 18:24
	ret
initPositions ENDP

printBall PROC
	mov dl,ballX
	mov dh,ballY
	mov al,"*"
	call Gotoxy
	call Writechar
	ret 
printBall ENDP

eraseBall PROC
	mov dl,ballX
	mov dh,ballY
	mov al," "
	call Gotoxy
	call Writechar
	ret 
eraseBall ENDP

pointUp PROC
	mov ah,1
	mov was_point,ah
	mov eax,1000 ;1s
	call Delay
	call eraseBall
	mov al,end_sizeX_game
	cmp ballX,al
	je point2p1
	point2p2:
		inc p2Points
		ret
	point2p1:
		inc p1Points
	
	ret
pointUP ENDP

namePONG PROC
	cmp al,1	; 1-write, 0-erase
	je write
	mov eax, black + (black * 16) ; white on black
	call SetTextColor 
	jmp erase
	write:
	mov eax, cyan + (black * 16) ; white on black
	call SetTextColor 
	erase:
	
	; P
	mov al,3
	mov ah,1
	mov dl,4
	mov dh,5
	call drawREC ;top

	mov al,3
	mov ah,1
	mov dl,4
	mov dh,8
	call drawREC ;middle

	mov al,1
	mov ah,6
	mov dl,4
	mov dh,6
	call drawREC ;left

	mov al,1
	mov ah,2
	mov dl,10
	mov dh,6
	call drawREC ;right
	
	; O
	mov al,1
	mov ah,5
	mov dl,13
	mov dh,6
	call drawREC ;left

	mov al,1
	mov ah,5
	mov dl,19
	mov dh,6
	call drawREC ;right

	mov al,2
	mov ah,1
	mov dl,15
	mov dh,5
	call drawREC ;up
	
	mov al,2
	mov ah,1
	mov dl,15
	mov dh,11
	call drawREC ;down

	; N
	mov al,1
	mov ah,7
	mov dl,22
	mov dh,5
	call drawREC ;left

	mov al,1
	mov ah,7
	mov dl,28
	mov dh,5
	call drawREC ;right

	mov al,1
	mov ah,1
	mov dl,24
	mov dh,7
	call drawREC ;block1

	mov al,1
	mov ah,1
	mov dl,26
	mov dh,8
	call drawREC ;block1

	; G
	mov al,1
	mov ah,5
	mov dl,31
	mov dh,6
	call drawREC ;left

	mov al,2
	mov ah,1
	mov dl,33
	mov dh,5
	call drawREC ;top

	mov al,1
	mov ah,1
	mov dl,37
	mov dh,6
	call drawREC ;hat

	mov al,2
	mov ah,1
	mov dl,33
	mov dh,11
	call drawREC ;bottom

	mov al,1
	mov ah,1
	mov dl,35
	mov dh,9
	call drawREC ;hand1

	mov al,1
	mov ah,2
	mov dl,37
	mov dh,9
	call drawREC ;hand2


	mov dl,11
	mov dh,13
	call Gotoxy
	mov edx,OFFSET msg1
	call WriteString

	mov eax, white + (black * 16) ; white on black
	call SetTextColor  

	ret
namePONG ENDP
	
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

consoleHandle PROC
	; Get console input handle and store it in memory
    INVOKE getStdHandle, STD_INPUT_HANDLE
    mov myHandle,eax
    mov ecx,10

    ; Read two events from buffer
    INVOKE ReadConsoleInput, myHandle, ADDR temp, 1, ADDR bRead
    INVOKE ReadConsoleInput, myHandle, ADDR temp, 1, ADDR bRead

	ret
consoleHandle ENDP


END main


