PrintString:
	pusha ; Push all registers
	mov ah, 0x0e ; Indicate it's text we want to print

	.Loop:
		cmp [bx], byte 0 ; If current byte of string is 0
		je .Exit ; Then jump to exit
		
		mov al, [bx] ; Move character into al
		int 0x10 ; Tell BIOS to print
		inc bx ; Increment index of string
		jmp .Loop ; Repeat
		
	.Exit:

	popa ; Pop all registers
	ret