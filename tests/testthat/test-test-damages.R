test_that("Assess if calculation on number of cases by damage level works", {
  expected <- damages_airline("AMERICAN AIRLINES", 2011)
  expect_equal(expected[["incident_year"]],c(2011, 2011, 2011))
  expect_equal(expected[["n"]],c(3, 1, 2))
  expect_equal(dim(expected), c(3,4))
  expect_named(expected, c("operator", "damage", "incident_year", "n"))
})
