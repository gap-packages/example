Version 4.4.1: 2025-06-20
* Janitorial changes

Version 4.4.0: 2024-11-20
* Add `Extensions` field which was introduced in GAP 4.13
* Mark `Status`, `CommunicatedBy`, `AcceptDate` as obsolete starting
  with GAP 4.13.0
* Mark `License` field as required
* Mark `AvailabilityTest` as optional since GAP 4.14
* Remove references to long obsolete fields `TextFiles`, `BinaryFiles`,
  `TextBinaryFilesPatterns`
* Remove `OtherPackagesLoadedInAdvance` which should not be used and
  will be deprecated in future GAP versions
* Update CI configuration

Version 4.3.4: 2023-02-25
* Update Olexandr's homepage URL

Version 4.3.3: 2022-01-03
* Enhance the `configure` script to accept `--with-gaproot=PATH`

Version 4.3.2: 2022/08/01
* Avoid using InstallValue

Version 4.3.1: 2022/04/29
* Updates of contact details and license information

Version 4.3.0: 2021/02/11
* Require GAP 4.10
* Move from Travis CI to GitHub Actions for automated tests
* Reformat code and use `GVAR_FUNC` in the "Hello World!" example
* Change #include "src/compiled.h" to just #include "compiled.h"
  to allow future GAP versions to simplify their GAP_CPPFLAGS,
  which currently need to contain `-I$(abs_srcdir)` just to
  support this old use case. Also, this in turn makes it easier
  to have package compatible with future installed version of GAP,
  which have headers in `PREFIX/include/gap/`.
 
Version 4.2.1: 2019/12/09
* PackageInfo.g: document that it is permitted for both IsAuthor and
  IsMaintainer to be false to allow giving credit to contributors who
  are neither authors nor maintainers.
* PackageInfo.g: comment out BannerString and recommend to use a
  default banner produced from the information in the PackageInfo.g file

Version 4.2.0: 2019/07/17
* PackageInfo.g: add License field
* Document optional BannerFunction component, introduced in GAP 4.10
  (see https://github.com/gap-system/gap/pull/2598)
* Update setup for Travis CI integration to use scripts from a central
  repository. This allows us to apply fixes and improvements to these
  scripts for all packages, and also removes some clutter from package
  repositories.
* Update setup for ReleaseTools, in particular add the .release script
* Use AutoDoc package to generate the manual
* add CFLAGS and LDFLAGS, and do not use cc compiler by default

Version 4.1.1: 2018/07/18
* Update the description of the TestFile component in the PackageInfo.g file
* The method for Recipe required a fix because RecNames is not guaranteed to
  return a list of component names in a particular order
* Removed some unnecessary commands from test files

Version 4.1.0: 2018/04/26
* Demonstrate how to set up Travis CI and CodeCov
* Don't mention PreloadFile in PackageInfo.g
* Use C99 init for StructInitInfo

Version 4.0.0: 2017/12/10
* Preparations for the release of GAP 4.9: appendix to the Example package
  manual with the guidance for package authors moved from this package to
  the GAP Reference manual
* Switch to TestDirectory and demonstration how to use multiple test files
* Updated instructions for AbstractHTML in the PackageInfo.g file

Version 3.5.1: 2017/02/04
* README file renamed to README.md with text converted to markdown

Version 3.5.0: 2017/02/02
* Moving the package website to GitHub
* Removed any mentions of .zoo format
* Replaced obsolete ReadTest by Test
* Added PackageInfo.g components for repository, issue tracker and support email.

Version 3.4.5: 2014/10/28
* Remark on repackaging package archives

Version 3.4.4: 2013/10/30
* Corrected wrong name of a function reported by Chris Wensley

Version 3.4.3: 2013/03/27
* Added a suggestion about a naming scheme for package archives
* Updated C syntax to avoid an error while compiling external binary with clang

Version 3.4.2: 2012/06/02
* Mentioned that OnlyNeeded option for LoadPackage is used only for testing
  and debugging. Updated the description of 'make testpackagesload' target
  which now does not use OnlyNeeded option in calls to LoadAllPackages.

Version 3.4.1: 2012/05/31
* Additionally emphasized importance of not having two different archives 
  with the same package version number
* Improved description of `AvailabilityTest' function from Example's 
  package PackageInfo.g file

Version 3.4.0: 2012/04/18
* Removed PackageDoc.Archive from PackageInfo.g
* Fixed cross-reference to "GAP Root Directories"
* Extended description of 'make testpackagesload' test

Version 3.3.3: 2012/02/21
* Fixed a typo in section "Testing a GAP package with the GAP standard 
  test suite"
  
Version 3.3.2: 2011/11/23
* Improved the description of .ArchiveURLSubset component, which also 
  allows directories, in the PackageInfo.g file

Version 3.3.1: 2011/11/22
* Clarified that the standard test file of the package has to be specified
  in the .TestFile component of the PackageInfo.g file as suggested by Max
  Horn.
* Updated guidelines regarding the name of the directory of the package.

Version 3.3.0: 2011/11/11
* Implemented a series of suggestions by Chris Wensley
  (improved explanations, fixed typos, extended index)

Version 3.2.0: 2011/10/28
* If a package distribution contains an empty directory, advised to put 
  README there.
* Added ValidatePackageInfo and ShowPackageVariables to the index
* Put a proper reference to the document "The gapmacro.tex Manual Format" 
  (the file gap4r5/doc/gapmacrodoc.pdf included in the tools archive 
  described in Section "Writing Documentation and Tools Needed").
  
Version 3.1.1: 2011/09/20
* Documented classifyfiles.py script as a part of the tools archive.

Version 3.1: 2011/09/15

Appendix which was renamed from "Hints..." to "Guidelines..." and 
incorporated many advices to package authors and feedback on the 
previous announcements of the first GAP 4.5 beta release and its 
subsequent update. It has new sections about package testing, 
licensing, upgrading the package to work with GAP 4.5 and, finally, 
two checklists (for package in general and for its upgrade to GAP 4.5). 
The package is now distributed under GPL 2 or higher.

Other changes include:
* Better Makefile.in and configure files provided by Max Horn
* Using CopyHTMLStyleFiles("doc") instead of keeping own style files
* Removing revision entries from files
* Removing old gapmacro.tex-based manual from version control
* Using 'lib' directory for the library, not 'gap'
* Documenting TextBinaryFilesPatterns as an alternative to specify 
  text/binary files
* Demonstrating how to create a test file
* Demonstrating how to distribute parts of the manual across source 
  code files
* Demonstrating MathJax support in the HTML version of the manual.

Version 3.0: 2011/03/15
* First attempt of upgrading the package for GAP 4.5, released as 
  a part of GAP 4.5.1 (first beta release). Appendix is merged with
  the former "Writing a GAP package" chapter from the reference 
  manual in order to consolidate most of the guidelines for writing 
  a GAP package in a single location. 

Version 2.0: 2006/01/31
  o PackageInfo.g:
    - added field `PreloadFile TB
    - comment added re `TestFile' field TB
  o CHANGES,VERSION:
    - added GG
  o pre-GAP 4.4 compatibility features removed:
    - init.g,read.g:
      . all but `ReadPkg' commands removed GG
      . `ReadPkg' changed to `ReadPackage' GG
    - gap/banner.g:
      . removed (PackageInfo.g takes care of this) GG
    - gap/files.gi:
      . `LOADED_PACKAGES' changed to `GAPInfo.PackagesLoaded' GG
  o README,doc/*.tex:
    - updated for changes in 2.0 and GAP 4.4 GG
  o make_zoo:
    - reads the version from VERSION GG
    - do not exclude .toc and .lab files GG
Version 1.5: 2003/06/18
  Updated for new package loading mechanism to GAP 4.3 level
  o PkgInfo.g:
    - changed `AutoLoad' field to `Autoload' TB 
    - added `BannerString' field TB
    - renamed PackageInfo.g TB
  o PackageInfo.g:
    - added comments re new package loading scheme FL
    - updated URLs and BannerString GG
  o make_zoo:
    - includes `PackageInfo.g' rather than `PkgInfo.g' AH
    - .ps files are now marked as text GG
    - modularised packing routine so can create a whole 
      package archive or just a doc archive GG
  o doc/*.tex:
    - updated for the new package loading mechanism
Version 1.3: 2003/01/13
  Package now at GG's Aachen website
  o PkgInfo.g:
    - added preliminary version TB
    - updated GG
  o make_zoo:
    - replaced -path usage by equivalent -name expression (non-GNU
      versions of find don't have the -path option) GG
Version 1.2: 2002/02/12
  o Makefile.in:
    - `make clean' target added GG
  o make_zoo:
    - added based on FL's packpack GG 
  o doc/{install.tex,hints.tex}:
    - split into chapters to enable production of HTML manual GG
    - added an Appendix to the manual to give hints on how to produce
      a polished package GG
Version 1.1: 2001/10/07
  Deleted `share'. GG
  o gap/files.g:
    - split into `gap/files.gd' and `gap/files.gi' GG
  o gap/files.g[di]:
    - added `HelloWorld' and `WhereIsPkgProgram' GG
  o gap/banner.g,doc/{manual.mst,make_doc}:
    - added GG
Version 1.0: 1998/08/27
  First release. AH, WN
  o README:
    - added AH
  o init.g,read.g,Makefile.in,configure,src/hello.c,gap/files.g:
    - autoloads documentation but does not autoload package AH
    - `DeclarePackage' tests for the compiled binary AH
  o doc/{manual.tex,example.tex}:
    - added WN
