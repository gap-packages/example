#############################################################################
####
##
#W  files.gd                   Example Package                  Werner Nickel
##
##  Declaration file for functions of the Example package.
##
#H  @(#)$Id$
##
#Y  Copyright (C) 1999,2001 University of St. Andrews, North Haugh,
#Y                          St. Andrews, Fife KY16 9SS, Scotland
##
Revision.("example/gap/files_gd") := 
    "@(#)$Id$";

#############################################################################
##
#F  EgSeparatedString( <str>, <c> ) . . . . . . . .  cut a string into pieces
##
DeclareGlobalFunction( "EgSeparatedString" );

#############################################################################
##
#F  ListDirectory([<dir>])  . . . . . . . . . . list the files in a directory
##
DeclareGlobalFunction( "ListDirectory" );

#############################################################################
##
#F  FindFile( <dir>, <file> ) . . . . . . . . find a file in a directory tree
##
DeclareGlobalFunction( "FindFile" );

#############################################################################
##
#F  LoadedPackages() . . . . . . . . . . . . which share packages are loaded?
##
DeclareGlobalFunction( "LoadedPackages" );

#############################################################################
##
#F  Which( <prg> )  . . . . . . . . . . . . which program would Exec execute?
##
DeclareGlobalFunction( "Which" );

#############################################################################
##
#F  WhereIsPkgProgram( <prg> ) . . . . the paths of any matching pkg programs
##
DeclareGlobalFunction( "WhereIsPkgProgram" );

#############################################################################
##
#F  HelloWorld() . . . . . . . . . . . . . . . . . . . . . . . . . . . guess!
##
DeclareGlobalFunction( "HelloWorld" );

#E  files.gd  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
