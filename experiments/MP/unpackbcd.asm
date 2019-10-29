; This program is of unpack bcd ====================================>


.model small
data segment
        n db 75h ; answer should be 0705 in bx
data ends

code segment
        assume cs:code , ds:data
start:  mov ax,data
        mov ds,ax

        mov al,n
        and al, 0Fh  ; eliminate higher(7)

        mov bl,al  ; store (05)h in bl

        
        mov al,n   ; reload al
        and al,0F0h ; eliminate lower(5)

        mov cl,04h  ; initialize counter
        rol al,cl

        mov bh,al   ; store (07)h in bh

        mov ah,4ch
        int 21h


code ends
        end start

;// To assemble and execute ===>>
; tasm unpack.asm     // to assemble 
; tlink unpack       // to link with assembler and microp
; td unpack         // This is to debug
