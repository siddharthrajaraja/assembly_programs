;adds in hexadecimal and displays as ascii equivalent                                                                                                                                                                                                                                                        data segment
a db 02h
b db 03h
c dw ?

data ends

code segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        mov ax,0h
        mov dl,a
        mov bl,b
        add dl,bl
      add dl,48
     ; mov c,dx
        ;output on screen
        mov ah,2

        int 21h

        ;exit msg
        mov ah,4ch
        int 21h
        code ends
end start

