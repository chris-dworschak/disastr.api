
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Wrapper for the UN OCHA ReliefWeb Disaster Events API

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/disastr.api)](https://CRAN.R-project.org/package=disastr.api)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![Travis build
status](https://travis-ci.com/chris-dworschak/disastr.api.svg?branch=master)](https://travis-ci.com/github/chris-dworschak/disastr.api)
[![CRANlogs](http://cranlogs.r-pkg.org/badges/grand-total/disastr.api)](https://CRAN.R-project.org/package=disastr.api)
<!-- badges: end -->

This package provides functionality to access and manage the application
programming interface (API) of the [United Nations Office for the
Coordination of Humanitarian Affairs’ (OCHA) ReliefWeb disaster
events](https://reliefweb.int/disasters/). It requires a minimal number
of dependencies. The function `disastr.api()` makes it easy to retrieve
a user-defined sample of disaster events from ReliefWeb, enabling a
seamless integration of regular data updates into the research work
flow.

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
example, the last 20 disaster events, you can supply:

``` r
library(disastr.api) # loads the package
#> 
#> This package may be cited as:
#> Dworschak, Christoph. 2021. "Disastr.api: Automated Retrieval
#> of Disaster Event Data." R package. CRAN version 1.0.1.
#> For the development version of this package, visit <https://github.com/chris-dworschak/disastr.api/>

my.data.frame <- disastr.api( # stores retrieved disaster events in object my.data.frame
  limit = 20)
#> Your disaster event data request was successful.

head(my.data.frame) # returns the first five observations of the ACLED sample
#>      id                      date
#> 1 50560 2021-01-01T00:00:00+00:00
#> 2 50539 2020-12-17T00:00:00+00:00
#> 3 50536 2020-12-02T00:00:00+00:00
#> 4 50532 2020-11-27T00:00:00+00:00
#> 5 50513 2020-11-22T00:00:00+00:00
#> 6 50506 2020-11-15T00:00:00+00:00
#>                                                                  country
#> 1                                                               Malaysia
#> 2                                                          Fiji, Vanuatu
#> 3                                                              Sri Lanka
#> 4                                                              Indonesia
#> 5                                                         Somalia, Yemen
#> 6 Belize, Colombia, El Salvador, Guatemala, Honduras, Jamaica, Nicaragua
#>                                          name
#> 1                 Malaysia: Floods - Jan 2021
#> 2            Tropical Cyclone Yasa - Dec 2020
#> 3                Sri Lanka: Floods - Dec 2020
#> 4 Indonesia: Ili Lewotolok Volcano - Nov 2020
#> 5            Tropical Cyclone Gati - Nov 2020
#> 6                   Hurricane Iota - Nov 2020
#>                                  event  status
#> 1                    Flood, Land Slide current
#> 2 Flash Flood, Flood, Tropical Cyclone current
#> 3                                Flood current
#> 4                              Volcano current
#> 5        Flash Flood, Tropical Cyclone current
#> 6  Flood, Land Slide, Tropical Cyclone current
#>                                         url
#> 1 https://reliefweb.int/taxonomy/term/50560
#> 2 https://reliefweb.int/taxonomy/term/50539
#> 3 https://reliefweb.int/taxonomy/term/50536
#> 4 https://reliefweb.int/taxonomy/term/50532
#> 5 https://reliefweb.int/taxonomy/term/50513
#> 6 https://reliefweb.int/taxonomy/term/50506
```
