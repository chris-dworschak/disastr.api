
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

This package provides functionality to access and manage the application
programming interface (API) of the [United Nations Office for the
Coordination of Humanitarian Affairs’ (OCHA) ReliefWeb disaster
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
  limit = 20)
#> Your disaster event data request was successful.

head(my.data.frame) # returns the first five observations of the ACLED sample
#>      id                      date
#> 1 50539 2020-12-17T00:00:00+00:00
#> 2 50536 2020-12-02T00:00:00+00:00
#> 3 50532 2020-11-27T00:00:00+00:00
#> 4 50513 2020-11-22T00:00:00+00:00
#> 5 50506 2020-11-15T00:00:00+00:00
#> 6 50498 2020-11-10T00:00:00+00:00
#>                                                                  country
#> 1                                                          Fiji, Vanuatu
#> 2                                                              Sri Lanka
#> 3                                                              Indonesia
#> 4                                                         Somalia, Yemen
#> 5 Belize, Colombia, El Salvador, Guatemala, Honduras, Jamaica, Nicaragua
#> 6          Lao People's Democratic Republic (the), Philippines, Viet Nam
#>                                          name
#> 1            Tropical Cyclone Yasa - Dec 2020
#> 2                Sri Lanka: Floods - Dec 2020
#> 3 Indonesia: Ili Lewotolok Volcano - Nov 2020
#> 4            Tropical Cyclone Gati - Nov 2020
#> 5                   Hurricane Iota - Nov 2020
#> 6                    Typhoon Vamco - Nov 2020
#>                                  event  status
#> 1 Flash Flood, Flood, Tropical Cyclone current
#> 2                                Flood current
#> 3                              Volcano current
#> 4        Flash Flood, Tropical Cyclone current
#> 5  Flood, Land Slide, Tropical Cyclone current
#> 6  Flood, Land Slide, Tropical Cyclone current
#>                                         url
#> 1 https://reliefweb.int/taxonomy/term/50539
#> 2 https://reliefweb.int/taxonomy/term/50536
#> 3 https://reliefweb.int/taxonomy/term/50532
#> 4 https://reliefweb.int/taxonomy/term/50513
#> 5 https://reliefweb.int/taxonomy/term/50506
#> 6 https://reliefweb.int/taxonomy/term/50498
```
