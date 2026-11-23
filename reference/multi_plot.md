# multi_plot: Flexible Static or Interactive Plotting of Variables

Generate a variety of plots—histogram, density, boxplot, barplot,
violin, scatter, heatmap, or spider (radar)—either as static ggplot2
objects or interactive Plotly widgets.

## Usage

``` r
multi_plot(
  data,
  x = NULL,
  y = NULL,
  plot_type = NULL,
  interactive = FALSE,
  fill_color = "steelblue",
  color = "black",
  bin_width = NULL,
  group = NULL,
  facet = NULL,
  radar = NULL,
  radar_color = "steelblue",
  radar_labels = NULL,
  radar_cex = 1,
  radar_ref_lev = "Yes",
  title = NULL,
  x_lab = NULL,
  y_lab = NULL,
  legend_position = "right",
  axis_text_angle = 0,
  axis_text_size = 12,
  title_size = 14,
  theme_custom = ggplot2::theme_minimal(),
  group_palette = NULL
)
```

## Arguments

- data:

  A data frame or tibble containing your data.

- x:

  Name of the variable for the x-axis as a character string. Optional
  for boxplots and unused for spider charts.

- y:

  Character; name of the variable for y-axis (required for boxplot,
  violin, scatter, and heatmap).

- plot_type:

  Character; one of `"histogram"`, `"density"`, `"boxplot"`,
  `"barplot"`, `"violin"`, `"scatter"`, `"heatmap"`, or `"spider"`.

- interactive:

  Logical; if `TRUE`, returns a Plotly interactive plot (not available
  for spider/radar charts). Default: `FALSE`.

- fill_color:

  Character; fill color for non-grouped geoms (default `"steelblue"`).

- color:

  Character; outline/line color (default `"black"`).

- bin_width:

  Numeric; bin width for histograms. If `NULL`, computed automatically.

- group:

  Character; name of grouping variable (optional).

- facet:

  Character; name of variable to facet by (optional).

- radar:

  Character vector; names of exactly 5 variables for spider plot (only
  for `"spider"`).

- radar_color:

  Character or vector; border/fill color for spider chart (only for
  `"spider"`).

- radar_labels:

  Character or vector; names of the variables for spider chart (only for
  `"spider"`).

- radar_cex:

  Numeric; font size for variable labels in the spider chart (only for
  `"spider"`).

- radar_ref_lev:

  Character; reference level for factors included in the spider chart
  (only for `"spider"`).

- title:

  Character; plot title (optional).

- x_lab:

  Character; x-axis label (defaults to `x`).

- y_lab:

  Character; y-axis label (defaults to `y` or `"Count"`).

- legend_position:

  Character; one of `"right","left","top","bottom","none"` (default
  `"right"`).

- axis_text_angle:

  Numeric; rotation angle (degrees) for x-axis tick labels (default
  `0`).

- axis_text_size:

  Numeric; size of axis text in pts (default `12`).

- title_size:

  Numeric; size of plot title text in pts (default `14`).

- theme_custom:

  A ggplot2 theme object (default `theme_minimal()`).

- group_palette:

  Optional character vector of colors for `group`. Name the colors with
  group values to assign them explicitly. An unnamed vector follows the
  order of the group levels. With a palette, numeric group values are
  treated as discrete levels. Available for histogram, density, boxplot,
  barplot, violin, and scatter plots.

## Value

A `ggplot` object (if `interactive = FALSE` or `plot_type = "spider"`)
or a `plotly` object (if `interactive = TRUE`).

## Details

- **Histogram:** requires `x`; uses `geom_histogram()`. Use for
  continuous numeric variables only.

- **Density:** requires `x`; uses `geom_density()`. It should be
  numeric.

- A **boxplot** requires a numeric `y`. Supply a categorical `x` to show
  distributions by category, or omit it to draw a single box. With
  `group` and no `x`, draws one box per group.

- A **violin plot** requires a categorical `x` and a numeric `y`.

- **Barplot:** requires `x`; counts occurrences. Use for categorical
  variables only.

- **Scatter:** requires both `x` and `y`; uses `geom_point()`. Both
  variables must be numeric.

- **Heatmap:** requires both `x` and `y`. Both variables must be
  categorical.

- **Spider:** requires `radar` (vector of variables); uses
  [`fmsb::radarchart()`](https://rdrr.io/pkg/fmsb/man/radarchart.html),
  static only.

## Examples

``` r

multi_plot(icu,
  x = "icu_enter_days",
  y = "vent_mec_start_days",
  plot_type = "scatter",
  color = "darkred",
  title = "ICU exit vs MV days"
)
#> Warning: Removed 5330 rows containing missing values or values outside the scale range
#> (`geom_point()`).


multi_plot(
  comorbidities,
  radar = c("hypertension", "dyslipidemia", "depression", "mild_kidney_disease", "dm"),
  radar_color = "steelblue",
  radar_ref_lev = "Yes",
  plot_type = "spider"
)

```
