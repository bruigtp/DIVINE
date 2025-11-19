# DIVINE's table on information about comorbidities

Information about comorbidities of patients included in the DIVINE
cohort. Data was collected at hospital admission.

## Usage

``` r
data(comorbidities)
```

## Format

A data frame with 5813 rows and 37 columns

- record_id::

  Identifier of each record. This information does not match the real
  data.

- covid_wave::

  A factor with levels `Wave 1`, `Wave 2`, `Wave 3`, and `Wave 5`.
  COVID-19 wave.

- center::

  A factor with levels `Hospital A`, `Hospital B`, `Hospital C`,
  `Hospital D`, and `Hospital E`. Center of admission

- sociofunctional::

  A factor with levels `Lives with a spouse of similar age`,
  `Lives with a spouse with some degree of dependency`,
  `Lives with a non-family caregiver`,
  `Lives with family. The caregiver is not their spouse`,
  `Lives with family without physical dependency`,
  `Lives alone and has no children or they are far away`,
  `Lives alone and has nearby children`. Sociofunctional status

- frailty::

  A factor with levels `No`, `PCC` and `MACA`. Is the patient a chronic
  complex patient (PCC) or a patient with advanced chronic disease
  (MACA)?

- barthel_score::

  Punctuation in the Barthel scale used to measure performance in
  activities of daily living

- weight::

  Weight (kg)

- height::

  Height (cm)

- body_mass_index::

  Body mass index computed as \\\frac{\mbox{weight (kg)}}{\mbox{height
  (m)}^2}\\

- dm::

  A factor with levels `No` and `Yes`. Diabetes mellitus Type 2

- type_dm::

  A factor with levels `With target organ involvement` and
  `Without complications`. For patients with diabetes mellitus type 2,
  type of disease

- chronic_lung_disease::

  A factor with levels `No` and `Yes`. Chronic lung disease (including
  COPD, asthma and obstructive sleep apnea, among others)

- chronic_kidney_disease::

  A factor with levels `No` and `Yes`. Severe chronic kidney disease

- mild_kidney_disease::

  A factor with levels `No` and `Yes`. Mild kidney disease

- renal_therapy::

  A factor with levels `No` and `Yes`. Is the patient currently
  receiving renal replacement therapy?

- heart_disease::

  A factor with levels `No` and `Yes`. Heart failure

- coronary_disease::

  A factor with levels `No` and `Yes`. Coronary heart disease

- myocardial_infarction::

  A factor with levels `No` and `Yes`. Has the patient ever had a heart
  attack?

- hematologic_neo::

  A factor with levels `No` and `Yes`. Haematological neoplasia

- hematologic_neo_type::

  A factor with levels `Leukemia`, `Lymphoma` and `Myeloma`. For
  patients with Haematological neoplasia, type of disease.

- non_metastatic_neo::

  A factor with levels `No` and `Yes`. Non-Metastatic Neoplasia

- metastatic_neo::

  A factor with levels `No` and `Yes`. Metastatic Neoplasia

- stroke_tia::

  A factor with levels `No` and `Yes`. Has the patient ever had a stroke
  or a transient ischemic attack?

- peripheral_vasculopathy::

  A factor with levels `No` and `Yes`. Peripheral artery disease

- dementia::

  A factor with levels `No` and `Yes`. Dementia

- mild_liver_disease::

  A factor with levels `No` and `Yes`. Mild liver disease

- severe_liver_disease::

  A factor with levels `No` and `Yes`. Severe liver disease

- connective_tissue_disease::

  A factor with levels `No` and `Yes`. Connective tissue disease

- peptic_ulcer::

  A factor with levels `No` and `Yes`. Peptic ulcer

- hemiplegia::

  A factor with levels `No` and `Yes`. Hemiplegia

- hiv::

  A factor with levels `No` and `Yes`. Human immunodeficiency virus

- charlson_index::

  Value of the Charlson Comorbidity Index. This index predicts the
  ten-year mortality for a patient given the information of their
  comorbid conditions

- hypertension::

  A factor with levels `No` and `Yes`. Hypertension

- dyslipidemia::

  A factor with levels `No` and `Yes`. Dyslipidemia

- depression::

  A factor with levels `No` and `Yes`. Depression

- ceiling::

  A factor with levels `Oxygen mask` (non-rebreather oxygen mask),
  `HFNC or NIMV` (high-flow nasal cannula or non-invasive mechanical
  ventilation) and `IMV and ICU admission` (invasive mechanical
  ventilation and acces to intensive care unit). Therapeutic ceiling of
  care assigned to the patient

- ceiling_dico::

  A factor with the dichotomization of the variable ceiling in two
  levels `No` (`IMV and ICU admission`) and `Yes` (`Oxygen mask` and
  `HFNC or NIMV`)

## References

Pallarès, N., Tebé, C., Abelenda-Alonso, G., Rombauts, A., Oriol, I.,
Simonetti, A. F., Rodríguez-Molinero, A., Izquierdo, E., Díaz-Brito, V.,
Molist, G., Gómez Melis, G., Carratalà, J., Videla, S., & MetroSud and
Divine study groups (2023). Characteristics and Outcomes by Ceiling of
Care of Subjects Hospitalized with COVID-19 During Four Waves of the
Pandemic in a Metropolitan Area: A Multicenter Cohort Study. Infectious
diseases and therapy, 12(1), 273–289.
https://doi.org/10.1007/s40121-022-00705-w
