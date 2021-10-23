#include <iostream>
using namespace std;

int main (void)
{
    int i;
    int *pi;

    i=8;

    cout << i << endl;
    cout << &i << endl;

    pi = &i;

    cout << pi << endl;
    cout << &pi << endl;
    cout << *pi << endl;
}
