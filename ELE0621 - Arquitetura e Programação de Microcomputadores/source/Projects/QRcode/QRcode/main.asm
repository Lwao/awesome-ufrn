;.386
;.model flat, stdcall
;.stack 4096

;ExitProcess PROTO, dwExitCOde: DWORD

INCLUDE Irvine32.inc
INCLUDE Macros.inc

.data
	theChart BYTE 0FEh
	m_white BYTE 255d
	m_black BYTE "O"
	screen BYTE 49 dup (255) ; 7x7 modules
	;screen BYTE "0000000111111122222223333333444444455555550000000",0
	QRcodeV3 BYTE 841 dup (255) ; ((V-1)*4)+21, V=3 => 29x29 modules
.code

main PROC
	call finder_pattern
	call print_pattern
	INVOKE ExitProcess, 0
main ENDP

finder_pattern PROC
	; 7x7 modules
	xor ecx,ecx
	xor ebx,ebx
	xor esi,esi
	xor edi,edi
	lea ebx,screen
	lines:
		mov cl,7 ; colunas
		mov eax,esi	; número de linhas
		mov edx,7
		mul edx		; x7
		add edi,eax ; 7*linha + coluna
		collumn:
			cmp esi,0 ; se linha 0
			je tryA
			cmp esi,6 ; ou linha 6
			jne tryB
			tryA:
			mov al,m_black
			mov [ebx+edi],al ; recebe módulo preto
			tryB:
			inc edi	; incrementa coluna
		loop collumn
		xor edi,edi ; zera colunas
		inc esi	; incrementa linha
		cmp esi,7 ; compara se o número de linhas foi percorrido
	jne lines
	ret
finder_pattern ENDP

print_pattern PROC
	;mov eax, white + (black * 16) ; white on black
	;call SetTextColor          
	mov dl,0 ;colunas
	mov dh,0 ;linhas
	xor esi,esi ;linhas
	xor edi,edi ;colunas

	xor ecx,ecx
	xor ebx,ebx
	lea ebx,screen
	lines:
		mov cl,7 ; colunas
		push edx		; save edx
		mov eax,esi	; número de linhas
		mov edx,7
		mul edx		; x7
		add edi,eax ; 7*linha + coluna
		pop edx			; to not be affected
		collumn:
			mov al,[ebx+edi] ; buffer recebe módulo
			call Gotoxy
			call Writechar
			inc edi	; incrementa coluna
			inc dl
		loop collumn
		xor dl,dl
		inc dh
		xor edi,edi ; zera colunas
		inc esi	; incrementa linha
		cmp esi,7 ; compara se o número de linhas foi percorrido
	jne lines



	ret
print_pattern ENDP

exp2int PROC
	ret
exp2int ENDP

int2exp PROC
	ret
int2exp ENDP
END main