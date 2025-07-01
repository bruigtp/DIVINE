#' Create Summary Table
#'
#' This function generates a summary table using the `gtsummary` package. It allows customization
#' of reported statistics, including mean (SD), median (Q1; Q3), or both. Users can choose to include
#' p-values for group comparisons and manage the reporting of missing values.
#'
#' @param data A data frame containing the dataset.
#' @param vars A character vector of variable names to include in the summary. If NULL, all variables are included.
#' @param by A character string specifying a grouping variable. If NULL, no grouping is applied.
#' @param statistic_type A character string specifying the type of statistic to report. Options are:
#'   - "mean_sd": Mean (SD) for continuous variables.
#'   - "median_iqr": Median (Q1; Q3) for continuous variables.
#'   - "both": Both Mean (SD) and Median (Q1; Q3).
#' @param pvalue A logical value indicating whether to include p-values in the summary. Defaults to FALSE.
#' @param include_na A logical value indicating whether to include rows with missing values in the output. Defaults to TRUE.
#'
#' @return A gtsummary table object.
#' @importFrom gtsummary tbl_summary add_p modify_table_body all_continuous all_stat_cols
#' @examples
#' data <- mtcars
#' stats_table(data, vars = c("mpg", "hp", "wt"), by = "cyl", statistic_type = "mean_sd")
#' @export
#'
stats_table <- function(data, vars = NULL, by = NULL, statistic_type = "mean_sd", pvalue = FALSE, include_na = TRUE) {
  # Check if the specified variables exist in the dataset
  if (!is.null(vars) && !all(vars %in% names(data))) {
    stop("Some variables specified in 'vars' are not present in the dataset.")
  }

  # Subset data if vars are provided
  if (!is.null(vars)) {
    if (!is.null(by)) {
      data <- data |>
        dplyr::select(dplyr::all_of(c(vars, by)))
    } else {
      data <- data |>
        dplyr::select(dplyr::all_of(vars))
    }
  }

  # Define type based on the chosen statistic_type
  if(statistic_type == "both") {
    type <- list(gtsummary::all_continuous() ~ "continuous2")
  } else {
    type <- NULL
  }

  # Define statistics based on the chosen statistic_type
  if (statistic_type == "mean_sd") {
    statistic <- list(gtsummary::all_continuous() ~ "{mean} ({sd})",
                      gtsummary::all_categorical() ~ "{n} ({p}%)")
  } else if (statistic_type == "median_iqr") {
    statistic <- list(gtsummary::all_continuous() ~ "{median} [{p25};{p75}]",
                      gtsummary::all_categorical() ~ "{n} ({p}%)")
  } else if (statistic_type == "both") {
    statistic <- list(gtsummary::all_continuous() ~ c("{mean} ({sd})", "{median} [{p25};{p75}]"),
                      gtsummary::all_categorical() ~ "{n} ({p}%)")
  } else {
    stop("Invalid statistic_type. Choose 'mean_sd', 'median_iqr', or 'both'.")
  }

  # Create summary table
  tbl <- gtsummary::tbl_summary(
    data = data,
    by = by,
    statistic = statistic,
    digits = list(gtsummary::all_continuous() ~ 2,
                  gtsummary::all_categorical() ~ c(0, 2),
                  gtsummary::all_dichotomous() ~ c(0, 2)),
    missing = ifelse(include_na, "ifany", "no"),
    type = type
  )

  # Add p-value if a grouping variable is specified
  if (!is.null(by) & pvalue) {
    tbl <- tbl |> gtsummary::add_p()
  }

  # Modify label header
  tbl <- tbl |>
    gtsummary::modify_header(label = "**Variables**")

  # Add stat_label
  # tbl <- tbl |>
  #   gtsummary::add_stat_label()

  # Eliminate NA values of the output
  tbl <- tbl |>
    gtsummary::modify_table_body(~.x |>
                                   dplyr::mutate(
                                     dplyr::across(
                                       gtsummary::all_stat_cols(), ~dplyr::case_when(
                                         stringr::str_detect(.x, "NA ?") ~ "-",
                                         TRUE ~ .x))))

  # Return the summary table
  return(tbl)
}
