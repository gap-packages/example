/****************************************************************************

This is a prototype of a HELLO_WORLD example implemented as a kernel module.

An example of its compilation:

dyn-194-155:src alexk$ ~/gap4r4/bin/i686-apple-darwin10.4.0-gcc/gac -d hellod.c 
gcc -fPIC -o /var/folders/NB/NBxYeZaRHxGpf4haob7SqE+++TQ/-Tmp-//gac36146/36146_hellod.o -I/Users/alexk/gap4r4/bin/i686-apple-darwin10.4.0-gcc/../.. -I/Users/alexk/gap4r4/bin/i686-apple-darwin10.4.0-gcc -DCONFIG_H -c hellod.c
ld -bundle -bundle_loader /Users/alexk/gap4r4/bin/i686-apple-darwin10.4.0-gcc/gap /usr/lib/bundle1.o -lc -lm -o hellod.so /var/folders/NB/NBxYeZaRHxGpf4haob7SqE+++TQ/-Tmp-//gac36146/36146_hellod.o
rm -f /var/folders/NB/NBxYeZaRHxGpf4haob7SqE+++TQ/-Tmp-//gac36146/36146_hellod.o

It works as follows:

gap> LoadDynamicModule("hellod.so");
gap> HELLO_WORLD();
Hello World!
gap> 

It may be included in one of the future versions of the Example package.
However, this will require documenting more rules of kernel programming.

****************************************************************************/

#include <stdio.h>

#include "gap_all.h"

static Obj FuncHELLO_WORLD(Obj self)
{
    Pr("Hello World!\n", 0, 0);
    return 0;
}

static StructGVarFunc mystruct [] = {

    GVAR_FUNC(HELLO_WORLD, 0, ""),

};


/**************************************************************************

*F  InitKernel( <module> )  . . . . . . . . initialise kernel data structures
*/
static Int InitKernel (
    StructInitInfo *    module )
{

    /* init filters and functions                                          */
    InitHdlrFuncsFromTable( GVarFuncs );

    /* return success                                                      */
    return 0;
}


/****************************************************************************
**
*F  InitLibrary( <module> ) . . . . . . .  initialise library data structures
*/
static Int InitLibrary (
    StructInitInfo *    module )
{
  /*    UInt            gvar;
	Obj             tmp; */

    /* init filters and functions                                          */
    /* printf("Init El..Small\n");fflush(stdout); */
    InitGVarFuncsFromTable( GVarFuncs );

    /* return success                                                      */
    return 0;
}


/****************************************************************************
**
*F  InitInfopl()  . . . . . . . . . . . . . . . . . table of init functions
*/
/* <name> returns the description of this module */
static StructInitInfo module = {
    .type = MODULE_DYNAMIC,
    .name = "hello",
    .initKernel = InitKernel,
    .initLibrary = InitLibrary,
};

StructInitInfo * Init__Dynamic (void)
{
    return &module;
}
