#############################################################################
####
##
#W  files.gi                   Example Package                  Werner Nickel
##
##  Installation file for functions of the Example package.
##
#H  @(#)$Id$
##
#Y  Copyright (C) 1999,2001 University of St. Andrews, North Haugh,
#Y                          St. Andrews, Fife KY16 9SS, Scotland
##
Revision.("example/gap/files_gi") := 
    "@(#)$Id$";

#############################################################################
##
#F  EgSeparatedString( <str>, <c> ) . . . . . . . .  cut a string into pieces
##
InstallGlobalFunction( EgSeparatedString, function( str, c )
    local   pieces,  start,  i;

    pieces := [];
    start := 1;
    for i in [1..Length(str)] do
        if str[i] = c then
            if start <= i-1 then
                Add( pieces, str{[start..i-1]} );
            fi;
            start := i+1;
        fi;
    od;
    if start <= Length(str) then
        Add( pieces, str{[start..Length(str)]} );
    fi;
    
    return pieces;
end );

#############################################################################
##
#F  ListDirectory([<dir>])  . . . . . . . . . . list the files in a directory
##
InstallGlobalFunction( ListDirectory, function( arg )
    local   dir,  str,  ls,  out;

    if Length( arg ) = 0 then
        dir := "./";
    elif Length( arg ) <> 1 then
        return Error( "ListDirectory( [<dirname>] )" );
    else
        dir := arg[1];
    fi;

    str := "";

    if IsDirectoryPath( dir ) = true then
        dir := Directory( dir );
        ls  := Filename( DirectoriesSystemPrograms(), "ls" );
        out := OutputTextString( str, true );
        Process( dir, ls, InputTextNone(), out, [] );
        CloseStream( out );
        return EgSeparatedString( str, '\n' );
    else
        return Error( "Directory <dirname> does not exist" );
    fi;
end );

#############################################################################
##
#F  FindFile( <dir>, <file> ) . . . . . . . . find a file in a directory tree
##
InstallGlobalFunction( FindFile, function( dir, file )
    local   files,  try,  res;

    files := ListDirectory( dir );
    if file in files then
        return [ Concatenation( dir, "/", file ) ];
    fi;

    res := [];
    for try in files do
        try := Concatenation( dir, "/", try );
        if IsDirectoryPath( try ) then
            Append( res, FindFile( try, file ) );
        fi;
    od;

    return res;
end );


#############################################################################
##
#F  LoadedPackages() . . . . . . . . . . . . which share packages are loaded?
##
InstallGlobalFunction( LoadedPackages, function()

    return RecNames( LOADED_PACKAGES );
end );

#############################################################################
##
#F  Which( <prg> )  . . . . . . . . . . . . which program would Exec execute?
##
InstallGlobalFunction( Which, function( prg )

    if prg[1] <> '/' then
        prg := Filename( DirectoriesSystemPrograms(), prg );
    fi;
    
    if prg <> fail and IsExistingFile( prg ) and IsExecutableFile( prg ) then
        return prg;
    else
        return fail;
    fi;
end );

#############################################################################
##
#F  WhereIsPkgProgram( <prg> ) . . . . the paths of any matching pkg programs
##
InstallGlobalFunction( WhereIsPkgProgram, function( prg )
local paths;

    paths := List( LoadedPackages(), 
                   pkg -> Filename(DirectoriesPackagePrograms(pkg), prg) );

    return Filtered(paths, path -> path <> fail);   
end );

#############################################################################
##
#F  HelloWorld() . . . . . . . . . . . . . . . . . . . . . . . . . . . guess!
##
InstallGlobalFunction( HelloWorld, function()
local hello;

    hello := Filename(DirectoriesPackagePrograms("example"), "hello");

    Exec(hello);
end );

#E  files.gi  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
