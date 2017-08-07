
/*
	GNU AFFERO GENERAL PUBLIC LICENSE
        Version 3, 19 November 2007
	Copyrights © Numéro du projet sept sérine.
	author: sérine
	rop implementation.
        you can memset The buffer allocated for 
        arbitrary code execution.
*/

//
// compilation maybe a bit difficult,
// on a x86 x64 bit machine with
// vs stand alone cl linker,
// run cl /guard:cf rop.c 
// good luck ;)
//

#include <setjmp.h>
#include <stdio.h>  
#include <stdlib.h>
#include <float.h>
#include <intrin.h>
#include <Windows.h>

/*
   	we implement The Rop simplly
   	by setting the rigth (wrong) jump,
   	for Our simple procedure.
*/

#define TRY do{ jmp_buf ex_buf__; if( !setjmp(ex_buf__) ){ // try to execute if your not instructed otherwise.
#define CATCH }  else { // if you fail return to the old setjmp.
#define ETRY } }while(0) 
//#define THROW longjmp(ex_buf__, 1)  // !!! we do not implement the throw method!

/*
	fix linking issues.
*/

#if defined(_WIN32)
#ifdef _M_IX86
    __asm sldt ldtr;
#endif
#elif defined(VS_OS_LINUX)
    asm ( "sldt %0\n" :"=m"(ldtr) );
#endif

//void * memoryAllocator = _ReturnAddress(); needed at certain opSys.

void _tmain( 
 	char **envp 
 	)        
{  
    int k = 1; // for the endless loop.
    do{ 
    	TRY 
     		{ 
		
			/*
			 	we implement Our Null pointer reffarance,
				by an indirect way.
			 	every Thread get's The envp, a pointer to
			 	The environment variables.
			 	we got an array of about 30 memory address's
			 	so we are going to get an access violation trying to 
				read array-index-out-of-range,
				and perhaps evan better, an access violation,
				trying to manufacture an integer pointer to 
				a null reference.
			*/
			
			// this line gets skiped at first call.
			++*envp;
			// manufacture a pointer.
    	/*(I)*/		int t = setjmp(*(envp));                      // #!!!!
			// allocate 3 integers and one pointer.
    			int num, i , *ptr , sum = 0;
			// 0x400 bytes of null.
    			num = 1024;
			// call a pointer to the allocated size,
			// but allocate it into one byte (char),
			// so youll overrun any memory address above that size.
    			ptr = (int*) malloc(num * sizeof(char));
			// set envp pointer to the entire block allocated.
    			memset(*(envp), '\0', sizeof(envp));
			// copy ptr into envp pointer to jmp later to null.
    			strcpy(*(envp), ptr);
    		}  
    	CATCH
    		{
			// when we get a violation at (I) we are set to jmp to
			// The exception block.
			// but assume that dep is on, we will get an access violation,
			// Trying to call KUSER_SHARED_MEMORY,
			// not being randomized by aslr.
		
			int (*func)(void) = (void*)((char*)0x7ffe0000); // root KUSER_SHARED_MEMORY addr...
	    		int x = func();
      			int (*func1)(void) = (void*)((char*)0x7ffa6b720000); 
	    		int x1 = func1();
	    		int (*func2)(void) = (void*)((char*)0x7ffa6b660000);
      			int x2 = func2();
	    		int (*func2)(void) = (void*)((char*)0x20ed7a70000);
	    		int x3 = func3();
	    		int (*func3)(void) = (void*)((char*)0x20ed5c60000);
	    		int x4 = func4();
	    		int (*func5)(void) = (void*)((char*)0x20ed5560000);
	    		int x5 = func5();
		
			// when getting The access violation we will return 
			// to the setjmp given, after a few round will jmp to a null
			// pointer or better make the system jump to that memory region
	    			
    		}
    	ETRY;
    } while(k==1); // endless loop
}  

void main(
     int argc,   
     char *argv[],        
     char **envp
    )
{
        int y = 0;
        do {
		          CreateThread(NULL, 0, _tmain, envp, 0, NULL); // fireup the The ThreadPool.
        } while (y==0);
}



