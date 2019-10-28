; This program is of 16 bit subtraction =====>


.model small
data segment
        a dw 1234h
        b dw 9920h
        res dw ?
data ends

code segment
        assume cs:code , ds:data
start:
        mov ax,data
        mov ds,ax
        mov ax,a
        mov bx,b
        sub ax,bx
        mov res,ax                                                                                                                                                                                                                                                                                                                                                                                      
        mov ah,4ch
        int 21h

code ends
        end start






;// To assemble and execute ===>>
; tasm sub16.asm     // to assemble 
; tlink sub16       // to link with assembler and microp
; td sub16         // This is to debug
        