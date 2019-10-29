; This program is to get number of even and odd values in array ====================================>

.model small

data segment
        arr db 05h,02h,03h,07h,09h
data ends
code segment
        assume cs:code , ds:data
start:  mov ax,data
        mov ds,ax
        lea si,arr
        mov cx,0005h

        mov bl,00h  ; count of even
        mov bh,00h  ; count of odd

        mov al,00h  ; get latest even number
        mov ah,00h  ; get latest odd number

back:   ror [si],01h
        jc odd
        inc bl
        mov al,[si]  ; may be rejected
        jmp next

odd :   inc bh
        mov ah,[si]   ; may be rejected
        jmp next

next : inc si
       loop back

       mov ah,4ch  
       int 21h

code ends
        end start




;// To assemble and execute ===>>
; tasm evenodd.asm     // to assemble 
; tlink evenodd       // to link with assembler and microp
; td evenodd         // This is to debug
