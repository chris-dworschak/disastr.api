
## Test environment
* local Fedora Linux Mint 20 Cinnamon 64-bit OS, R version 4.0.3
* win-builder
* R-hub builder: Windows Server 2008 R2 SP1, 32/64 bit; Ubuntu Linux 16.04 LTS, R-release, GCC; Fedora Linux, R-devel, clang, gfortran
* Travis CI



## R CMD check results

Possibly mis-spelled words in DESCRIPTION:
   OCHA (13:152)
   ReliefWeb (13:158, 13:310)

    EXPLANATION: These are no misspellings. 
    OCHA is the common abbreviation for the United Nations Office for the Coordination of Humanitarian Affairs.
    ReliefWeb is the name of OCHA's online service.


Checking for future file timestamps ... NOTE
  unable to verify current time

    EXPLANATION: Flexible time zone on local OS.

    
Found the following (possibly) invalid URLs:
    URL: https://reliefweb.int/disasters/ (moved to https://reliefweb.int/disasters)
      From: DESCRIPTION
            man/disastr.api.Rd
      Status: 200
      Message: OK
  Maintainer: 'Christoph Dworschak <c.dworschak@essex.ac.uk>'

    EXPLANATION: Link is valid. R submission guidelines demand trailing slashes.

0 errors ✓ | 0 warnings ✓ | 2 notes x




## R-hub builder results
There were no ERRORs or WARNINGs. 

There were 1 NOTE:

Checking for future file timestamps ... NOTE
  unable to verify current time

    EXPLANATION: Flexible time zone on local OS.


Checking CRAN incoming feasibility ... NOTE
Maintainer: ‘Christoph Dworschak <c.dworschak@essex.ac.uk>’

New submission

    EXPLANATION: This is a new submission.


## Downstream dependencies
There are currently no downstream dependencies for this package.

