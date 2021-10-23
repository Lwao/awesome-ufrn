;.386
;.model flat, stdcall
;.stack 4096

;ExitProcess PROTO, dwExitCOde: DWORD

INCLUDE Irvine32.inc

.data
	; define your variables here

.code

main PROC
	; write your assembly code here
	mov eax, 5
	call writeint
	l1:
		jmp l1
	exit
main ENDP
END main