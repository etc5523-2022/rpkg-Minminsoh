test_that("Assess if caculation on correlation and pvalue work", {
  expected <- calculate_corr(var = height)
  expect_equal(expected[["correlation"]], -0.0418, tolerance = 0.001)
  expect_equal(expected[["pval"]], 0.533, tolerance = 0.001)
  expect_equal(dim(expected), c(1,2))
  expect_named(expected, c("correlation", "pval"))
})
