; This program is of pack bcd ====================================>


.model small
data segment
        n dw 0409h   ; answer should be 49 in al
data ends
code segment
        assume cs:code,ds:data
start: mov ax,data
       mov ds,ax
       mov bx,n

       mov cl,04h  ; initialize counter for left rotate

       mov al,bh   ; higher value(04) in al
       rol al,cl   ; rotate al to(40)

       add al,bl   ; add bl to rotated al

       mov ah,4ch
       int 21h



code ends
        end start

;// To assemble and execute ===>>
; tasm pack.asm     // to assemble 
; tlink pack       // to link with assembler and microp
; td pack         // This is to debug
