#############################################################################
##
#W    init.g                 The Example package                Werner Nickel
#W                                                                Greg Gamble
##
##    @(#)$Id$
##


##  for use with GAP <=4.3 the DeclarePackage and
##  DeclarePackageAutoDocumentation commands are still needed.
##  
##  Starting from GAP 4.4 and having a PackageInfo.g file available,
##  these commands are ignored. They are substituted by the entries
##  .PackageName, .Version, .PackageDoc, .Dependencies and .AvailabilityTest
##  specified in the PackageInfo.g file.
##  
##  In the next package update after GAP 4.4 is released, substitute all
##  commands with a "Pkg" in their name with commands having a "Package"
##  instead (for example, change the "ReadPkg" commands below to
##  "ReadPackage").

# announce the package version and test for the existence of the binary
DeclarePackage("example","1.5",
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
DeclarePackageAutoDocumentation( "Example", "doc", "Example",
                                 "Example of a GAP Package");

##  We disable the explicit printing of a banner if the GAP version is at least
##  4.4. Note that all global variables like VERSION, BANNER, QUIET are
##  obsolete with 4.4, instead there is GAPInfo. A hack as here for printing
##  the banner is no longer necessary.
if not CompareVersionNumbers(VERSION, "4.4") then
  if BANNER and not QUIET then
    ReadPkg("example", "gap/banner.g");
  fi;
fi;

##  change after 4.4  to ReadPackage(..)
# read the function declarations
ReadPkg("example/gap/files.gd");

