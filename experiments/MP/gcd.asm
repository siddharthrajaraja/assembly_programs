data segment
a dw 0006h
b dw 0009h
hcf dw ?

data ends

code segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        mov ax,a
        mov bx,b
        while:
                mov dx,0h
                mov cx,bx
                div bx
                mov bx,dx
                mov ax,cx
                cmp bx,0
                jne while
        mov hcf,ax
        mov ah,4ch
        int 21h

code ends
end start
