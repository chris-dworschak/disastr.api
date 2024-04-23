
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Wrapper for the UN OCHA ReliefWeb Disaster Events API

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version-last-release/disastr.api)](https://CRAN.R-project.org/package=disastr.api/)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable/)
[![Travis build
status](https://travis-ci.com/chris-dworschak/disastr.api.svg?branch=master)](https://travis-ci.com/gitlab/chris-dworschak/disastr.api/)
[![License:
GPL-3](https://img.shields.io/badge/License-GPLv3-lightgrey.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![CRANlogs](http://cranlogs.r-pkg.org/badges/grand-total/disastr.api)](https://CRAN.R-project.org/package=disastr.api/)
<!-- badges: end -->

This package provides functionality to access and manage the application
programming interface (API) of the [United Nations Office for the
Coordination of Humanitarian Affairs’ (OCHA) ReliefWeb disaster
events](https://reliefweb.int/disasters). It requires a minimal number
of dependencies. The function `disastr.api()` makes it easy to retrieve
a user-defined sample of disaster events from ReliefWeb, enabling a
seamless integration of regular data updates into the research work
flow.

## Installation

You can install the released version of disastr.api from
[CRAN](https://CRAN.R-project.org/) with:

``` r
install.packages("disastr.api") # downloads and installs the package from CRAN
```

You can install the development version from
[GitLab](https://gitlab.com/chris-dworschak/) with:

``` r
remotes::install_gitlab("chris-dworschak/disastr.api") # downloads and installs the package from GitLab
```

## Example

Using `disastr.api` is straight forward. To download data on, for
example, the last 20 disaster events, you can supply:

``` r
library(disastr.api) # loads the package
#> 
#> The disastR.api package may be cited as:
#> Dworschak, Christoph. 2021. "Disastr.api: Wrapper for the UN OCHA
#> ReliefWeb Disaster Events API." R package. CRAN version 1.0.6.

my.data.frame <- disastr.api( # stores retrieved disaster events in object my.data.frame
  limit = 20)
#> Your disaster event data request was successful.

head(my.data.frame) # returns the first five observations of the ACLED sample
#>      id                      date                country
#> 1 51977 2024-04-23T03:49:27+00:00 Bosnia and Herzegovina
#> 2 51970 2024-04-18T18:21:19+00:00              Indonesia
#> 3 51963 2024-04-15T07:32:14+00:00                  Kenya
#> 4 51957 2024-04-10T06:17:25+00:00             Kazakhstan
#> 5 51953 2024-04-06T00:54:52+00:00                   Cuba
#> 6 51951 2024-04-04T02:16:22+00:00                Uruguay
#>                                                  name              event
#> 1 Bosnia and Herzegovina: Measles Outbreak - Feb 2024           Epidemic
#> 2                 Indonesia: Ruang Volcano - Apr 2024            Volcano
#> 3                            Kenya: Floods - Apr 2024 Flash Flood, Flood
#> 4                       Kazakhstan: Floods - Mar 2024              Flood
#> 5                             Cuba: Floods - Mar 2024              Flood
#> 6                          Uruguay: Floods - Mar 2024              Flood
#>    status                                       url
#> 1 ongoing https://reliefweb.int/taxonomy/term/51977
#> 2   alert https://reliefweb.int/taxonomy/term/51970
#> 3 ongoing https://reliefweb.int/taxonomy/term/51963
#> 4 ongoing https://reliefweb.int/taxonomy/term/51957
#> 5 ongoing https://reliefweb.int/taxonomy/term/51953
#> 6 ongoing https://reliefweb.int/taxonomy/term/51951
```
