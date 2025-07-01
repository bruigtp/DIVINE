#' Multi-Dataset Join Utility
#'
#' This function performs a sequential join of multiple datasets by a specified key column.
#'
#' @param datasets A list of data frames to be joined.
#' @param key A character string representing the key column to join by. Defaults to "record_id".
#' @param join_type A character string specifying the type of join. Options are "left", "right", "inner", or "full".
#'
#' @return A single data frame containing the joined datasets.
#' @importFrom dplyr left_join right_join inner_join full_join
#' @importFrom purrr map
#' @examples
#' data1 <- data.frame(id = 1:3, x = c("A", "B", "C"))
#' data2 <- data.frame(id = 2:4, y = c("D", "E", "F"))
#' data3 <- data.frame(id = 3:5, z = c("G", "H", "I"))
#' multi_join(list(data1, data2, data3), key = "id", join_type = "left")
#' @export
multi_join <- function(datasets, key = "record_id", join_type = "left") {
  # Validate that datasets is a list of data frames
  if (!is.list(datasets) | !all(sapply(datasets, is.data.frame) | sapply(datasets, tibble::is_tibble))) {
    stop("The 'datasets' parameter must be a list of data frames.")
  }

  # Check if there is more than one dataframe specified
  if (length(datasets) == 1) {
    stop("Please specify more than one dataset to join.")
  }

  # Check if the key exists in all datasets
  if (!all(sapply(datasets, function(df) key %in% names(df)))) {
    stop(paste("The key column", key, "must exist in all datasets."))
  }

  # Validate the join type
  valid_join_types <- c("left", "right", "inner", "full")
  if (!(join_type %in% valid_join_types)) {
    stop(paste("Invalid join_type. Choose one of:", paste(valid_join_types, collapse = ", ")))
  }

  # Select the appropriate join function
  join_fun <- switch(join_type,
                     left = dplyr::left_join,
                     right = dplyr::right_join,
                     inner = dplyr::inner_join,
                     full = dplyr::full_join)

  # Perform the joins sequentially using Reduce
  result <- Reduce(function(x, y) {
    # Join each pair of data frames using the specified join function
    join_fun(x, y, by = key)
  }, datasets)

  return(result)
}
