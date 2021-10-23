#include <iostream>
using namespace std;

int main (void)
{
    int x;
    srand(time(0));

    for (x=0; x<10; x++)
    {
    cout << 1+(rand()%6)<<endl;
    }
}
