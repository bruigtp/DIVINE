#' Replace Missing Values
#'
#' This function replaces missing values (NA) in a dataset with a specified value 
#' or method (such as mean, median, or a custom value). The replacement is performed
#' column-wise, allowing for both numeric and character columns to be processed.
#'
#' @param data A data frame. The dataset in which missing values should be replaced.
#' @param replace_with A character string or a numeric value. Specifies the method or value 
#'   used to replace missing values. Options include:
#'   \itemize{
#'     \item `"mean"`: Replace with the column's mean value (ignoring NA).
#'     \item `"median"`: Replace with the column's median value (ignoring NA).
#'     \item A numeric value: Replace missing values with this specific value.
#'     \item `"mode"`: Replace with the most frequent (mode) value for character columns.
#'   }
#'   Defaults to `"mean"`.
#' @return A data frame with missing values replaced according to the specified method.
#' 
#' @details
#' This function replaces missing values (`NA`) in a data frame with a specified method. 
#' The `replace_with` parameter can be:
#' - `"mean"` or `"median"` to replace with the mean or median (only for numeric columns).
#' - A numeric value, in which case the function replaces all NAs in numeric columns with 
#'   that value.
#' - `"mode"` to replace missing values with the most frequent value in character columns.
#'
#' If you choose `"mode"` for character columns, it will replace the missing values with the 
#' most frequent non-missing value in the column.
#'
#' @examples
#' # Example replacing NAs with the mean of each numeric column
#' clean_missing(mtcars, replace_with = "mean")
#'
#' # Example replacing NAs with a custom numeric value
#' clean_missing(mtcars, replace_with = 0)
#'
#' # Example replacing NAs with the mode for character columns
#' data <- data.frame(
#'   Category = c("A", "B", NA, "B", "A", NA),
#'   Value = c(1, NA, 3, NA, 5, 6)
#' )
#' clean_missing(data, replace_with = "mode")
#'
#' @export
clean_missing <- function(data, replace_with = "mean") {
  
  # Validate the replace_with parameter
  if (!(replace_with %in% c("mean", "median", "mode") || is.numeric(replace_with))) {
    stop("Invalid 'replace_with' value. Choose from 'mean', 'median', 'mode', or a numeric value.")
  }
  
  # Function to calculate mode (for character columns)
  mode_value <- function(x) {
    uniq_x <- unique(x[!is.na(x)])
    uniq_x[which.max(tabulate(match(x, uniq_x)))]
  }
  
  data <- data |> 
    dplyr::mutate(across(
      .fns = ~ ifelse(is.na(.),
                      # Replace based on method or custom value
                      switch(
                        replace_with,
                        mean = if (is.numeric(.)) mean(., na.rm = TRUE) else .,
                        median = if (is.numeric(.)) median(., na.rm = TRUE) else .,
                        mode = if (is.character(.)) mode_value(.) else .,
                        as.numeric(replace_with) # Replace with numeric value directly
                      ),
                      .
      )
    ))
  
  return(data)
}
