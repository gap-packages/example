#############################################################################
####
##
#W  banner.g                   Example Package                    Greg Gamble
##
#H  @(#)$Id$
##
#Y  Copyright (C) 1999,2001 University of St. Andrews, North Haugh,
#Y                          St. Andrews, Fife KY16 9SS, Scotland
##
Revision.("example/gap/banner_g") := 
    "@(#)$Id$";

EG_PKG_BANNER := ValueOption( "pkgbanner" );
if EG_PKG_BANNER = "short" then
  Info(InfoWarning, 1, 
       "Loading Example Package Version ", PACKAGES_VERSIONS.example);
elif EG_PKG_BANNER <> "none" then
  Print("\n");
  Print("           The Example package\n");
  Print("               Version ", PACKAGES_VERSIONS.example, "\n");
  Print("            by Werner Nickel \n");
  Print("\n");
  Print("     For help, type: ?Example package\n");
  Print("\n");
fi;
Unbind(EG_PKG_BANNER);

############################################################################
##
#E
##
