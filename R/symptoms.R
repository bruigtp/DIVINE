#' DIVINE's demographic database
#'
#' Information on COVID-19 associated symptoms of patients included in the DIVINE cohort. Data was collected at hospital admission.
#'
#' @docType data
#' @keywords datasets
#' @usage data(symptoms)
#'
#'
#' @format A data frame with 5813 rows and 24 columns
#'  \describe{
#'   \item{record_id:}{Identifier of each record. This information does not match the real data.}
#'   \item{covid_wave:}{COVID-19 wave}
#'   \item{center:}{A factor with levels `Hospital A`, `Hospital B`, `Hospital C`, `Hospital D`, and             `Hospital E`. Center of admission}
#'   \item{symptom_onset_date:}{}
#'   \item{rhinorrhea:}{Rhinorrhea}
#'   \item{anosmia:}{Anosmia}
#'   \item{ageusia:}{Ageusia}
#'   \item{arthromyalgia:}{Arthromyalgia}
#'   \item{odynophagia:}{Odynophagia}
#'   \item{fever:}{Fever}
#'   \item{cough:}{Cough}
#'   \item{dyspnea:}{Dyspnoea}
#'   \item{expectoration:}{Expectoration}
#'   \item{diarrhea:}{Diarrhea}
#'   \item{vomit:}{Vomiting}
#'   \item{nausea:}{Nausea}
#'   \item{asthenia:}{Asthenia}
#'   \item{anorexia:}{Anorexia}
#'   \item{cephal:}{Headache}
#'   \item{chest_pain:}{Chest pain}
#'   \item{abdominal_pain:}{Abdominal pain}
#'   \item{confusional_syndrome:}{Confusional syndrome}
#'   \item{shock_admission:}{Shock on admission}
#'   \item{bacterial_infection:}{Bacterial infection}
#' }
#'
#' @references
#' Pallarès, N., Tebé, C., Abelenda-Alonso, G., Rombauts, A., Oriol, I., Simonetti, A. F., Rodríguez-Molinero, A., Izquierdo, E., Díaz-Brito, V., Molist, G., Gómez Melis, G., Carratalà, J., Videla, S., & MetroSud and Divine study groups (2023). Characteristics and Outcomes by Ceiling of Care of Subjects Hospitalized with COVID-19 During Four Waves of the Pandemic in a Metropolitan Area: A Multicenter Cohort Study. Infectious diseases and therapy, 12(1), 273–289. https://doi.org/10.1007/s40121-022-00705-w
#'
#'
"symptoms"
