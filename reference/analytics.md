# DIVINE's table on laboratory data

Information on laboratory data of patients included in the DIVINE
cohort. Data was collected at hospital admission.

## Usage

``` r
data(analytics)
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

- analytics_available::

  Is there an analytic available for this patient?

- total_leukocytes::

  Total leukocytes (mil/mm³)

- hemoglobin::

  Hemoglobin (g/dl)

- total_lymphocytes::

  Total lymphocytes (mil/mm³)

- d_dimer::

  D-dimer (µg/L)

- c_reactive_protein::

  C-reactive protein (mg/L)

## References

Pallarès, N., Carmezim, J., Rodríguez-Molinero, A., Coloma, A.,
Izquierdo, E., Díaz-Brito, V., Videla, S., Carratalà, J., Gómez-Melis,
G., & Tebé, C. (2026). A multicenter COVID-19 database from four waves
in the south metropolitan area of Barcelona, Catalonia. Scientific Data,
13(1), 1228.
[doi:10.1038/s41597-026-07479-7](https://doi.org/10.1038/s41597-026-07479-7)
