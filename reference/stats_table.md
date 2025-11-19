# Create Summary Table

This function generates a summary table using the `gtsummary` package.
It allows customization of the reported statistics for continuous
variables and categorical variables. Users can optionally include
p-values for group comparisons and manage the reporting of missing
values.

## Usage

``` r
stats_table(
  data,
  vars = NULL,
  var_labels = NULL,
  by = NULL,
  statistic_type = "mean_sd",
  pvalue = FALSE,
  test_method = NULL,
  include_na = TRUE
)
```

## Arguments

- data:

  A data frame containing the dataset.

- vars:

  A character vector of variable names to include in the summary. If
  NULL (default), all variables are included.

- var_labels:

  A list of labels to replace variable names in the table.

- by:

  A character string specifying a grouping variable. If NULL (default),
  no grouping is applied.

- statistic_type:

  A character string specifying the type of statistic to report **for
  continuous variables**. Options are:

  - "mean_sd": Mean (SD) for continuous variables.

  - "median_iqr": Median (Q1; Q3) for continuous variables.

  - "both": Both Mean (SD) and Median (Q1; Q3).

- pvalue:

  A logical value indicating whether to include p-values in the summary.
  Defaults to FALSE.

- test_method:

  Optional. Only used if `pvalue = TRUE`. A list specifying custom
  statistical tests for each variable. If NULL, `gtsummary` will choose
  default tests based on variable type.

- include_na:

  A logical value indicating whether to include rows with missing values
  in the output. Defaults to TRUE.

## Value

A gtsummary table object.

## Examples

``` r
# Mean ± SD summary
stats_table(
  vital_signs,
  vars = c("temperature", "saturation"),
  by = "supporto2",
  statistic_type = "mean_sd"
)
#> 5 missing rows in the "supporto2" column have been removed.


  

Variables
```

**No**  
N = 3,971¹

**Yes**  
N = 1,837¹

Temperature

36.99 (0.96)

36.89 (0.96)

    Unknown

77

23

Oxygen saturation

93.94 (5.70)

94.45 (5.31)

    Unknown

55

5

¹ Mean (SD)

\# Both mean ± SD and median \[Q1; Q3\] stats_table( vital_signs,
statistic_type = "both", include_na = FALSE )

[TABLE]

\# Add p-value with default tests stats_table( vital_signs, vars =
[c](https://rdrr.io/r/base/c.html)("temperature", "saturation"), by =
"supporto2", pvalue = TRUE ) \#\> 5 missing rows in the "supporto2"
column have been removed. \#\> The following errors were returned during
\`add_p()\`: \#\> ✖ For variable \`saturation\` (\`supporto2\`) and
"estimate", "std.error", \#\> "parameter", "statistic", "conf.low",
"conf.high", and "p.value" statistics: \#\> The package "broom" (\>=
1.0.8) is required. \#\> ✖ For variable \`temperature\` (\`supporto2\`)
and "estimate", "std.error", \#\> "parameter", "statistic", "conf.low",
"conf.high", and "p.value" statistics: \#\> The package "broom" (\>=
1.0.8) is required.

[TABLE]

\# Add p-value and define method stats_table( vital_signs, vars =
[c](https://rdrr.io/r/base/c.html)("temperature", "saturation"), by =
"supporto2", pvalue = TRUE, test_method =
[list](https://rdrr.io/r/base/list.html)(temperature ~ "t.test") ) \#\>
5 missing rows in the "supporto2" column have been removed. \#\> The
following errors were returned during \`add_p()\`: \#\> ✖ For variable
\`saturation\` (\`supporto2\`) and "estimate", "std.error", \#\>
"parameter", "statistic", "conf.low", "conf.high", and "p.value"
statistics: \#\> The package "broom" (\>= 1.0.8) is required. \#\> ✖ For
variable \`temperature\` (\`supporto2\`) and "estimate", "std.error",
\#\> "parameter", "statistic", "conf.low", "conf.high", and "p.value"
statistics: \#\> The package "broom" (\>= 1.0.8) is required.

[TABLE]
