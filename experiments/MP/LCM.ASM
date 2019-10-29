data segment
a dw 0004h
b dw 0008h
lcm dw ?
hcf dw ?
data ends

code segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        mov ax,a
        mov bx,b
        while: mov dx,0h
               mov cx,bx
               div bx
               mov bx,dx
               mov ax,cx
               cmp bx,0
               jne while
                
        mov hcf,ax
        mov cx,ax
        mov ax,a
        mov bx,b
        mul bx
        div cx
        mov ah,4ch
        int 21h

code ends
end start
