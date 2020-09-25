
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Automated Retrieval of Disaster Event Data

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/disastr.api)](https://CRAN.R-project.org/package=disastr.api)
[![Travis build
status](https://travis-ci.com/chris-dworschak/disastr.api.svg?branch=master)](https://travis-ci.com/chris-dworschak/disastr.api)
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
# library(disastr.api) # loads the package

# my.data.frame <- disastr.api( # stores retrieved disaster events in object my.data.frame
#   limit = 30)

# head(my.data.frame) # returns the first five observations of the ACLED sample
```
