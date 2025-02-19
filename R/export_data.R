#' Export Data to Various Formats
#'
#' This function allows users to export a dataframe or tibble to multiple file formats, including Excel (.xlsx), CSV, RDS, text, SPSS (.sav), Stata (.dta), and Feather.
#'
#' @param data A dataframe or tibble to export.
#' @param format A character string specifying the export format. Supported formats include: "xlsx", "csv", "rds", "txt", "sav", "dta" and "sas7bdat". Defaults to "xlsx".
#' @param path A character string specifying the file path for the exported file.
#'
#' @return This function does not return a value. It writes the data to the specified file path and displays a success message upon completion.
#'
#' @details
#' Supported formats and their functionality are provided via the package dependencies:
#' - **xlsx**: Uses `openxlsx` for Excel exports.
#' - **csv**: Base R functionality.
#' - **rds**: Base R functionality.
#' - **txt**: Base R functionality with tab-separated values.
#' - **sav**: Uses `haven` for SPSS exports.
#' - **dta**: Uses `haven` for Stata exports.
#' - **sas7bdat**: Uses `haven` for SAS exports.
#'
#' @examples
#' df <- data.frame(Name = c("Alice", "Bob"), Age = c(25, 30), Score = c(85.5, 90.0))
#'
#' # Export to Excel
#' export_data(data = df, format = "xlsx", path = "example.xlsx")
#'
#' # Export to CSV
#' export_data(data = df, format = "csv", path = "example.csv")
#'
#' # Export to SPSS
#' export_data(data = df, format = "sav", path = "example.sav")
#'
#' @export
export_data <- function(data = NULL, format = "xlsx", path = NULL) {

  # Check if data is provided
  if (is.null(data)) {
    stop("Please specify an R object to export.", call. = FALSE)
  }

  # Check if data is a dataframe or tibble
  if (!is.data.frame(data) && !is_tibble(data)) {
    stop("The R object to export must be a dataframe or a tibble.", call. = FALSE)
  }

  # Check if path is provided
  if (is.null(path)) {
    stop("Please specify the file path where the data should be exported.", call. = FALSE)
  }

  # Handle export based on the format
  if (format == "xlsx") {
    hs <- createStyle(textDecoration = "BOLD", fontColour = "#FFFFFF", fontSize = 12, fontName = "Arial Narrow", fgFill = "#4F80BD", halign = "center")
    openxlsx::write.xlsx(x = data, file = path, overwrite = TRUE, colNames = TRUE, borders = "rows", headerStyle = hs)
  } else if (format == "csv") {
    write.csv(data, file = path, row.names = FALSE)
  } else if (format == "rds") {
    saveRDS(data, file = path)
  } else if (format == "txt") {
    write.table(data, file = path, row.names = FALSE, quote = FALSE, sep = "\t")
  } else if (format == "sav") {
    haven::write_sav(data, path)
  } else if (format == "dta") {
    haven::write_dta(data, path)
  } else if (format == "sas7bdat") {
    haven::write_xpt(data, path)
  } else {
    # Error in case the format used is not supported by this function
    stop("Unsupported format. Please choose one of the following: 'xlsx', 'csv', 'rds', 'txt', 'sav', 'dta', 'sas7bdat'.")
  }

  # Final message
  message("Data successfully exported to ", path)
}
