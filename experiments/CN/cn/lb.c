#include<stdio.h>

int min(int a,int b){
	if(a<b){
		return a;
	}
	else{
		return b;
	}
}

void main(){
	int p[20],i,j,k,n,o,d,bs;
	int count=0,sent=1;
	printf("Enter the Bucket Size: ");
	scanf("%d",&bs);
	printf("\nEnter the output rate: ");
	scanf("%d",&o);
	printf("\nEnter the number of packets: ");
	scanf("%d",&n);
	printf("\n");
	for(i=1;i<=n;i++)
	{
		printf("Enter Packet %d: ",i);
		scanf("%d",&p[i]);
	}
	
	printf("Second\tReceived\tSent\tDrop\tRemaining\n");
	
	for(i=1;i<=n;i++){
		count=count+p[i];
		if(count>bs){
			d=count-bs;
			count=bs;
		}
		else{
			d=0;
		}
		sent=min(count,o);
		count=count-sent;
		printf("%d\t%d\t%d\t%d\t%d\n",i,p[i],sent,d,count);
	}
	while(count!=0){
		d=0;
		sent=min(count,o);
		count=count-sent;
		printf("%d\t%d\t%d\t%d\t%d\n",i,p[i],sent,d,count);	
	}
}
