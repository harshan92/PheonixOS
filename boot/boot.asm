[org 0x00]
[bits 16]

section code

.init:
    mov eax, 0xb800
    mov es, eax
    mov eax, 0 ; set eax to 0 ->i=0



.clear:
    mov byte [es:eax], 0; move blank charactors to current text
    inc eax
    mov byte [es:eax], 0x30; move the background color and color to the next address
    inc eax
    cmp eax, 2*25*80

    jl .clear

.main:
    mov byte [es:0x00], 'H'; 0xb800 + 0x00 = 0xb800
    mov byte [es:0x01], 0x30

jmp $

times 510 - ($-$$) db 0x00 ; pads the file with 0s, making it right size

db 0x55
db 0xaa