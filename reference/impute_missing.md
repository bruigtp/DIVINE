# Replace Missing Values

Replace missing values (NA) in a data.frame with a specified value or
method (such as mean, median, mode, constant, or custom function),
applying imputation column-wise.

## Usage

``` r
impute_missing(
  data,
  method = list(dplyr::where(is.numeric) ~ "mean", dplyr::where(is.character) ~ "mode",
    dplyr::where(is.factor) ~ "mode"),
  filter_by = NULL,
  drop_all_na = FALSE,
  verbose = TRUE
)
```

## Arguments

- data:

  A data frame. The dataset in which missing values should be imputed.

- method:

  A list of one-sided formulas of the form `<selector> ~ <value>`.
  Supported `<value>` options are:

  - `"mean"`: replace with the column mean (numeric columns only).

  - `"median"`: replace with the column median (numeric columns only).

  - `"mode"`: replace with the most frequent value (works for numeric,
    character, or factor).

  - A numeric constant: replace with that constant (numeric columns).

  - A character constant: replace with that value (character/factor
    columns).

  - A function: a function `function(col)` that receives the column and
    returns a single value to be used as replacement for NA.

  The default is
  `list(dplyr::where(is.numeric) ~ "mean",dplyr::where(is.character) ~ "mode",dplyr::where(is.factor) ~ "mode")`.

- filter_by:

  Character vector of column names. If provided, only rows that have
  **all** specified columns non-NA are kept (applied *before*
  imputation).

- drop_all_na:

  Logical; if `TRUE`, rows where **all** columns are `NA` are removed
  *before* imputation.

- verbose:

  Logical; if `TRUE` (default) print a concise final summary of what was
  imputed. Set to `FALSE` to suppress messages.

## Value

A tibble with missing values replaced according to the provided
specifications.

## Details

You can remove rows that are entirely `NA` before imputation using
`drop_all_na`, or filter rows based on specific variables using
`filter_by`.

- The `method` argument uses **tidyselect** helpers. For example,
  `where(is.numeric()) ~ "median"` imputes all numeric columns by their
  medians.

- `"mode"` works for numeric, character and factor columns.

- When imputing factors with a character constant, the constant is added
  as a new level if needed.

- When passing a custom function, it should return at least one value;
  if multiple values are returned, only the first is used (with a
  warning).

## Note

**Caution:** Single imputation methods may introduce bias or
underestimate variability in your data. For more robust handling of
missing data, consider multiple imputation approaches, such as those
implemented in the [`mice`](https://cran.r-project.org/package=mice)
package.

## Examples

``` r
# Impute all numeric columns by their means:
impute_missing(icu)
#> Imputation summary: Numeric variables imputed with mean; Categorical/Factor variables imputed with mode
#> # A tibble: 5,813 × 14
#>    record_id center     covid_wave icu   icu_enter_days icu_exit_days vent_mec
#>        <int> <fct>      <fct>      <fct>          <dbl>         <dbl> <fct>   
#>  1         1 Hospital C Wave 2     No              3.61          22.8 No      
#>  2         2 Hospital A Wave 2     No              3.61          22.8 No      
#>  3         3 Hospital A Wave 3     No              3.61          22.8 No      
#>  4         4 Hospital A Wave 3     No              3.61          22.8 No      
#>  5         5 Hospital C Wave 2     No              3.61          22.8 No      
#>  6         6 Hospital C Wave 1     Yes             2             28   Yes     
#>  7         7 Hospital E Wave 1     No              3.61          22.8 No      
#>  8         8 Hospital B Wave 1     No              3.61          22.8 No      
#>  9         9 Hospital C Wave 2     No              3.61          22.8 No      
#> 10        10 Hospital E Wave 1     No              3.61          22.8 No      
#> # ℹ 5,803 more rows
#> # ℹ 7 more variables: vent_mec_start_days <dbl>, vent_mec_end_days <dbl>,
#> #   vent_mec_no_inv <fct>, vent_mec_no_inv_start_days <dbl>,
#> #   vent_mec_no_inv_end_days <dbl>, sev_pneum <fct>, sev_pneum_days <dbl>

# Impute numeric columns by median:
impute_missing(
  icu,
  method = list(where(is.numeric) ~ "median")
)
#> Imputation summary: Numeric variables imputed with median
#> # A tibble: 5,813 × 14
#>    record_id center     covid_wave icu   icu_enter_days icu_exit_days vent_mec
#>        <int> <fct>      <fct>      <fct>          <dbl>         <dbl> <fct>   
#>  1         1 Hospital C Wave 2     No                 3            16 No      
#>  2         2 Hospital A Wave 2     No                 3            16 No      
#>  3         3 Hospital A Wave 3     No                 3            16 No      
#>  4         4 Hospital A Wave 3     No                 3            16 No      
#>  5         5 Hospital C Wave 2     No                 3            16 No      
#>  6         6 Hospital C Wave 1     Yes                2            28 Yes     
#>  7         7 Hospital E Wave 1     No                 3            16 No      
#>  8         8 Hospital B Wave 1     No                 3            16 No      
#>  9         9 Hospital C Wave 2     No                 3            16 No      
#> 10        10 Hospital E Wave 1     No                 3            16 No      
#> # ℹ 5,803 more rows
#> # ℹ 7 more variables: vent_mec_start_days <dbl>, vent_mec_end_days <dbl>,
#> #   vent_mec_no_inv <fct>, vent_mec_no_inv_start_days <dbl>,
#> #   vent_mec_no_inv_end_days <dbl>, sev_pneum <fct>, sev_pneum_days <dbl>

# Keep only rows where both "vent_mec_no_inv" and "vent_mec" are non-missing:
impute_missing(
  icu,
  filter_by = c("vent_mec_no_inv", "vent_mec")
)
#> Removed 6 rows that had NA in at least one of the 'filter_by' variables
#> Imputation summary: Numeric variables imputed with mean; Categorical/Factor variables imputed with mode
#> # A tibble: 5,807 × 14
#>    record_id center     covid_wave icu   icu_enter_days icu_exit_days vent_mec
#>        <int> <fct>      <fct>      <fct>          <dbl>         <dbl> <fct>   
#>  1         1 Hospital C Wave 2     No              3.61          22.9 No      
#>  2         2 Hospital A Wave 2     No              3.61          22.9 No      
#>  3         3 Hospital A Wave 3     No              3.61          22.9 No      
#>  4         4 Hospital A Wave 3     No              3.61          22.9 No      
#>  5         5 Hospital C Wave 2     No              3.61          22.9 No      
#>  6         6 Hospital C Wave 1     Yes             2             28   Yes     
#>  7         7 Hospital E Wave 1     No              3.61          22.9 No      
#>  8         8 Hospital B Wave 1     No              3.61          22.9 No      
#>  9         9 Hospital C Wave 2     No              3.61          22.9 No      
#> 10        10 Hospital E Wave 1     No              3.61          22.9 No      
#> # ℹ 5,797 more rows
#> # ℹ 7 more variables: vent_mec_start_days <dbl>, vent_mec_end_days <dbl>,
#> #   vent_mec_no_inv <fct>, vent_mec_no_inv_start_days <dbl>,
#> #   vent_mec_no_inv_end_days <dbl>, sev_pneum <fct>, sev_pneum_days <dbl>
```
