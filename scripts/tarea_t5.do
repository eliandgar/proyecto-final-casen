
* T5 - Do-file automatizado
* Semana 13
* Fundamentos de Programacion para Analisis Economico

version 14
clear all
set more off

* esto para crear carpeta de resultados si no existe
capture mkdir "output"

* cerrar cualquier registro anterior
capture log close

* para guardar los resultados de la tarea_t5
log using "output/tarea_t5.log", replace text

* 1 - PARAMETROS DE CONFIGURACION

local datos     "data/raw/casen_reducido.csv" 
local depvar    "ingreso"
local numericas "ingreso educ edad experiencia"
local controles "educ experiencia"
local grupos    "sector region genero"

global umbral = 500000

* se usa local porque estos parametros pertenecen a esta tarea
* se usa global para compartir el umbral entre distintos bloques

* 2 - CARGAR Y PREPARAR LOS DATOS

* importar la base CASEN reducida
import delimited "`datos'", clear varnames(1) encoding("utf-8")

* para calcular la experiencia laboral potencial
generate experiencia = max(edad - educ - 6, 0)

* crear una variable que indique el sexo
generate mujer = (genero == "F")

* definir etiquetas para los valores 0,1
label define sexo_lbl 0 "Hombre" 1 "Mujer"

* asignar las etiquetas a la variable
label values mujer sexo_lbl

* comprobar la distribucion
tabulate mujer

* 3 - ESTADISTICAS DESCRIPTIVAS AUTOMATIZADAS

* Recorrer las variables definidas en la macro numericas
foreach v of local numericas {
    summarize `v', detail
}


* 4 - TRAMOS DE EDUCACION

* para contar personas en distintos rangos de educación
forvalues t = 4(4)20 {
    quietly count if educ >= `t' & educ < `t' + 4
    display "Educacion de `t' a " `t' + 3 " años: " r(N) " personas"
}


* 5 - PROGRAMA REUTILIZABLE

* para eliminar una version anterior del programa si existe
capture program drop descriptivos_grupo

* esto para definir un programa que recibe una variable
program define descriptivos_grupo
    display _newline "=== Descriptivos por `1' ==="
    tabulate `1'
    tabstat ingreso educ, by(`1') statistics(mean sd n)
end

* ejecutar el programa para cada grupo
foreach g of local grupos {
    descriptivos_grupo `g'
}

* 6 - VARIABLE TEMPORAL

* crear un nombre temporal para trabajar con el ingreso
tempvar ing_miles

* expresar el ingreso en miles de pesos
generate `ing_miles' = ingreso / 1000

* revisar sus estadisticas descriptivas
summarize `ing_miles'

* 7 - MANEJO DE VALORES FALTANTES

* contar los ingresos que no estan registrados
count if missing(ingreso)

count if ingreso > $umbral & !missing(ingreso)

* 8 - MODELOS ECONOMETRICOS

* Modelo 1: ingreso, educacion y experiencia
quietly regress `depvar' `controles'

* esto para guardar el primer modelo
estimates store m1

* mostrar los resultados para revisarlos
estimates replay m1

*un año adicional de educación se asocia con aproximadamente $42.019 más de ingreso, manteniendo constante la experiencia laboral potencial.

*La experiencia presenta un coeficiente negativo muy pequeño, pero su valor p de 0,936 indica que no tenemos evidencia estadística suficiente para afirmar que su asociación con el ingreso sea distinta de cero


* Modelo 2: agregar la variable mujer
quietly regress `depvar' `controles' i.mujer

* guardar el segundo modelo
estimates store m2

* mostrar los resultados del modelo 2
estimates replay m2

*en el segundo modelo, el coeficiente de mujer es aproximadamente −$55.686 (valor p = 0,204). Es una asociación negativa estimada al controlar por educación y experiencia, pero no es estadísticamente significativa al 5 %.

*y el R² aumentó ligeramente, de 0,4580 a 0,4750, significa que hubo una leve mejora en el ajuste del modelo al agregar la varibale mujer

* comparar los dos modelos guardados
estimates table m1 m2, b(%9.0f) se stats(N r2) stfmt(%5.3f)

* recuperar el coeficiente de educacion del modelo 2
estimates restore m2
display "Coeficiente de educacion (M2): $" %12.2f _b[educ]

* 9 - REGRESIONES POR SECTOR

* identificar los sectores presentes en la base
levelsof sector, local(sectores)

* mostrar los sectores identificados
display `"`sectores'"'

* Crear una matriz para los resultados por sector
local nsectores : word count `sectores'

matrix resultados = J(`nsectores', 3, .)

matrix colnames resultados = coef_educ error_estandar N

* Recorrer cada sector y guardar sus resultados
local i = 1

foreach s of local sectores {

    * estimar la regresion para este sector
    quietly regress `depvar' educ if sector == "`s'"

    * guardar coeficiente de educacion
    matrix resultados[`i',1] = _b[educ]

    * guardar error estandar
    matrix resultados[`i',2] = _se[educ]

    * guardar numero de observaciones
    matrix resultados[`i',3] = e(N)

    * avanzar a la siguiente fila
    local i = `i' + 1
}

* Mostrar la matriz
matrix list resultados

* 10 - EXPORTAR RESULTADOS A EXCEL

* crear el archivo Excel
putexcel set "output/tarea_t5_por_sector.xlsx", replace

* escribir los encabezados
putexcel A1=("Sector") B1=("Coeficiente educacion") C1=("Error estandar") D1=("N")

* Exportar la matriz con los resultados numericos
putexcel B2=matrix(resultados)

* Escribir automaticamente los nombres de los sectores
local fila = 2

foreach s of local sectores {
    putexcel A`fila'=("`s'")
    local fila = `fila' + 1
}

* 11 - CERRAR REGISTRO DE RESULTADOS
*### Interpretación económica – T5

*En el primer modelo, un año adicional de educación se asocia con aproximadamente $42.019 más de ingreso laboral, manteniendo constante la experiencia.
*Al incorporar la variable mujer en el segundo modelo, esta asociación aumenta ligeramente a $42.246.
*El coeficiente de mujer es negativo (−$55.686), pero no es estadísticamente significativo al 5 %.
*El R² aumenta de 0,458 a 0,475, lo que representa una pequeña mejora en el ajuste del modelo.
*Las regresiones por sector muestran asociaciones positivas entre educación e ingresos, aunque sus coeficientes presentan diferencias.
*Los sectores con menos observaciones, como Construcción y Comercio, pueden presentar estimaciones menos precisas.
*Una limitación del análisis es el tamaño reducido de la muestra, por lo que los resultados no permiten establecer relaciones causales.

log close


