
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
#> ReliefWeb Disaster Events API." R package. CRAN version 1.0.5.
#> For the development version of this package, visit <https://gitlab.com/chris-dworschak/disastr.api/>

my.data.frame <- disastr.api( # stores retrieved disaster events in object my.data.frame
  limit = 20)
#> Your disaster event data request was successful.

head(my.data.frame) # returns the first five observations of the ACLED sample
#>      id                      date
#> 1 50617 2021-02-17T00:00:00+00:00
#> 2 50594 2021-02-07T00:00:00+00:00
#> 3 50599 2021-01-28T00:00:00+00:00
#> 4 50579 2021-01-18T00:00:00+00:00
#> 5 50575 2021-01-17T00:00:00+00:00
#> 6 50573 2021-01-15T00:00:00+00:00
#>                                                    country
#> 1                               Iran (Islamic Republic of)
#> 2                         Democratic Republic of the Congo
#> 3                                                   Guinea
#> 4                                     Syrian Arab Republic
#> 5 Eswatini, Madagascar, Mozambique, South Africa, Zimbabwe
#> 6                                                Indonesia
#>                                  name                     event  status
#> 1         Iran: Earthquake - Feb 2021                Earthquake current
#> 2 DR Congo: Ebola Outbreak - Feb 2021                  Epidemic current
#> 3   Guinea: Ebola Outbreak - Jan 2021                  Epidemic current
#> 4            Syria: Floods - Jan 2021 Flood, Severe Local Storm current
#> 5  Tropical Cyclone Eloise - Jan 2021   Flood, Tropical Cyclone current
#> 6    Indonesia: Earthquake - Jan 2021                Earthquake current
#>                                         url
#> 1 https://reliefweb.int/taxonomy/term/50617
#> 2 https://reliefweb.int/taxonomy/term/50594
#> 3 https://reliefweb.int/taxonomy/term/50599
#> 4 https://reliefweb.int/taxonomy/term/50579
#> 5 https://reliefweb.int/taxonomy/term/50575
#> 6 https://reliefweb.int/taxonomy/term/50573
```
