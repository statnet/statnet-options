library(testthat)

# Prepend 'lib' library tree
withr::local_libpaths("lib", action="prefix")



test_that("it just works", {
  library(pkgB)
  expect_equal(sctrl(), list(B1=2, B2=4))
})
