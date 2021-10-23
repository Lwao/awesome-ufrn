.386
.model flat, stdcall
option casemap: none

include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
include \masm32\include\masm32rt.inc 

.data
	msg db "Hello world",0
.code
	start:
		mov ecx, 5
		sub ecx, 4
		cls
		print str$(ecx),13,10;
		
		inkey "pause"
		
		jmp start
		
		ret
		
		
		call ExitProcess
	end start