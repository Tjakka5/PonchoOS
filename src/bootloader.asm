[org 0x7c00]

mov [BOOT_DRIVE], dl

mov bp, 0x7c00
mov sp, bp

call DiskLoad

jmp PROGRAM_SPACE

%include "diskLoad.asm"
%include "printString.asm"

times 510-($-$$) db 0
dw 0xaa55
