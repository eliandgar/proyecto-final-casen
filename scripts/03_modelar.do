
* ==========================================
* PROYECTO FINAL - CASEN 2024
* HITO 2: MODELO ECONOMETRICO
* ==========================================

* 1: CONFIGURACION INICIAL

version 14
clear all
set more off

* Guardar registro de la ejecucion
capture mkdir "output"
capture log close
log using "output/03_modelar.log", replace text


* 2: CARGAR LA BASE LIMPIA

use "data/processed/casen_limpia.dta", clear

* Verificar observaciones y variables
describe
count

* 3: REVISAR VARIABLES DEL MODELO

* Verificar categorias de sexo
tabulate sexo

* Revisar escolaridad e ingresos
summarize esc edad ytrabajocor

* 4: ESTIMAR MODELO INICIAL

* Regresion de ingreso sobre escolaridad, edad y sexo
regress ytrabajocor esc edad i.sexo

* Guardar resultados del modelo
estimates store modelo1

*El R² es 0,2046, lo que significa que el modelo explica aproximadamente el 20,46 % de la variación observada en los ingresos laborales.

*en educación un año adicional de escolaridad se asocia con aproximadamente $109.833 más de ingreso laboral, manteniendo constantes la edad y el sexo.

* 5: CONFIGURAR DISEÑO MUESTRAL

* Declarar ponderaciones, estratos y conglomerados
svyset varunit [pweight=expr], strata(varstrat)

* Comprobar la configuracion
svyset

* PASO 6: REGRESION CON DISENO MUESTRAL

* Estimar la asociacion entre ingreso,
* escolaridad, edad y sexo
svy: regress ytrabajocor esc edad i.sexo

* Guardar el modelo
estimates store modelo_svy

* Cerrar registro
log close