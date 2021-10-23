; Reading a File                      (ReadFile.asm)

; Opens, reads, and displays a text file using
; procedures from Irvine32.lib. 

INCLUDE Irvine32.inc
INCLUDE macros.inc

BUFFER_SIZE = 1000

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
	mov ecx,BUFFER_SIZE

	new_number:
	mov edi,esi		; set return point of index
	; detect sign
	mov al,[edx+esi]
	cmp al,2Dh		; "-"	
	;call writeint
	je negative
	positive:
	mov sign,0		; is positive
	inc int_size	; +1 integer size
	jmp int_numbers
	negative:
	mov sign,1		; is negative
	int_numbers:
		inc esi
		; detect int2flt transition
		mov al,[edx+esi]
		cmp al,2Eh		; "."
		je dot
		inc int_size	; +1 integer size
	jmp int_numbers
	dot:			; from now on, only floats
	flt_numbers:
		inc esi
		; detect number end
		mov al,[edx+esi]
		cmp al,0Ah		; "RETURN"
		je return
		inc flt_size	; +1 float size
	jmp flt_numbers
	return:			; end of the number

	;xor eax,eax
	;mov al,sign
	;call Writeint
	;call crlf
	;mov al,int_size
	;call Writeint
	;call crlf
	;mov al,flt_size
	;call Writeint
	;call crlf

	assembleNumber:

	mov esi,edi		; get return point of index
	mov al,sign
	cmp al,1		; if sign negative
	fld zero
	jne isPositive
	isNegative:
	inc esi
	isPositive:
		
	xor eax,eax
	mov al,[edx+esi]
	sub al,48d
	call pow10
	fadd
	
	xor eax,eax
	mov al,[edx+esi+1]
	sub al,48d
	call pow10
	fadd
	
	xor eax,eax
	mov al,[edx+esi+2]
	sub al,48d
	call pow10
	fadd

	;inc esi ; jump to dot
	;inc esi ; jump dot

	xor ebx,ebx

	xor eax,eax
	mov al,[edx+esi+4]
	sub al,48d
	call root10
	fadd
	
	xor eax,eax
	mov al,[edx+esi+5]
	sub al,48d
	call root10
	fadd
	
	xor eax,eax
	mov al,[edx+esi+6]
	sub al,48d
	call root10
	fadd

	
	; change sign if negative
	mov al,sign
	cmp al,1		; if sign negative
	jne dontChange
	doChange:
	fchs
	dontChange:

	call WriteFloat

close_file:
	mov	eax,fileHandle
	call	CloseFile

	;fld a
	;call WriteFloat

quit:
	exit
main ENDP

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
	; flt_size - power
	; bl	   - number of divisions
	; stop when bl==flt_size
	xor ecx,ecx
	inc bl			; number of divisions
	mov cl,bl
	fld zero
	mov temp,eax
	fiadd temp		; stores number for root
	root:
		fidiv ten
	loop root
	ret
root10 ENDP

END main