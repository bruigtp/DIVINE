# DIVINE's demographic table

Demographic data of patients included in the DIVINE cohort. Data was
collected at hospital admission.

## Usage

``` r
data(demographic)
```

## Format

A data frame with 5813 rows and 8 columns

- record_id::

  Identifier of each record. This information does not match the real
  data.

- covid_wave::

  A factor with levels `Wave 1`, `Wave 2`, `Wave 3`, and `Wave 5`.
  COVID-19 wave.

- center::

  A factor with levels `Hospital A`, `Hospital B`, `Hospital C`,
  `Hospital D`, and `Hospital E`. Center of admission

- sex::

  A factor with levels `Male` and `Female`. Sex at birth

- age::

  Age at hospital admission

- smoker::

  A factor with levels `Ex-smoker`, `No` and `Yes`. Smoking status

- alcohol::

  A factor with levels `No` and `Yes`. Consumption of alcohol

- residence_center::

  A factor with levels `No` and `Yes`. Is the patient currently living
  in a long-term facility?

## References

Pallarès, N., Carmezim, J., Rodríguez-Molinero, A., Coloma, A.,
Izquierdo, E., Díaz-Brito, V., Videla, S., Carratalà, J., Gómez-Melis,
G., & Tebé, C. (2026). A multicenter COVID-19 database from four waves
in the south metropolitan area of Barcelona, Catalonia. Scientific Data,
13(1), 1228.
[doi:10.1038/s41597-026-07479-7](https://doi.org/10.1038/s41597-026-07479-7)
