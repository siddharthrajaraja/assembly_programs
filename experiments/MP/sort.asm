; THIS IS ASCENDING SORTING PROGRAM

.model small
data segment
        arr db 04h,05h,03h,02h,01h
data ends
code segment
       assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax
        mov ch,05h   ; outer loop count
outerloop:
        mov cl,05h   ; inner loop count
        lea si,arr

innerloop:
        mov al,[si]
        mov ah,[si+1]
        cmp al,ah    ; (al-ah>=0 skipping else exchange)
        jc skip      ; (for descending use jnc)
        jz skip      ; (for descending use jnz)

exchange :
        mov [si],ah
        mov [si+1],al

skip :  inc si
        dec cl
        jnz innerloop

        dec ch
        jnz outerloop

        mov ah,09h
        lea dx,arr
        int 21h
        mov ah,4ch
        int 21h


code ends
        end start
                 
