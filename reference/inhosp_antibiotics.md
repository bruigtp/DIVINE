# DIVINE's table on antibiotics received during hospitalization

Information on antibiotics received for patients included in the DIVINE
cohort. Data was collected during hospitalization.

## Usage

``` r
data(inhosp_antibiotics)
```

## Format

A data frame with 5813 rows and 17 columns

- record_id::

  Identifier of each record. This information does not match the real
  data.

- covid_wave::

  A factor with levels `Wave 1`, `Wave 2`, `Wave 3`, and `Wave 5`.
  COVID-19 wave.

- center::

  A factor with levels `Hospital A`, `Hospital B`, `Hospital C`,
  `Hospital D`, and `Hospital E`. Center of admission

- any_antibiotic::

  A factor with levels `No` and `Yes`. Did the patient receive treatment
  with antibiotics during hospital admission?

- amoxicillin::

  A factor with levels `No` and `Yes`. Treatment with amoxicillin

- amoxicillin_clavulanic_acid::

  A factor with levels `No` and `Yes`. Treatment with amoxicillin and
  clavulanic acid

- azithromycin::

  A factor with levels `No` and `Yes`. Treatment with azithromycin

- ceftriaxone::

  A factor with levels `No` and `Yes`. Treatment with ceftriaxone

- ciprofloxacin::

  A factor with levels `No` and `Yes`. Treatment with ciprofloxacin

- cotrimoxazole::

  A factor with levels `No` and `Yes`. Treatment with cotrimoxazole

- levofloxacin::

  A factor with levels `No` and `Yes`. Treatment with levofloxacin

- linezolid::

  A factor with levels `No` and `Yes`. Treatment with linezolid

- meropenem::

  A factor with levels `No` and `Yes`. Treatment with meropenem

- piperacillin::

  A factor with levels `No` and `Yes`. Treatment with piperacillin

- piperacillin_tazobactam::

  A factor with levels `No` and `Yes`. Treatment with
  piperacillin+tazobactam

- teicoplanin::

  A factor with levels `No` and `Yes`. Treatment with teicoplanin

- other_antibiotic::

  A factor with levels `No` and `Yes`. Treatment with another antibiotic

## References

Pallarès, N., Tebé, C., Abelenda-Alonso, G., Rombauts, A., Oriol, I.,
Simonetti, A. F., Rodríguez-Molinero, A., Izquierdo, E., Díaz-Brito, V.,
Molist, G., Gómez Melis, G., Carratalà, J., Videla, S., & MetroSud and
Divine study groups (2023). Characteristics and Outcomes by Ceiling of
Care of Subjects Hospitalized with COVID-19 During Four Waves of the
Pandemic in a Metropolitan Area: A Multicenter Cohort Study. Infectious
diseases and therapy, 12(1), 273–289.
https://doi.org/10.1007/s40121-022-00705-w
