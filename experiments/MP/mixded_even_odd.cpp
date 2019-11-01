#include<stdio.h>
#include<conio.h>

void get(int n,int A[]){
   int i;
   for(i=0;i<n;i++)scanf("%d",&A[i]);
}
void set(int n,int A[]){
	int i;

	for(i=0;i<n;i++){
	  printf("%d\t",A[i]);
	}
}

int main(){
 clrscr();
 int arr[10]; printf("Enter size of array");
 int n,i,val,even_count=0,odd_count=0;scanf("%d",&n);get(n,arr);
 int even[10],odd[10];

 for(i=0;i<n;i++){
	    int flag=0;
	    val=arr[i];


	    asm{
		mov ax,val
		ror ax,01h
		jc car
		jmp next
		}
	    car:
	    asm{ mov flag,01h
	    }
	    next :asm{
	    }

	if(flag==0)even[even_count++]=val;
	if(flag==1) odd[odd_count++]=val;

 }
 printf("Even array : ");set(even_count,even);
 printf("\n");
 printf("Odd array: ");set(odd_count,odd);


 getch();
 return 0;
}
