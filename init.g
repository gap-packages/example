#############################################################################
##
#W    init.g                 The Example package                Werner Nickel
#W                                                                Greg Gamble
##
##    @(#)$Id$
##

# announce the package version and test for the existence of the binary
DeclarePackage("example","1.2",
  function()
  local path,file;
    # test for existence of the compiled binary
    path:=DirectoriesPackagePrograms("example");
    file:=Filename(path,"hello");
    if file=fail then
      Info(InfoWarning,1,
        "Package ``example'': The program `hello' is not compiled");
      Info(InfoWarning,1,
        "`HelloWorld()' is thus unavailable");
      Info(InfoWarning,1,
        "See the installation instructions; ",
        "type: ?Installing the Example package");
    fi;
    # if the hello binary was vital to the package we would return
    # the following ...
    #return file<>fail;
    # since the hello binary is not vital we return ...
    return true;
  end);

# install the documentation
DeclarePackageAutoDocumentation( "example", "doc" );

if BANNER and not QUIET then
  ReadPkg("example", "gap/banner.g");
fi;
# read the function declarations
ReadPkg("example/gap/files.gd");

