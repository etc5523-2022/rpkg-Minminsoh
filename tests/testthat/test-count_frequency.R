test_that("Assess if calculation on frequency work", {
  expected <- count_frequency(var = sky)
  expect_equal(expected[["sky"]],c("No Cloud", "Overcast", "Some Cloud"))
  expect_equal(expected[["n"]],c(105, 41, 79))
  expect_equal(dim(expected), c(3,2))
  expect_named(expected, c("sky", "n"))
})

