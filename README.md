
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Automated Retrieval of Disaster Event Data

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/disastr.api)](https://CRAN.R-project.org/package=disastr.api)
[![Travis build
status](https://travis-ci.com/chris-dworschak/disastr.api.svg?branch=master)](https://travis-ci.com/github/chris-dworschak/disastr.api)
[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
<!-- badges: end -->

This small package provides functionality to access and manage the
application programming interface (API) of the [United Nations Office
for the Coordination of Humanitarian Affairs’ (OCHA) ReliefWeb disaster
events](https://reliefweb.int/disasters/). The function `disastr.api()`
makes it easy to retrieve a user-defined sample (or all of the available
data) from ReliefWeb, enabling a seamless integration of regular data
updates into the research work flow.

## Installation

You can install the released version of disastr.api from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("disastr.api")
```

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("chris-dworschak/disastr.api") # downloads and installs the package
```

## Example

Using `disastr.api` is straight forward. To download data on, for
example, the last 30 disaster events, you can supply:

``` r
library(disastr.api) # loads the package
#> 
#> This package may be cited as:
#> Dworschak, Christoph. 2020. "Disastr.api: Automated Retrieval of Disaster Event Data. R package.
#> Development version 1.0.0.

my.data.frame <- disastr.api( # stores retrieved disaster events in object my.data.frame
  limit = 30)
#> Your disaster event data request was successful.

head(my.data.frame) # returns the first five observations of the ACLED sample
#>      id                      date      country                             name
#> 1 50440 2020-09-07T00:00:00+00:00      Senegal       Senegal: Floods - Sep 2020
#> 2 50443 2020-09-06T00:00:00+00:00       Guinea        Guinea: Floods - Sep 2020
#> 3 50438 2020-09-05T00:00:00+00:00 Burkina Faso  Burkina Faso: Floods - Sep 2020
#> 4 50441 2020-09-01T00:00:00+00:00   Mauritania    Mauritania: Floods - Sep 2020
#> 5 50421 2020-08-20T00:00:00+00:00         Chad          Chad: Floods - Aug 2020
#> 6 50435 2020-08-14T00:00:00+00:00        Yemen Yemen: Polio Outbreak - Aug 2020
#>      event  status                                       url
#> 1    Flood current https://reliefweb.int/taxonomy/term/50440
#> 2    Flood current https://reliefweb.int/taxonomy/term/50443
#> 3    Flood current https://reliefweb.int/taxonomy/term/50438
#> 4    Flood current https://reliefweb.int/taxonomy/term/50441
#> 5    Flood current https://reliefweb.int/taxonomy/term/50421
#> 6 Epidemic   alert https://reliefweb.int/taxonomy/term/50435
```
