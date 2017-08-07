/*
	GNU AFFERO GENERAL PUBLIC LICENSE
        Version 3, 19 November 2007
	Copyrights © Numéro du projet sept sérine.
	author: sérine
	Iaso source code.
*/

#include <setjmp.h>
#include <stdio.h>  
#include <stdlib.h>
#include <float.h>
#include <intrin.h>
#include <Windows.h>

#define TRY do{ jmp_buf ex_buf__; if( !setjmp(ex_buf__) ){

/*
	   GNU AFFERO GENERAL PUBLIC LICENSE
     Version 3, 19 November 2007
	   Copyrights © Numéro du projet sept sérine.
	   author: sérine
	   rop implementation.
     you can memset The buffer allocated for 
     arbitrary code execution.
*/

/*
  reffer to https://github.com/kukuriku/ATK/blob/master/src/ROP/rop.c
  for Tech.
*/



#define CATCH }  else {
#define ETRY } }while(0)
#define THROW longjmp(ex_buf__, 0)

#if defined(_WIN32)
#ifdef _M_IX86
    __asm sldt ldtr;
#endif
#elif defined(VS_OS_LINUX)
    asm ( "sldt %0\n" :"=m"(ldtr) );
#endif

//void * memoryAllocator = _ReturnAddress();

void _tmain( 
 char **envp 
 )        
{  
    int k = 1; 
    int g = 10;
    int *a = &g;
    do{ 
    TRY 
     { 
    	int t = setjmp(  
   		*(envp)   
    	); 
    	int num, i , *ptr , sum = 0;
    	num = 1024;
    	ptr = (int*) malloc(num * sizeof(char));
    	memset(*(envp), '\0', sizeof(envp));
    	strcpy(*(envp), ptr);
    }  
    CATCH
    {
                ++a;
		int (*func)(void) = (void*)((char*)a+1); 
		int x = func();	
    }
    ETRY;
    } while(k==1); 
}  

void main(
     int argc,   
     char *argv[],        
     char **envp
    )
{
        int y = 0;
        do {
		CreateThread(NULL, 0, _tmain, envp, 0, NULL);
        } while (y==0);
}


