#include<stdio.h>
#include<conio.h>

int main(){
   clrscr();
   int a=3,b=5,c;

   asm{
      mov ax,a
      mov bx,b
      add ax,bx
      mov c,ax
   }
  printf("%d",c);
  getch();
return 0;
}