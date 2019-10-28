; This program is of 16 bit addition =====>


.model small
data segment
        a dw 1234h
        b dw 1234h
        sum dw ?
        carry db 00h
data ends
code segment
        assume cs:code , ds:data
start:
        mov ax,data
        mov ds,ax
        mov ax,a
        add ax,b
        jnc skip
        inc carry
skip:   mov sum,ax
        mov ah,4ch
        int 21h
code ends
        end start


        
        
;// To assemble and execute ===>>
; tasm add16.asm     // to assemble 
; tlink add16       // to link with assembler and microp
; td add16         // This is to debug
