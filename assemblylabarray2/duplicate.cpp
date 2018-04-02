#include<bits/stdc++.h>
using namespace std;
int main()
{
    int arr[100],i,j,cnt,temp=0,a;
    while(1)
    {
        if(temp>=10)
            break;
        cin>>a;
        for(i=0;i<temp;i++)
        {
            if(arr[i]==a)
            {
                printf("number already exist input %d more unique number\n",10-temp);
                break;
            }

        }
        if(i==temp)
        {
            arr[temp]=a;
            temp=temp+1;
        }
    }
    for(i=0;i<temp;i++)
    {
        cout<<arr[i]<<" "<<endl;
    }


}
