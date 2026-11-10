# DIVINE's table on complications data

Information on complications data of patients included in the DIVINE
cohort. Data was collected during hospitalization.

## Usage

``` r
data(complications)
```

## Format

A data frame with 5813 rows and 9 columns

- record_id::

  Identifier of each record. This information does not match the real
  data.

- covid_wave::

  A factor with levels `Wave 1`, `Wave 2`, `Wave 3`, and `Wave 5`.
  COVID-19 wave.

- center::

  A factor with levels `Hospital A`, `Hospital B`, `Hospital C`,
  `Hospital D`, and `Hospital E`. Center of admission

- comp::

  A factor with levels `No` and `Yes`. Did the patient experiment a
  complication while hospitalised?

- kidney_failure::

  A factor with levels `No` and `Yes`. Did the patient experiment kidney
  failure during hospital admission?

- mental_status_change::

  A factor with levels `No` and `Yes`. Did the patient experiment a
  change in its mental status during hospital admission?

- nosocomial_infection::

  A factor with levels `No` and `Yes`. Did the patient experiment a
  nosocomial infection during hospital admission?

- comp_cardiac::

  A factor with levels `No` and `Yes`. Did the patient experiment a
  cardiac complication during hospital admission? Cardiac complications
  included heart failure and acute coronary event.

- comp_respiratory::

  A factor with levels `No` and `Yes`. Did the patient experiment a
  respiratory complication during hospital admission? Respiratory
  complications included acute respiratory failure, venous
  thromboembolism, and pneumonia.

## References

Pallarès, N., Carmezim, J., Rodríguez-Molinero, A., Coloma, A.,
Izquierdo, E., Díaz-Brito, V., Videla, S., Carratalà, J., Gómez-Melis,
G., & Tebé, C. (2026). A multicenter COVID-19 database from four waves
in the south metropolitan area of Barcelona, Catalonia. Scientific Data,
13(1), 1228.
[doi:10.1038/s41597-026-07479-7](https://doi.org/10.1038/s41597-026-07479-7)
