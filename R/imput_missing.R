#' Replace Missing Values
#'
#' This function replaces missing values (NA) in a dataset with a specified value or method (such as mean, median, or a custom value). The replacement is performed column-wise, allowing for both numeric and character columns to be processed.
#'
#' You can also choose to drop rows that are entirely `NA`.
#'
#'
#' @param data A data frame. The dataset in which missing values should be imputed.
#' @param method A **named** list of formulas specifying **where** and **how** to impute. Each element must be a one-sided formula of the form `<selector> ~ <value>`.  Supported `<value>` options:
#'   \itemize{
#'     \item `"mean"`: replace with the column mean (numeric only).
#'     \item `"median"`: replace with the column median (numeric only).
#'     \item `"mode"`: replace with the most frequent value (character/factor only).
#'     \item A **numeric** constant: replace with that value (numeric columns).
#'     \item A **character** constant: replace with that value (character columns).
#'   }
#'    Defaults to `list(where(is.numeric) ~ "mean")`, which imputes **all** numeric columns by their means.
#' @param all_na_rm Logical; if `TRUE`, remove any rows where **all** columns are `NA` _before_ imputation. Defaults to `FALSE`.
#' @return A tibble with the same columns as `data`, but with missing values replaced per your specifications.
#'
#' @details
#' - The `method` argument uses **tidyselect** helpers. For example, `where(is.numeric()) ~ "median"` imputes all numeric columns by their medians.
#' - If you specify `"mode"`, the function computes the most frequent non-`NA` value in each selected column.
#'
#' @examples
#' # Impute all numeric columns by their means:
#' imput_missing(icu)
#'
#' # Impute numeric columns by median, and drop all-NA rows:
#' imput_missing(
#'   icu,
#'   method = list(where(is.numeric) ~ "median"),
#'   all_na_rm = TRUE
#' )
#'
#' @export
imput_missing <- function(data, method = list(dplyr::where(is.numeric) ~ "mean"), all_na_rm = FALSE) {

  #-- Input validation -------------------------------------------------------
  if (!inherits(data, "data.frame")) {
    stop("`data` must be a data.frame or tibble.", call. = FALSE)
  }
  if (!is.list(method) || length(method) < 1) {
    stop("`method` must be a non-empty list of formulas.", call. = FALSE)
  }
  if (!is.logical(all_na_rm) || length(all_na_rm) != 1) {
    stop("`all_na_rm` must be a single logical value.", call. = FALSE)
  }

  # Function to retrieve mode (for character columns)
  mode_value <- function(x) {
    uniq_x <- unique(x[!is.na(x)])
    uniq_x[which.max(tabulate(match(x, uniq_x)))]
  }

  # Convert to tibble for manipulation
  data <- dplyr::as_tibble(data)

  # Remove rows with all NAs if requested
  if (all_na_rm) {
    prev_rows <- nrow(data)

    data <- data |>
      dplyr::filter(!dplyr::if_all(dplyr::everything(), ~ is.na(.x)))

    remove_rows <- prev_rows - nrow(data)

    if (remove_rows > 0) {
      message(stringr::str_glue("Removed {remove_rows} rows where all values were NA"))
    }
  }

  data_cols <- names(data)

  # Process each formula in `method`

  for (i in method) {

    if (!inherits(i, "formula")) {
      stop(stringr::str_glue("Each element in 'method' must be a formula."), call. = FALSE)
    }

    arg_vars <- tidyselect::eval_select(rlang::f_lhs(i), data) |> names()
    arg_value <- rlang::eval_tidy(rlang::f_rhs(i))

    # Check column names

    check <- setdiff(arg_vars, data_cols)

    if (length(check) > 0) {
      stop(sprintf("Column(s) not found in data: %s", paste(check, collapse = ", ")), call. = FALSE)
    }

    # Check type of method

    check <- data |> dplyr::select(dplyr::any_of(arg_vars)) |> dplyr::select(dplyr::where(~!is.numeric(.x))) |> names()

    if (length(check) > 0 & arg_value %in% c("mean", "median")) {

      stop(sprintf("Column '%s' is character/factor; 'mean'/'median' not applicable. Replacement must be a string or 'mode'", check), call. = FALSE)

    }

    # Check type of method

    check <- data |> dplyr::select(dplyr::any_of(arg_vars)) |> dplyr::select(dplyr::where(~is.numeric(.x))) |> names()

    if (length(check) > 0 & is.character(arg_value) & !arg_value %in% c("mean", "median")) {

      stop(sprintf("Column '%s' is numeric; replacement must be numeric or one of 'mean','median'.", col), call. = FALSE)

    }

    # Define custom function to imput missings
    fill_na_custom <- function(x, arg_value) {
      if (!anyNA(x)) return(x)

      replacement <- if (identical(arg_value, "mean")) {
        mean(x, na.rm = TRUE)
      } else if (identical(arg_value, "median")) {
        stats::median(x, na.rm = TRUE)
      } else if (identical(arg_value, "mode")) {
        mode_value(x)
      } else if (is.numeric(arg_value) || is.character(arg_value)) {
        arg_value
      } else {
        stop("Invalid `arg_value`")
      }

      # Only replace NAs
      x[is.na(x)] <- replacement
      x
    }

    # Perform defined imputations
    data <- data |>
      dplyr::mutate(
        dplyr::across(
          .cols = dplyr::all_of(arg_vars),
          ~ fill_na_custom(.x, arg_value)
        )
      )
  }

  return(data)
}
