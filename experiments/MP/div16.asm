; This program is of 16 bit division =====>

.model small
data segment
        a dw 1234h
        b dw 1451h
        res dw ?
data ends
code segment
        assume cs:code , ds:data
start:
        mov ax,data
        mov ds,ax
        mov ax,a
        mov bx,b
        div bx
        lea si,res
        mov [si],ax
        mov [si+2],dx
        mov ah,4ch
        int 21h
code ends
        end start

;// To assemble and execute ===>>
; tasm div16.asm     // to assemble 
; tlink div16       // to link with assembler and microp
; td div16         // This is to debug
