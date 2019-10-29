; This program is of highest value in array ====================================>


.model small
data segment
        arr db 10h,40h,20h,90h,70h
data ends
code segment
        assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax
        lea si, arr
        mov al, [si]
        mov cx,0005h

back:   cmp al,[si]
        jc change
        jmp next
change: mov al,[si]
next:   inc si
        loop back

        mov ah,4ch
        int 21h
code ends
        end start

;// To assemble and execute ===>>
; tasm highest.asm     // to assemble 
; tlink highest       // to link with assembler and microp
; td highest         // This is to debug
