#############################################################################
##
#W    init.g               share package 'example'              Werner Nickel
##
##    @(#)$Id$
##

# announce the package version
DeclarePackage("example","1.0",ReturnTrue);

# install the documentation
DeclarePackageDocumentation( "example", "doc" );

# read the actual code.
ReadPkg( "example", "gap/files.g");
