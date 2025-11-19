# Multi-Dataset Join Utility

This function performs a sequential join of multiple datasets by a
specified key column.

## Usage

``` r
multi_join(
  datasets,
  key = c("record_id", "covid_wave", "center"),
  join_type = "left"
)
```

## Arguments

- datasets:

  A list of data frames to be joined.

- key:

  A character string representing the key column to join by. Defaults to
  "record_id".

- join_type:

  A character string specifying the type of join. Options are "left",
  "right", "inner", or "full".

## Value

A single data frame containing the joined datasets.

## Examples

``` r
multi_join(
  list(analytics, comorbidities),
  join_type = "left"
)
#> # A tibble: 5,813 × 43
#>    record_id covid_wave center   analytics_available total_leukocytes hemoglobin
#>        <int> <fct>      <fct>    <chr>                          <dbl>      <dbl>
#>  1         1 Wave 2     Hospita… No                             NA          NA  
#>  2         2 Wave 2     Hospita… Yes                             3.94       12.9
#>  3         3 Wave 3     Hospita… Yes                             6.9        10  
#>  4         4 Wave 3     Hospita… Yes                             8.77       12.9
#>  5         5 Wave 2     Hospita… No                             NA          NA  
#>  6         6 Wave 1     Hospita… Yes                             3.81       NA  
#>  7         7 Wave 1     Hospita… Yes                             6.7        15.9
#>  8         8 Wave 1     Hospita… Yes                             4.6        12.9
#>  9         9 Wave 2     Hospita… Yes                             6.51        9.4
#> 10        10 Wave 1     Hospita… Yes                             8.6        14.2
#> # ℹ 5,803 more rows
#> # ℹ 37 more variables: total_lymphocytes <dbl>, d_dimer <dbl>,
#> #   c_reactive_protein <dbl>, sociofunctional <fct>, frailty <fct>,
#> #   barthel_score <dbl>, weight <dbl>, height <dbl>, body_mass_index <dbl>,
#> #   dm <fct>, type_dm <fct>, chronic_lung_disease <fct>,
#> #   chronic_kidney_disease <fct>, mild_kidney_disease <fct>,
#> #   renal_therapy <fct>, heart_disease <fct>, coronary_disease <fct>, …

multi_join(
  list(analytics, comorbidities),
  key = c("record_id", "covid_wave", "center"),
  join_type = "left"
)
#> # A tibble: 5,813 × 43
#>    record_id covid_wave center   analytics_available total_leukocytes hemoglobin
#>        <int> <fct>      <fct>    <chr>                          <dbl>      <dbl>
#>  1         1 Wave 2     Hospita… No                             NA          NA  
#>  2         2 Wave 2     Hospita… Yes                             3.94       12.9
#>  3         3 Wave 3     Hospita… Yes                             6.9        10  
#>  4         4 Wave 3     Hospita… Yes                             8.77       12.9
#>  5         5 Wave 2     Hospita… No                             NA          NA  
#>  6         6 Wave 1     Hospita… Yes                             3.81       NA  
#>  7         7 Wave 1     Hospita… Yes                             6.7        15.9
#>  8         8 Wave 1     Hospita… Yes                             4.6        12.9
#>  9         9 Wave 2     Hospita… Yes                             6.51        9.4
#> 10        10 Wave 1     Hospita… Yes                             8.6        14.2
#> # ℹ 5,803 more rows
#> # ℹ 37 more variables: total_lymphocytes <dbl>, d_dimer <dbl>,
#> #   c_reactive_protein <dbl>, sociofunctional <fct>, frailty <fct>,
#> #   barthel_score <dbl>, weight <dbl>, height <dbl>, body_mass_index <dbl>,
#> #   dm <fct>, type_dm <fct>, chronic_lung_disease <fct>,
#> #   chronic_kidney_disease <fct>, mild_kidney_disease <fct>,
#> #   renal_therapy <fct>, heart_disease <fct>, coronary_disease <fct>, …
```
