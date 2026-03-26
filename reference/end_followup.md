# DIVINE's table on closure data

Information on closure data of patients included in the DIVINE cohort.
Data was collected at the end of hospitalization.

## Usage

``` r
data(end_followup)
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

- clinical_stability_days::

  Days from hospital admission to clinical stability

- exitus_days::

  Days from hospital admission to exitus

- discharge_days::

  Days from hospital admission to discharge

- discharge::

  A factor with levels `No` and `Yes`. Was the patient discharge from
  the hospital?

- exitus::

  A factor with levels `No` and `Yes`. Did the patient die during
  hospital admission?

## References

Pallarès, N., Tebé, C., Abelenda-Alonso, G., Rombauts, A., Oriol, I.,
Simonetti, A. F., Rodríguez-Molinero, A., Izquierdo, E., Díaz-Brito, V.,
Molist, G., Gómez Melis, G., Carratalà, J., Videla, S., & MetroSud and
Divine study groups (2023). Characteristics and Outcomes by Ceiling of
Care of Subjects Hospitalized with COVID-19 During Four Waves of the
Pandemic in a Metropolitan Area: A Multicenter Cohort Study. Infectious
diseases and therapy, 12(1), 273–289.
https://doi.org/10.1007/s40121-022-00705-w
