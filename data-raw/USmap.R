## code to prepare `USmap` dataset goes here

library(dplyr)
library(ggplot2)

USstates <- bind_cols(state.name, state.abb)%>%
  rename(region =...1, abb = ...2)%>%
  mutate(region = tolower(region))%>%
  filter(!region%in% c("alaska", "hawaii")) #exclude hawaii and alaska for better comparison

states_map <- map_data("state") %>%
  as_tibble()%>%
  select(!c("order", "subregion"))

USmap  <- left_join(USstates, states_map, by = "region")


usethis::use_data(USmap, overwrite = TRUE)
