# DIVINE's symptoms table

Information on COVID-19 associated symptoms of patients included in the
DIVINE cohort. Data was collected at hospital admission.

## Usage

``` r
data(symptoms)
```

## Format

A data frame with 5813 rows and 24 columns

- record_id::

  Identifier of each record. This information does not match the real
  data.

- covid_wave::

  A factor with levels `Wave 1`, `Wave 2`, `Wave 3`, and `Wave 5`.
  COVID-19 wave.

- center::

  A factor with levels `Hospital A`, `Hospital B`, `Hospital C`,
  `Hospital D`, and `Hospital E`. Center of admission

- symptoms_days::

  Days from symptoms onset to hospitalization

- rhinorrhea::

  A factor with levels `No` and `Yes`. Rhinorrhea

- anosmia::

  A factor with levels `No` and `Yes`. Anosmia

- ageusia::

  A factor with levels `No` and `Yes`. Ageusia

- arthromyalgia::

  A factor with levels `No` and `Yes`. Arthromyalgia

- odynophagia::

  A factor with levels `No` and `Yes`. Odynophagia

- fever::

  A factor with levels `No` and `Yes`. Fever

- cough::

  A factor with levels `No` and `Yes`. Cough

- dyspnea::

  A factor with levels `No` and `Yes`. Dyspnoea

- expectoration::

  A factor with levels `No` and `Yes`. Expectoration

- diarrhea::

  A factor with levels `No` and `Yes`. Diarrhea

- vomit::

  A factor with levels `No` and `Yes`. Vomiting

- nausea::

  A factor with levels `No` and `Yes`. Nausea

- asthenia::

  A factor with levels `No` and `Yes`. Asthenia

- anorexia::

  A factor with levels `No` and `Yes`. Anorexia

- cephal::

  A factor with levels `No` and `Yes`. Headache

- chest_pain::

  A factor with levels `No` and `Yes`. Chest pain

- abdominal_pain::

  A factor with levels `No` and `Yes`. Abdominal pain

- confusional_syndrome::

  A factor with levels `No` and `Yes`. Confusional syndrome

- shock_admission::

  A factor with levels `No` and `Yes`. Shock on admission

- bacterial_infection::

  A factor with levels `No` and `Yes`. Bacterial infection

## References

Pallarès, N., Carmezim, J., Rodríguez-Molinero, A., Coloma, A.,
Izquierdo, E., Díaz-Brito, V., Videla, S., Carratalà, J., Gómez-Melis,
G., & Tebé, C. (2026). A multicenter COVID-19 database from four waves
in the south metropolitan area of Barcelona, Catalonia. Scientific Data,
13(1), 1228.
[doi:10.1038/s41597-026-07479-7](https://doi.org/10.1038/s41597-026-07479-7)
