# Data Overview Function

This function provides a comprehensive overview of a data frame,
including its dimensions, variable types, missing values count and a
preview of the first few rows.

## Usage

``` r
data_overview(data, preview_rows = 6)
```

## Arguments

- data:

  A data frame. The dataset for which you want an overview.

- preview_rows:

  Integer. The number of rows to display in the preview. Default is 6.

## Value

A list containing the following components:

- dimensions:

  A vector of two elements: the number of rows and columns in the data.

- variable_types:

  A named vector with the class of each variable (column) in the data.

- missing_values:

  A named vector with the count of missing values (NA) for each
  variable.

- preview:

  A data frame showing the first `preview_rows` rows of the dataset.

## Details

The function is useful for quickly inspecting the structure of a data
frame and identifying any missing values or general characteristics of
the data. It also allows users to customize how many rows they want to
preview from the dataset.

## Examples

``` r
# Example usage with a simple data frame
data <- data.frame(
  Age = c(25, 30, NA, 22, 35),
  Height = c(175, 160, 180, NA, 165),
  Gender = c("Male", "Female", "Female", "Male", "Male")
)
overview <- data_overview(data, preview_rows = 4)
print(overview)
#> $dimensions
#> [1] 5 3
#> 
#> $variable_types
#>         Age      Height      Gender 
#>   "numeric"   "numeric" "character" 
#> 
#> $missing_values
#>    Age Height Gender 
#>      1      1      0 
#> 
#> $preview
#>   Age Height Gender
#> 1  25    175   Male
#> 2  30    160 Female
#> 3  NA    180 Female
#> 4  22     NA   Male
#> 

# Example usage with the default preview size (6 rows)
overview_default <- data_overview(data)
print(overview_default)
#> $dimensions
#> [1] 5 3
#> 
#> $variable_types
#>         Age      Height      Gender 
#>   "numeric"   "numeric" "character" 
#> 
#> $missing_values
#>    Age Height Gender 
#>      1      1      0 
#> 
#> $preview
#>   Age Height Gender
#> 1  25    175   Male
#> 2  30    160 Female
#> 3  NA    180 Female
#> 4  22     NA   Male
#> 5  35    165   Male
#> 
```
