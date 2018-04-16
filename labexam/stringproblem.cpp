#include<bits/stdc++.h>
using namespace std;
int main()
{
    int i,l;
    string s;
    printf("%d %d %d %d",'R','G','B','Y');
    cin>>s;
    l=s.size();
    int r=0,b=0,g=0,y=0;
    for(i=0;i<l;i++)
    {
        if(s[i]=='R')
            r++;
        if(s[i]=='B')
            b++;
        if(s[i]=='Y')
            y++;
        if(s[i]=='G')
            g++;
    }
    cout<<r<<" "<<g<<" "<<b<<" "<<y<<endl;
    if(r==g)
    {
        if(b==y)
        {
            printf("balanced\n");
        }
        else
        {
            printf("not balanced\n");
        }
    }
    else
    {
        printf("not balanced\n");
    }


}
