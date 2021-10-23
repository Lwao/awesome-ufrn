.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
	; define your variables here
.code

main PROC
	; write your assembly code here
	mov eax, 2
	INVOKE ExitProcess, 0
	ret

main ENDP
END main