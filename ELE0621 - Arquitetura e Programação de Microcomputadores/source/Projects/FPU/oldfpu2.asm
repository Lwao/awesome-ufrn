; Reading a File                      (ReadFile.asm)

; Opens, reads, and displays a text file using
; procedures from Irvine32.lib. 

INCLUDE Irvine32.inc
INCLUDE macros.inc

BUFFER_SIZE = 100

.data
buffer BYTE BUFFER_SIZE DUP(?)
;filename    BYTE 80 DUP(0)
filename BYTE "ruidoso.txt",0
fileHandle  HANDLE ?
a REAL4 0.0

	sign BYTE 0 ; 0-positive 1-negative
	int_size BYTE ? ; integer part
	flt_size BYTE ? ; float part

	ten DWORD 10d
	temp DWORD ?
	zero REAL4 0.0

.code
main PROC

; Let user input a filename.
	;mWrite "Enter an input filename: "
	;mov	edx,OFFSET filename
	;mov	ecx,SIZEOF filename
	;call	ReadString

; Open the file for input.
	mov	edx,OFFSET filename
	call	OpenInputFile
	mov	fileHandle,eax

; Check for errors.
	cmp	eax,INVALID_HANDLE_VALUE		; error opening file?
	jne	file_ok					; no: skip
	mWrite <"Cannot open file",0dh,0ah>
	jmp	quit						; and quit
file_ok:

; Read the file into a buffer.
	mov	edx,OFFSET buffer
	mov	ecx,BUFFER_SIZE
	call	ReadFromFile
	jnc	check_buffer_size			; error reading?
	mWrite "Error reading file. "		; yes: show error message
	call	WriteWindowsMsg
	jmp	close_file
	
check_buffer_size:
	cmp	eax,BUFFER_SIZE			; buffer large enough?
	jb	buf_size_ok				; yes
	mWrite <"Error: Buffer too small for the file",0dh,0ah>
	jmp	quit						; and quit
	
buf_size_ok:	
	mov	buffer[eax],0		; insert null terminator
	mWrite "File size: "
	call	WriteDec			; display file size
	call	Crlf

; Display the buffer.
	mWrite <"Buffer:",0dh,0ah,0dh,0ah>
	mov	edx,OFFSET buffer	; display the buffer
	;call	WriteString
	call	Crlf

	
	
	xor esi,esi
	xor edi,edi
	xor ecx,ecx
	;mov ecx,BUFFER_SIZE

	new_number:
		xor eax,eax
		; detect sign
		mov al,[edx+esi]
		cmp al,2Dh			; "-"	
		je negative
		positive:
			mov sign,0		; is positive
			jmp GoOn ; keep in same char
		negative:
			mov sign,1		; is negative
			inc esi			; go to next char
		GoOn:
		mov al,[edx+esi]	; move integer number
		mov temp,eax
		fld temp			; stacks integer part
		inc esi				; jump to dot
		inc esi				; jump past the dot
		xor ebx,ebx			; will be the divider exponent
		floatPart:			; assembles the float part
			xor eax,eax		
			mov al,[edx+esi]; get char
			cmp al,0Ah		; check for "RETURN"
			je chooseSign   ; get out of the loop and go to next number
			sub al,48d		; converts to int
			call root10		; divide by the correct 10th power
			fadd			; add to the total number
			inc esi			; next char
		jmp floatPart
		chooseSign:
			inc esi			; next row
			mov al,sign		; change sign if negative
			cmp al,1		; 1-negative, 0-positive
			jne dontChange	
			doChange:		; is negative
			fchs
			dontChange:		; is positive
	call WriteFloat
	call crlf
	cmp esi,BUFFER_SIZE
	jbe new_number			; return to prepare new number if esi<BUFFER_SIZE

close_file:
	mov	eax,fileHandle
	call	CloseFile

	;fld a
	;call WriteFloat

quit:
	exit
main ENDP

readBuffer PROC

readBuffer ENDP

pow10 PROC
	; al	   - number
	; int_size - power
	xor ecx,ecx
	dec int_size
	mov cl,int_size
	fld zero
	mov temp,eax
	fiadd temp		; stores number for pow(0)
	cmp cl,0
	jne power	
	ret			; if pow(0) return
	power:
		fimul ten
	loop power
	ret
pow10 ENDP

root10 PROC
	; al	   - number
	; bl	   - number of divisions
	xor ecx,ecx
	inc bl			; number of divisions
	mov cl,bl
	fld zero		
	mov temp,eax
	fiadd temp		; stores number for division
	root:
		fidiv ten
	loop root
	ret
root10 ENDP

END main