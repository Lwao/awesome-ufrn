;.386
;.model flat, stdcall
;.stack 4096

;ExitProcess PROTO, dwExitCOde: DWORD

INCLUDE Irvine32.inc

.data
	; define your variables here
	sum1 DWORD 0
	sum2 WORD 0
	sum3 BYTE 0
.code

main PROC
	; write your assembly code here
	mov eax, 12345678h
	mov eax, sum1
	mov eax, 12345678h
	mov ax, sum2
	mov eax, 12345678h
	mov al, sum3
	mov eax, 12345678h
	mov ah, sum3
	mov eax, 12345678h
	call writeint
	INVOKE ExitProcess, 0
main ENDP
END main