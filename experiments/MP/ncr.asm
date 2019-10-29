; This program is of ncr ====================================>

.model small

data segment
        n db 05h
        r db 02h 
data ends

code segment
        assume cs:code, ds:data
start:
        mov ax,data
        mov ds,ax

        mov cl,n
        mov al,01h
        call factorial

        mov dl,al   ; result of n! in dl

        mov cl,r
        mov al,01h

        call factorial

        mov dh,al   ; result of r! in dh

        mov al,n
        mov bl,r
        sub al,bl
        mov cl,al
        mov al,01h

        call factorial

        mov cl,al   ; result of n-r! in cl

        mov al ,dl

        div dh

        div cl

        
        mov ah,4ch
        int 21h

        

factorial proc
fact:
        mul cl
        dec cl
        jnz factorial
        ret
factorial endp


code ends
        end start

;// To assemble and execute ===>>
; tasm ncr.asm     // to assemble 
; tlink ncr       // to link with assembler and microp
; td ncr         // This is to debug
