
Revision.("example/gap/files_g") := "@(#)$Id$";

#############################################################################
##
#F  SeparatedString . . . . . . . . . . . . . . . .  cut a string into pieces
## Andrew adding a comment to change the CRC
##
SeparatedString := function( str, c )
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
end;

#############################################################################
##
#F  ListDirectory . . . . . . . . . . . . . . . list the files in a directory
##
ListDirectory := function( arg )
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
        return SeparatedString( str, '\n' );
    else
        return Error( "Directory <dirname> does not exist" );
    fi;
end;

#############################################################################
##
#F  FindFile  . . . . . . . . . . . . . . . . find a file in a directory tree
##
FindFile := function( dir, file )
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
end;


#############################################################################
##
#F  LoadedSharePackages . . . . . . . . . .  which share packages are loaded?
##
LoadedSharePackages := function()

    return RecNames( LOADED_PACKAGES );
end;

#############################################################################
##
#F  Which . . . . . . . . . . . . . . . . . which program would Exec execute?
##
Which := function( prg )

    if prg[1] <> '/' then
        prg := Filename( DirectoriesSystemPrograms(), prg );
    fi;
    
    if prg <> fail and IsExistingFile( prg ) and IsExecutableFile( prg ) then
        return prg;
    else
        return fail;
    fi;
end;
