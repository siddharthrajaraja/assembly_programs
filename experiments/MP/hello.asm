; This program is of Hello =====>


.model small
data segment
        string db "Hello$"
data ends
code segment
        assume cs:code , ds:data
        mov ax,data
        mov ds,ax

        mov ah,09h
        lea dx,string
        int 21h

        mov ah,4ch
        int 21h



code ends
        end 

;// To assemble and execute ===>>
; tasm hello.asm     // to assemble 
; tlink hello       // to link with assembler and microp
; td hello        // This is to debug
        