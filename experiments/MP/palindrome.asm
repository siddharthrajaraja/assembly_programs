; This program is to check a string is palindrome or not!! ====================================>


.model small
data segment
        st1 db "nitiN"   ; change string
data ends
extra segment
        st2 db 05h dup(?)  ; change size
extra ends

code segment
        assume cs:code , ds:data,es:extra
start:
        mov ax,data
        mov ds,ax
        mov ax,extra
        mov es,ax

        lea si,st1
        lea di,st2+04h   ; remember index(04)=length-1  
        mov cx,0005h

back:
        cld
        lodsb
        std
        stosb
        loop back ; this is logic to reverse a string

        lea si,st1
        lea di,st2
        mov cx,0005h

        repe cmpsb
        jnz skip

        mov bl,01h   ; yes palindrome
        jmp next
skip:   mov bl,00h   ; no not palindrome
next:
        mov ah,4ch
        int 21h
code ends
        end start
