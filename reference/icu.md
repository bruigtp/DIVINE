# DIVINE's table on icu data

Information on ICU data of patients included in the DIVINE cohort. Data
was collected during hospitalization.

## Usage

``` r
data(icu)
```

## Format

A data frame with 5813 rows and 14 columns

- record_id::

  Identifier of each record. This information does not match the real
  data.

- covid_wave::

  A factor with levels `Wave 1`, `Wave 2`, `Wave 3`, and `Wave 5`.
  COVID-19 wave.

- center::

  A factor with levels `Hospital A`, `Hospital B`, `Hospital C`,
  `Hospital D`, and `Hospital E`. Center of admission

- icu::

  A factor with levels `No` and `Yes`. Was the patient admitted to the
  ICU?

- icu_enter_days::

  Days from hospital admission to ICU admission.

- icu_exit_days::

  Days from hospital admission to ICU discharge.

- vent_mec::

  A factor with levels `No` and `Yes`. Did the patient received invasive
  mechanical ventilation?

- vent_mec_start_days::

  Days from hospital admission to start of invasive mechanical
  ventilation.

- vent_mec_end_days::

  Days from hospital admission to end of invasive mechanical
  ventilation.

- vent_mec_no_inv::

  A factor with levels `No` and `Yes`. Did the patient received
  non-invasive mechanical ventilation?

- vent_mec_no_inv_start_days::

  Days from hospital admission to start of non-invasive mechanical
  ventilation.

- vent_mec_no_inv_end_days::

  Days from hospital admission to end of non-invasive mechanical
  ventilation.

- sev_pneum:

  A factor with levels `No` and `Yes`. Did the patient required a
  sustained supply of oxygen therapy greater than FiO2 of 35% to
  maintain oxygen saturation above 95%?

- sev_pneum_days:

  Days from hospital admission to development of severe pneumonia.

## References

Pallarès, N., Carmezim, J., Rodríguez-Molinero, A., Coloma, A.,
Izquierdo, E., Díaz-Brito, V., Videla, S., Carratalà, J., Gómez-Melis,
G., & Tebé, C. (2026). A multicenter COVID-19 database from four waves
in the south metropolitan area of Barcelona, Catalonia. Scientific Data,
13(1), 1228.
[doi:10.1038/s41597-026-07479-7](https://doi.org/10.1038/s41597-026-07479-7)
