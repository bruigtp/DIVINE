# Export Data to Various Formats

Export a dataframe or tibble to multiple file formats. If `format` is
NULL (default), the format will be inferred from the file extension of
`path`. If `format` is provided and the extension in `path` does not
match, the function will update the path to use the extension that
corresponds to `format` and warn the user.

## Usage

``` r
export_data(data = NULL, path = NULL, format = NULL)
```

## Arguments

- data:

  A dataframe or tibble to export.

- path:

  A character string specifying the file path for the exported file.

- format:

  Optional character string specifying the export format. Supported
  formats: "xlsx", "csv", "rds", "txt", "sav", "dta", "sas7bdat" (alias
  "xpt"). If NULL (default), the function infers the format from the
  `path` extension.

## Value

This function does not return a value. It writes the data to the
specified file path and displays a success message upon completion.

## Details

Supported formats and their functionality are provided via the package
dependencies:

- **xlsx**: Uses `openxlsx` for Excel exports.

- **csv**: Base R functionality.

- **rds**: Base R functionality.

- **txt**: Base R functionality with tab-separated values.

- **sav**: Uses `haven` for SPSS exports.

- **dta**: Uses `haven` for Stata exports.

- **sas7bdat**: Uses `haven` for SAS exports.

## Examples

``` r
if (FALSE) { # \dontrun{
df <- data.frame(Name = c("Alice", "Bob"), Age = c(25, 30))

# Infer format from path extension (no format argument)
export_data(df, path = "example.xlsx")
export_data(df, path = "example.csv")

# Explicit format (function will ensure path extension matches)
export_data(df, format = "csv", path = "example")         # adds .csv
export_data(df, format = "rds", path = "example.rds")
} # }
```
