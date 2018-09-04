#include <stdio.h>
void sort(int*,int);
void main(void)
{
  int x[10000];

  int n,counter,search;

  int flag=1;

  printf("Enter array size");

  scanf("%d",&n);

  if(n>10000)printf("erorr: max length is 10000");
    
  printf("Enter array elements:\n");

  for(counter=0;counter<n;counter++) scanf("%d",x+counter);

  sort(x,n);
  printf("sorted array:\n");
  for(counter=0;counter<n;counter++)
  {
     printf("%d\n",x[counter]);
  }

  printf("search:\n");
  scanf("%d",&search);
  flag=1;
  for(counter=0;counter<n;counter++)
  {
     if(search==x[counter])
      {
        printf("index=%d",counter);
        flag=0;
        break;
        
      }
  }
  if(flag) printf("not found");

}

void sort(int x[],int n)
{
  int flag=1;
  int counter;
  while(flag)
  {
    flag=0;
    for(counter=1;counter<n;counter++)
    {
       if(x[counter-1]>x[counter])
	{
		x[counter-1]=x[counter-1]+x[counter];
                x[counter]=x[counter-1]-x[counter];
                x[counter-1]=x[counter-1]-x[counter];
                flag=1;
	}
    }   
  }
}