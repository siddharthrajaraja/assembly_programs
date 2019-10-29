; This program is of Factorial =====>


.model small

data segment
        n db 05h
data ends

code segment
        assume cs:code, ds:data
start:
        mov ax,data
        mov ds,ax
        mov cl,n
        mov al,01h
factorial:
        mul cl
        dec cl
        jnz factorial
        mov ah,4ch
        int 21h
code ends
        end start

        
        
;// To assemble and execute ===>>
; tasm fact.asm     // to assemble 
; tlink fact       // to link with assembler and microp
; td fact         // This is to debug
