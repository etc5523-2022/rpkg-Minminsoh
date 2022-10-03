
# Data
 
The `wildlife_strikes.rda` data set is about wildlife strike incidents on aircraft in the USA between 1991 and 2018. The data set was obtained from [tidytuesday](https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-07-23/wildlife_impacts.csv").


## Purpose

This wildlifestrikes package aims to illustrate via Shiny Application the statistics and impacts of wildlife strikes on planes/aircrafts. 

1. let the user to guess which factors and conditions affect the frequency and occurrence of wildlife strikes on aircrafts, thus making learning aspects of data playful,

2. Highlight the number of cases and distribution of cases by State via a choropleth map(i.e. map of USA), thus making it easier for user to digest the data,

3. Interactively present the impact of wildlife strikes on airplane by number of cases and damage level by allowing the user to choose the airplane and year of the data,  

4. Personalise the view of the data for the user by allowing them to choose what they want to see by for example: choosing which state to view and allowing users to adjust the sliding bar for the Distribution of Repair Costs to change the view of the histogram 


## Shiny Application

The Shiny Application in this package contains three tabs. 

1) The first tab is built by the `count_frequency()` function and prompts users to guess answers to three questions relating to the factors/conditions affecting wildlife strikes. 
2) The second tab is built by the `plot_map.R` function (specifically `cases_state(input_state)` and `cases_statemap(input_state)`) and shows the number of cases for each U.S. State in tibble format and on the choropleth map. 
3) The third and final tab is built by `cases_airline()` function which returns a message to the user on the number of wildlife strike cases incurred by the selected airplane in the selected year. This is then further categorised into different damages level by using the `damages_airline` function. `hist.R` function creates a histogram showing the distribution of repair costs incurred for the airline selected by the user in a particular year, ranging from 1991 to 2018. 


There are other functions created solely to support the Shiny Application. For example, the `ui_inputs()` function creates the user interface inputs in the Shiny App and `theme_plots()` creates custom theme for plots. 



#### Creator

Min Min Soh (mmsoh1@student.monash.edu)

<details>
<summary>Session information</summary>

```
## ─ Session info ───────────────────────────────────────────────────────────────────────────────────
##  setting  value
##  version  R version 4.2.1 (2022-06-23)
##  os       macOS Monterey 12.0.1
##  system   x86_64, darwin17.0
##  ui       RStudio
##  language (EN)
##  collate  en_AU.UTF-8
##  ctype    en_AU.UTF-8
##  tz       Australia/Melbourne
##  date     2022-10-03
##  rstudio  2022.07.1+554 Spotted Wakerobin (desktop)
##  pandoc   NA
## 
## ─ Packages ───────────────────────────────────────────────────────────────────────────────────────
##  package         * version    date (UTC) lib source
##  assertthat        0.2.1      2019-03-21 [1] CRAN (R 4.2.0)
##  backports         1.4.1      2021-12-13 [1] CRAN (R 4.2.0)
##  broom             1.0.0      2022-07-01 [1] CRAN (R 4.2.0)
##  bslib             0.4.0      2022-07-16 [1] CRAN (R 4.2.0)
##  cachem            1.0.6      2021-08-19 [1] CRAN (R 4.2.0)
##  cellranger        1.1.0      2016-07-27 [1] CRAN (R 4.2.0)
##  cli               3.4.0      2022-09-08 [1] CRAN (R 4.2.0)
##  colorspace        2.0-3      2022-02-21 [1] CRAN (R 4.2.0)
##  crayon            1.5.1      2022-03-26 [1] CRAN (R 4.2.0)
##  data.table        1.14.2     2021-09-27 [1] CRAN (R 4.2.0)
##  DBI               1.1.3      2022-06-18 [1] CRAN (R 4.2.0)
##  dbplyr            2.2.1      2022-06-27 [1] CRAN (R 4.2.0)
##  digest            0.6.29     2021-12-01 [1] CRAN (R 4.2.0)
##  dplyr           * 1.0.10     2022-09-01 [1] CRAN (R 4.2.0)
##  ellipsis          0.3.2      2021-04-29 [1] CRAN (R 4.2.0)
##  evaluate          0.16       2022-08-09 [1] CRAN (R 4.2.0)
##  fansi             1.0.3      2022-03-24 [1] CRAN (R 4.2.0)
##  fastmap           1.1.0      2021-01-25 [1] CRAN (R 4.2.0)
##  fontawesome       0.3.0      2022-07-20 [1] CRAN (R 4.2.0)
##  forcats         * 0.5.2      2022-08-19 [1] CRAN (R 4.2.0)
##  fs                1.5.2      2021-12-08 [1] CRAN (R 4.2.0)
##  gargle            1.2.0      2021-07-02 [1] CRAN (R 4.2.0)
##  generics          0.1.3      2022-07-05 [1] CRAN (R 4.2.0)
##  ggplot2         * 3.3.6      2022-05-03 [1] CRAN (R 4.2.0)
##  glue              1.6.2      2022-02-24 [1] CRAN (R 4.2.0)
##  googledrive       2.0.0      2021-07-08 [1] CRAN (R 4.2.0)
##  googlesheets4     1.0.1      2022-08-13 [1] CRAN (R 4.2.0)
##  gtable            0.3.0      2019-03-25 [1] CRAN (R 4.2.0)
##  haven             2.5.1      2022-08-22 [1] CRAN (R 4.2.0)
##  hms               1.1.2      2022-08-19 [1] CRAN (R 4.2.0)
##  htmltools         0.5.3      2022-07-18 [1] CRAN (R 4.2.0)
##  htmlwidgets       1.5.4      2021-09-08 [1] CRAN (R 4.2.0)
##  httpuv            1.6.5      2022-01-05 [1] CRAN (R 4.2.0)
##  httr              1.4.4      2022-08-17 [1] CRAN (R 4.2.0)
##  jquerylib         0.1.4      2021-04-26 [1] CRAN (R 4.2.0)
##  jsonlite          1.8.0      2022-02-22 [1] CRAN (R 4.2.0)
##  knitr             1.40       2022-08-24 [1] CRAN (R 4.2.0)
##  later             1.3.0      2021-08-18 [1] CRAN (R 4.2.0)
##  lazyeval          0.2.2      2019-03-15 [1] CRAN (R 4.2.0)
##  lifecycle         1.0.1      2021-09-24 [1] CRAN (R 4.2.0)
##  lubridate         1.8.0      2021-10-07 [1] CRAN (R 4.2.0)
##  magrittr          2.0.3      2022-03-30 [1] CRAN (R 4.2.0)
##  markdown          1.1        2019-08-07 [1] CRAN (R 4.2.0)
##  memoise           2.0.1      2021-11-26 [1] CRAN (R 4.2.0)
##  mime              0.12       2021-09-28 [1] CRAN (R 4.2.0)
##  modelr            0.1.9      2022-08-19 [1] CRAN (R 4.2.0)
##  munsell           0.5.0      2018-06-12 [1] CRAN (R 4.2.0)
##  pillar            1.8.1      2022-08-19 [1] CRAN (R 4.2.0)
##  pkgconfig         2.0.3      2019-09-22 [1] CRAN (R 4.2.0)
##  pkgload           1.3.0      2022-06-27 [1] CRAN (R 4.2.0)
##  plotly          * 4.10.0     2021-10-09 [1] CRAN (R 4.2.0)
##  promises          1.2.0.1    2021-02-11 [1] CRAN (R 4.2.0)
##  purrr           * 0.3.4      2020-04-17 [1] CRAN (R 4.2.0)
##  R6                2.5.1      2021-08-19 [1] CRAN (R 4.2.0)
##  Rcpp              1.0.9      2022-07-08 [1] CRAN (R 4.2.0)
##  readr           * 2.1.2      2022-01-30 [1] CRAN (R 4.2.0)
##  readxl            1.4.1      2022-08-17 [1] CRAN (R 4.2.0)
##  reprex            2.0.2      2022-08-17 [1] CRAN (R 4.2.0)
##  rlang             1.0.4      2022-07-12 [1] CRAN (R 4.2.0)
##  rsconnect         0.8.27     2022-07-12 [1] CRAN (R 4.2.0)
##  rstudioapi        0.14       2022-08-22 [1] CRAN (R 4.2.0)
##  rvest             1.0.3      2022-08-19 [1] CRAN (R 4.2.0)
##  sass              0.4.2      2022-07-16 [1] CRAN (R 4.2.0)
##  scales            1.2.1      2022-08-20 [1] CRAN (R 4.2.0)
##  sessioninfo       1.2.2      2021-12-06 [1] CRAN (R 4.2.0)
##  shiny           * 1.7.2      2022-07-19 [1] CRAN (R 4.2.0)
##  shinythemes     * 1.2.0      2021-01-25 [1] CRAN (R 4.2.0)
##  stringi           1.7.8      2022-07-11 [1] CRAN (R 4.2.0)
##  stringr         * 1.4.1      2022-08-20 [1] CRAN (R 4.2.0)
##  tibble          * 3.1.8      2022-07-22 [1] CRAN (R 4.2.0)
##  tidyr           * 1.2.0      2022-02-01 [1] CRAN (R 4.2.0)
##  tidyselect        1.1.2      2022-02-21 [1] CRAN (R 4.2.0)
##  tidyverse       * 1.3.2      2022-07-18 [1] CRAN (R 4.2.0)
##  tzdb              0.3.0      2022-03-28 [1] CRAN (R 4.2.0)
##  utf8              1.2.2      2021-07-24 [1] CRAN (R 4.2.0)
##  vctrs             0.4.1      2022-04-13 [1] CRAN (R 4.2.0)
##  viridisLite       0.4.1      2022-08-22 [1] CRAN (R 4.2.0)
##  wildlifestrikes * 0.0.0.9000 2022-10-03 [1] local
##  withr             2.5.0      2022-03-03 [1] CRAN (R 4.2.0)
##  xfun              0.32       2022-08-10 [1] CRAN (R 4.2.0)
##  xml2              1.3.3      2021-11-30 [1] CRAN (R 4.2.0)
##  xtable            1.8-4      2019-04-21 [1] CRAN (R 4.2.0)
##  yaml              2.3.5      2022-02-21 [1] CRAN (R 4.2.0)
## 
##  [1] /Library/Frameworks/R.framework/Versions/4.2/Resources/library
## 
## ──────────────────────────────────────────────────────────────────────────────────────────────────
```
</details>
