PROGRAM_SPACE equ 0x7e00
SECTOR_COUNT equ 4

DiskLoad:
	mov ah, 0x02
	mov bx, PROGRAM_SPACE
	mov al, SECTOR_COUNT
	mov dl, [BOOT_DRIVE]
	mov ch, 0x00
	mov dh, 0x00
	mov cl, 0x02

	int 0x13

	jc DiskReadFailed

	ret

DiskReadFailed:
	mov bx, DiskReadErrorString
	call PrintString

	jmp $


BOOT_DRIVE: 
	db 0

DiskReadErrorString:
	db 'Disk read failed', 0