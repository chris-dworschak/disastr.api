test_that("check that disaster validation works", {
  skip_on_cran()
  expect_error(disastr.api(disaster = 1),
               regexp = "The argument 'disaster' requires a character vector")
})


test_that("check that country validation works", {
  skip_on_cran()
  expect_error(disastr.api(country = 1),
               regexp = "The argument 'country' requires a character vector")
})

test_that("check that status validation works", {
  skip_on_cran()
  expect_error(disastr.api(status = 1),
               regexp = "The argument 'status' requires a character vector")
})

test_that("check that exact.match validation works", {
  skip_on_cran()
  expect_error(disastr.api(country = "Mali",
                           exact.match = ""),
               regexp = "The argument 'exact.match' requires a logical value")
})

test_that("check that ascending validation works", {
  skip_on_cran()
  expect_error(disastr.api(ascending = "character"),
               regexp = "The argument 'ascending' requires a logical value")
})

test_that("check that other.query validation works", {
  skip_on_cran()
  expect_error(disastr.api(other.query = 1),
               regexp = "The argument 'other.query' requires a character vector")
})

test_that("API extraction works", {
  skip_on_cran()
  expect_message(disastr.api(date.start = "2019-01-15",
                           date.end = "2019-08-15"),
                 regexp = "Your disaster event data request was successful.")
  expect_gt(nrow(disastr.api(date.start = "2019-01-15",
                                date.end = "2019-08-15")),
               expected = 1)
})

test_that("event limit works", {
  skip_on_cran()
  expect_equal(nrow(disastr.api(limit = 10,
                             date.start = "2019-01-15",
                             date.end = "2019-08-15")),
            expected = 10)
})

