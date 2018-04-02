#include<bits/stdc++.h>
using namespace std;
int main()
{
    int n,i,j;
    cin>>n;
    for(i=0;i<n-1;i++)
    {
        for(j=n-i-1;j>0;j--)
        {
            printf(" ");
        }
        if(i==0)
            printf("*\n");
        else
        {
            printf("*");
            for(j=0;j<n-i-1;j++)
            {
                printf(" ");
            }
            printf("*\n");
        }
    }
    for(i=0;i<n;i++)
        printf("*");
    for(i=0;i<n-1;i++)
        printf("*");
}
