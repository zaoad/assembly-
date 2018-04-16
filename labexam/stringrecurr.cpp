#include<bits/stdc++.h>
using namespace std;
string s;
int stringrecur(int ind ,int r ,int g, int b ,int y)
{
    if(!s[ind])
    {
        if(r==g)
        {
            if(b==y)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }
        else
        {
            return 0;
        }
    }
    int d=s[ind];
    if(d==82)
        r++;
    if(d==71)
        g++;
    if(d==66)
        b++;
    if(d==89)
        y++;
    return stringrecur(ind+1,r,g,b,y);
}
int main()
{
    cin>>s;
    int ans=stringrecur(0,0,0,0,0);
    if(ans==1)
    {
        printf("balanced\n");
    }
    if(ans==0)
    {
        printf("notbalanced\n");
    }
}
