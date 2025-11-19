# DIVINE's table on treatments previous to hospital admission

Information on previous treatments for patients included in the DIVINE
cohort. Data was collected at hospital admission.

## Usage

``` r
data(concomitant_medication)
```

## Format

A data frame with 5813 rows and 11 columns

- record_id::

  Identifier of each record. This information does not match the real
  data.

- covid_wave::

  A factor with levels `Wave 1`, `Wave 2`, `Wave 3`, and `Wave 5`.
  COVID-19 wave.

- center::

  A factor with levels `Hospital A`, `Hospital B`, `Hospital C`,
  `Hospital D`, and `Hospital E`. Center of admission

- statins_pre::

  A factor with levels `No` and `Yes`. Previous treatment with statins

- cortis_pre::

  A factor with levels `No` and `Yes`. Previous treatment with
  corticosteroids

- acei_pre::

  A factor with levels `No` and `Yes`. Previous treatment with
  angiotensin-converting enzyme (ACE) inhibitors

- ara2_pre::

  A factor with levels `No` and `Yes`. Previous treatment with
  angiotensin II receptor antagonists (ARA-II)

- cortis_systemic_pre::

  A factor with levels `No` and `Yes`. Routine treatment with systemic
  corticosteroids

- cortis_inhaled_pre::

  A factor with levels `No` and `Yes`. Routine treatment with inhaled
  corticosteroids

- anticoagulants_pre::

  A factor with levels `No` and `Yes`. Previous treatment with
  anticoagulants

- immunosuppre_pre::

  A factor with levels `No` and `Yes`. Previous treatment with
  immunosuppressants

## References

Pallarès, N., Tebé, C., Abelenda-Alonso, G., Rombauts, A., Oriol, I.,
Simonetti, A. F., Rodríguez-Molinero, A., Izquierdo, E., Díaz-Brito, V.,
Molist, G., Gómez Melis, G., Carratalà, J., Videla, S., & MetroSud and
Divine study groups (2023). Characteristics and Outcomes by Ceiling of
Care of Subjects Hospitalized with COVID-19 During Four Waves of the
Pandemic in a Metropolitan Area: A Multicenter Cohort Study. Infectious
diseases and therapy, 12(1), 273–289.
https://doi.org/10.1007/s40121-022-00705-w
