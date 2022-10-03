# code to prepare `wildlife_strikes` dataset goes here

library(readr)
library(dplyr)

wildlife_strikes <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-07-23/wildlife_impacts.csv")

wildlife_strikes<- wildlife_strikes %>%
  filter(airport != "UNKNOWN")%>%  # subset data to exclude observations where airport is unknown
  na.omit()%>%  # subset data to exclude missing observations
  rename(abb = state)%>%
  rename_all(.funs = function(.x){
    .x %>% tolower()
  })

usethis::use_data(wildlife_strikes, overwrite = TRUE)
