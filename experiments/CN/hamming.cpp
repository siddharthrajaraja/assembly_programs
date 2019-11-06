#include<conio.h>
//parity bits
int p1[]={1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31};  
int p2[]={2,3,6,7,10,11,14,15,18,19,22,23,26,27,30,31};
int p4[]={4,5,6,7,12,13,14,15,20,21,22,23,28,29,30,31};
int p8[]={8,9,10,11,12,13,14,15,24,25,26,27,28,29,30,31};
int p16[]={16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};
int a[50],b[30],c[50];  //some arrays
int n,pb1,pb2,pb4,pb8,pb16;

void generate();
int check();
void correct();

void main(){
    clrscr();
    int i ;
    printf("\nEnter the number of bits in the message = ");

    scanf("%d" , &n);
    for(i = 1 ; i <= n ; i++)
        b[i] = getche()-int('0');
    getch();
    //setting up count for latter loops
    if(n == 1)
        n+=2;   
    else if(n<5)
        n+=3  //if for example pure data is 1011(4bits) then number of transmitted bits in final will be of 7bits get it?
    else if(n<12)
        n+=4;
    else
        n+=5;
    generate();
    printf("\n\nThe data to be transmitted is = ");
    for(i = 1 ; i <= n ; i++)
        printf("%d" , &a[i]);

    printf("\nEnter the received data = ");
    for (i = 1 ; i <= n ; i++)
        c[i] = getche()-int('0');
    getch();

    i = check();
    if(i==0)
        printf("\n\nThe data is transmitted correctly");
    else{
        printf("\n\nThere is error in transmission");
        correct();
        printf("\n\nThe corrected data is = ");
        for(i = 1 ; i <= n ; i++)
            printf("%d",c[i]);
    }      
    getch();
}
void generate(){
    int i,j=1,k=0,l=0,m=0,p=0;
    for(i=1;i<50;i++)
    a[i]=0;
    for(i=1;i<=n;i++){
    if(i!=1 && i!=2 && i!=4 && i!=8 && i!=16)
        a[i]=b[j++];
    }

    pb1=pb2=pb4=pb8=pb16=0;   //initially set them to zero
    j=0;

    for(i=1;i<=n;i++){
        if(p1[j]==i){
            pb1^=a[i];
            j++;
        }

        if(p2[k]==i){
            pb2^=a[i];
            k++;
        }

        if(p4[l]==i){
            pb4^=a[i];
            l++;
        }

        if(p8[m]==i){
            pb8^=a[i];
            m++;
        }

        if(p16[p]==i){
            pb16^=a[i];
            p++;
        }
    }

    a[1]=pb1;
    a[2]=pb2;
    a[4]=pb4;
    a[8]=pb8;
    a[16]=pb16;

}
int check(){
    pb1=pb2=pb4=pb8=pb16=0;
    int j=0,k=0,l=0,m=0,p=0,i;

    for(i=1;i<=n;i++){
        if(p1[j]==i)
        {
            pb1^=c[i];
            j++;
        }

        if(p2[k]==i)
        {
            pb2^=c[i];
            k++;
        }

        if(p4[l]==i)
        {
            pb4^=c[i];
            l++;
        }

        if(p8[m]==i)
        {
            pb8^=c[i];
            m++;
        }

        if(p16[p]==i)
        {
            pb16^=c[i];
            p++;
        }
    }

    int sum=pb1+pb2+pb4+pb8+pb16;

    return sum;
}
void correct(){
    int err=pb16*16+pb8*8+pb4*4+pb2*2+pb1*1;
    printf("\n\nError in bit  = %d " , err);
    
    if(c[err]==0) 
        c[err]=1;
    else 
        c[err]=0;
}
