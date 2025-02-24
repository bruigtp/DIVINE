#' DIVINE's demographic database
#'
#' Demographic data of patients included in the DIVINE cohort. Data was collected at hospital admission.
#'
#' @docType data
#' @keywords datasets
#' @usage data(demographic)
#'
#'
#' @format A data frame with 5813 rows and 6 columns
#'  \describe{
#'   \item{record_id:}{Identifier of each record. This information does not match the real data.}
#'   \item{covid_wave:}{COVID-19 wave}
#'   \item{center:}{A factor with levels `Hospital A`, `Hospital B`, `Hospital C`, `Hospital D`, and             `Hospital E`. Center of admission}
#'   \item{sex:}{A factor with levels `Male` and `Female`. Sex at birth}
#'   \item{age:}{Age at hospital admission}
#'   \item{race:}{A factor with levels `Asian`, `Caucasian`, `Latina`, `Black`, and `Others`. Race}
#' }
#'
#' @references
#' Pallarès, N., Tebé, C., Abelenda-Alonso, G., Rombauts, A., Oriol, I., Simonetti, A. F., Rodríguez-Molinero, A., Izquierdo, E., Díaz-Brito, V., Molist, G., Gómez Melis, G., Carratalà, J., Videla, S., & MetroSud and Divine study groups (2023). Characteristics and Outcomes by Ceiling of Care of Subjects Hospitalized with COVID-19 During Four Waves of the Pandemic in a Metropolitan Area: A Multicenter Cohort Study. Infectious diseases and therapy, 12(1), 273–289. https://doi.org/10.1007/s40121-022-00705-w
#'
#'
"demographic"
