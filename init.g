#############################################################################
##
#W    init.g               share package 'example'              Werner Nickel
##
##    @(#)$Id$
##

# announce the package version and test for the existence of the binary
DeclarePackage("example","1.0",
  function()
  local path,file;
    # test for existence of the compiled binary
    path:=DirectoriesPackagePrograms("example");
    file:=Filename(path,"hello");
    if file=fail then
      Info(InfoWarning,1,
        "Package ``example'': The program `hello' is not compiled");
    fi;
    return file<>fail;
  end);

# install the documentation
DeclarePackageAutoDocumentation( "example", "doc" );

# read the actual code.
ReadPkg( "example", "gap/files.g");
