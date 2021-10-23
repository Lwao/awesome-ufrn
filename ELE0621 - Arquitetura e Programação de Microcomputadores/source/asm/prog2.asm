.386
.model flat, stdcall
option casemap: none

include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib

.data

	org 100h                  ; code starts at offset 100h		
		  
	mov ah, 09h                  ; function to display a string
	mov dx, message  ; offset of Message string terminating with $
	int 21h                  ; dos interrupt

	mov ah, 4ch                  ; function to terminate
	mov al, 00   
	int 21h          

.code                          ; code segment
    start:
		        ; Dos Interrupt

		  
		message db "a$"  ; Message to be displayed terminating with a $

	end start	
	
	