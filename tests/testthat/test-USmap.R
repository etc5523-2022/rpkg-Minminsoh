test_that("All US states are included", {
  states <- wildlifestrikes::USmap %>%
    distinct(region)%>%
    count()

  statesname<- wildlifestrikes::USmap %>%
    distinct(region)%>%
    pull(region)

  #US has a total of 48 states excluding Hawaii and Alaska
  expect_setequal(states$n, 48)

})
