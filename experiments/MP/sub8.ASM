data segment
a db 02h
b db 09h
data ends

code segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        mov ax,0h
        mov al,a
        mov bl,b
        sub bl,al
        mov ah,4ch
        int 21h


code ends
end start
