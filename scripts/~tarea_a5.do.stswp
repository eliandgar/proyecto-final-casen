* A5 - Limpieza y descriptivos de CASEN
* Autor: Elizabeth Andrades
* Fecha: 17 de noviembre de 2026

clear all
set more off

* Ruta utilizada durante el desarrollo:
* cd "C:/Users/eli/Documents/proyecto-final-casen"

*ejecutar desde la carpeta principal del proyecto.
* Antes de correr, establecer esa carpeta con cd en Stata.

capture mkdir "output"
capture log close
log using "output/tarea_a5.log", replace text

* 2 -CARGAR LOS DATOS CASEN
* ============================================

import delimited "data/raw/casen_reducido.csv", clear varnames(1) encoding("utf-8")

describe
summarize

* 3 -CREAR VARIABLES
* ============================================

* para calcular experiencia laboral potencial
generate experiencia = max(edad - educ - 6, 0)

* para revisar la nueva variable
summarize experiencia

* para crear variable indicadora de educación alta
generate alta_educ = 0

* para asignar 1 a quienes tienen 13 años o más de educación
replace alta_educ = 1 if educ >= 13 & !missing(educ)

* para revisar distribución
tabulate alta_educ

* 4 -ETIQUETAR VARIABLES
* ============================================

* etiquetar las variables creadas
label variable experiencia "Experiencia potencial (años)"
label variable alta_educ "Indicador de educación alta"

* definir las categorías
label define nivel_educ 0 "Menos de 13 años" 1 "13 años o más"

* asignar etiquetas a la variable
label values alta_educ nivel_educ

* revisar los resultados
tabulate alta_educ

* 5 -REVISAR VALORES FALTANTES
* ============================================

* contar personas sin ingreso registrado
count if missing(ingreso)

* contar ingresos superiores a $500.000
* excluyendo valores faltantes
count if ingreso > 500000 & !missing(ingreso)

* 6 -ESTADISTICAS DESCRIPTIVAS
* ============================================

* Resumen de las variables numericas
summarize ingreso educ edad experiencia

* Distribucion por sector economico
tabulate sector

* Comparar nivel educativo segun genero
tabulate genero alta_educ

* Correlacion entre ingreso, educacion y experiencia
correlate ingreso educ experiencia

* 7 -INTERPRETACION ECONOMICA
* ============================================
* En la muestra analizada, el ingreso laboral promedio es de $655.291.
* Las personas presentan una escolaridad promedio de 12,73 años.
* La experiencia laboral potencial promedio es de 25,78 años.
* La correlación entre educación e ingresos es positiva (0,6767).
* La experiencia presenta una asociación negativa muy débil con el ingreso (-0,0875).
* Estos resultados muestran asociaciones estadísticas, pero no permiten afirmar causalidad.

* 8 -CERRAR BITACORA
* ============================================

log close
