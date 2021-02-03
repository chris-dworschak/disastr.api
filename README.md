
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Wrapper for the UN OCHA ReliefWeb Disaster Events API

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/disastr.api)](https://CRAN.R-project.org/package=disastr.api)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![Travis build
status](https://travis-ci.com/chris-dworschak/disastr.api.svg?branch=master)](https://travis-ci.com/gitlab/chris-dworschak/disastr.api)
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
#> This package may be cited as:
#> Dworschak, Christoph. 2021. "Disastr.api: Wrapper for the UN OCHA
#> ReliefWeb Disaster Events API." R package. CRAN version 1.0.4.
#> For the development version of this package, visit <https://gitlab.com/chris-dworschak/disastr.api/>

my.data.frame <- disastr.api( # stores retrieved disaster events in object my.data.frame
  limit = 20)
#> Your disaster event data request was successful.

head(my.data.frame) # returns the first five observations of the ACLED sample
#>      id                      date                                    country
#> 1 50579 2021-01-18T00:00:00+00:00                       Syrian Arab Republic
#> 2 50575 2021-01-17T00:00:00+00:00 Eswatini, Madagascar, Mozambique, Zimbabwe
#> 3 50573 2021-01-15T00:00:00+00:00                                  Indonesia
#> 4 50574 2021-01-04T00:00:00+00:00                                  Indonesia
#> 5 50560 2021-01-01T00:00:00+00:00                                   Malaysia
#> 6 50545 2020-12-18T00:00:00+00:00                                   Mongolia
#>                                          name                          event
#> 1                    Syria: Floods - Jan 2021      Flood, Severe Local Storm
#> 2          Tropical Cyclone Eloise - Jan 2021        Flood, Tropical Cyclone
#> 3            Indonesia: Earthquake - Jan 2021                     Earthquake
#> 4 Indonesia: Floods and Landslides - Jan 2021 Flash Flood, Flood, Land Slide
#> 5                 Malaysia: Floods - Jan 2021              Flood, Land Slide
#> 6                   Mongolia: Dzud - Dec 2020             Cold Wave, Drought
#>    status                                       url
#> 1 current https://reliefweb.int/taxonomy/term/50579
#> 2 current https://reliefweb.int/taxonomy/term/50575
#> 3 current https://reliefweb.int/taxonomy/term/50573
#> 4 current https://reliefweb.int/taxonomy/term/50574
#> 5 current https://reliefweb.int/taxonomy/term/50560
#> 6   alert https://reliefweb.int/taxonomy/term/50545
```
