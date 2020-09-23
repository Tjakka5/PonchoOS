[org 0x7c00]

mov [BOOT_DISK], dl

mov bp, 0x7c00
mov sp, bp

call ReadDisk

jmp PROGRAM_SPACE

%include "gdt.asm"
%include "print.asm"
%include "diskRead.asm"

; Signify that this is bootable
times 510-($-$$) db 0
dw 0xaa55