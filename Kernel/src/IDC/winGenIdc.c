
/*
   GNU AFFERO GENERAL PUBLIC LICENSE
   Version 3, 19 November 2007
   Copyrights © Numéro du projet sept sérine.
   author: sérine.
*/


/*
  
  On a x86 x64 machine,
  with vs stand alone 
  build tools.
  
  cl winGenIdc.c
  
  Or alternativlly (and better):
  
  cl /guard:cf winGenIdc.c

*/

#include <stdio.h>
#include <stdlib.h>

int main()
{
    int num, i, *ptr, sum = 0;
    int k = 1;
    num = 1024;
    do {
    ptr = (int*) malloc(num * sizeof(char));
    } while(k==1);

    return 0;
}

