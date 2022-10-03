test_that("Assess if output returning the number of attacks incurred by selected airline in the selected year works", {
  expected <- cases_airline("AMERICAN AIRLINES", 2018)
  expect_equal(expected,("AMERICAN AIRLINES incurred 4  wildlife strikes to the aircrafts in 2018."))

})
