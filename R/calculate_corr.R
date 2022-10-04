#' Calculate correlation between variables in the dataset
#'
#' @description This function takes 1  variable from `wildlife_strikes` dataset and computes the correlation and p-value between that selected variable and repair costs incurred on airline due to wildlife strikes.
#'
#' @param var name of variable
#'
#' @return A dataframe with correlation and p-value
#' @export
#'
#' @examples
#' calculate_corr(var = height)
#' calculate_corr(var = speed)
#' @import rlang
#' @import dplyr

calculate_corr <- function(var) {

  # convert variable into factor
 var1_chr <- rlang::as_label(rlang::ensym(var))

 # alert user if variables chosen are not in data set
 if (!(var1_chr %in% names(wildlife_strikes))) {
   stop(paste0("{var1_chr} is not in the data set."))
 }


  # calculate correlation
  output <- stats::cor.test(
   x = wildlife_strikes %>% dplyr::pull({{ var }}),
   y = wildlife_strikes %>% dplyr::pull(cost_repairs_infl_adj)
 ) %>%
   # tidy up results
   broom::tidy() %>%
   # retain and rename relevant bits
   dplyr::select(
     correlation = .data$estimate,
     pval = .data$p.value
   )

  attr(output$correlation, "names") <- NULL

 return(output)

}

