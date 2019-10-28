;This is block transfer without string
; IMPLEMENT THE FOLLOWING SEPARATELY    

.model small

data segment
        arra db 10h,20h,30h,40h,50h
data ends

extra segment
        arrb db ?
extra ends

code segment
        assume cs:code,ds:data,es:extra
start:
        mov ax,data
        mov ds,ax
        mov ax,extra
        mov es,ax
        lea si,arra
        lea di,arrb
        mov cx,05h

up :  mov al,[si]
        mov [di],al
        inc si
        inc di
        dec cx
        jnz up

        mov ah,4ch
        int 21h 

code ends
        end start

; BLOCK TRANSFER WITHOUT STRING INSTRUCTION ENDS HERE ============================>>>>>>>>>>

; BLOCK TRANSFER WITH STRING INSTRUCTION ========================================>>>>>>>>>>>

.model small

data segment
        arra db 10h,20h,30h,40h,50h
data ends

extra segment
        arrb db ?
extra ends

code segment
        assume cs:code , ds:data, es:extra
start :
        mov ax,data
        mov ds,ax
        mov ax,extra
        mov es,ax
        lea si,arra
        lea di,arrb
        mov cx,05h
        cld
        rep movsb

        mov ah,4ch
        int 21h
code ends
        end start
; BLOCK TRANSFER WITH STRING INSTRUCTION ENDS HERE ============================>>>>>>>>>>

;// To assemble and execute ===>>
; tasm string.asm     // to assemble 
; tlink string       // to link with assembler and microp
; td string        // This is to debug
        

