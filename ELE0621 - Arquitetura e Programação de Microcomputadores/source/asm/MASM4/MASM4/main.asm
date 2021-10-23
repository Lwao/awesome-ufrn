;.386
;.model flat, stdcall
;.stack 4096

;ExitProcess PROTO, dwExitCOde: DWORD

INCLUDE Irvine32.inc

.data
	; define your variables here
	vector BYTE "ABCDEFGH", 0
	loc BYTE 3

.code

main PROC
	; write your assembly code here
	;mov edi, OFFSET vector
	;movzx si,loc
	movzx esi,loc
	mov ah," "
	mov vector[esi], ah
	;mov [edi], ah 
	mov edx,OFFSET vector
	call WriteString
main ENDP
END main