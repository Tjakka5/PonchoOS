cd ..

IF EXIST out RMDIR /S /Q out
mkdir out

cd src

nasm bootloader.asm -f bin -o ../out/bootloader.bin
nasm extendedProgram.asm -f elf64 -o ../out/extendedProgram.o 

x86_64-elf-gcc -ffreestanding -mno-red-zone -m64 -c "kernel.cpp" -o "../out/kernel.o"

cd ../out

x86_64-elf-ld -o kernel.tmp -Ttext 0x7e00 extendedProgram.o kernel.o
objcopy -O binary kernel.tmp kernel.bin

copy /b bootloader.bin+kernel.bin bootloader.flp