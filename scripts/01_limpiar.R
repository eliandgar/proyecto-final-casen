
# ==============================================
# PROYECTO FINAL - CASEN 2024
# HITO 2: LIMPIEZA DE DATOS
# ==============================================

# Objetivo:
# Preparar una muestra de personas adultas
# para analizar la asociacion entre
# educacion e ingresos laborales.

# PASO 1: VERIFICAR EL PROYECTO

if (!dir.exists("scripts")) {
  stop("Abre proyecto-final-casen.Rproj antes de ejecutar.")
}

# PASO 2: CARGAR PAQUETES

library(haven)
library(dplyr)

# PASO 3: VAMOS A LOCALIZAR LA BASE CASEN 2024

ruta_dta <- "data/raw/casen_2024.dta"

if (!file.exists(ruta_dta)) {
  stop("No se encontro casen_2024.dta en data/raw/")
}

# PASO 4: CARGAR LAS VARIABLES NECESARIAS

casen <- haven::read_dta(
  ruta_dta,
  col_select = c(
    esc,
    ytrabajocor,
    edad,
    sexo,
    expr,
    varstrat,
    varunit
  )
)

# Verificar las dimensiones y variables
dim(casen)
names(casen)

# PASO 5: REVISAR VALORES FALTANTES

# contar datos faltantes por variable
colSums(is.na(casen))

# eevisar distribucion de edad y educacion
summary(casen[, c("edad", "esc")])

# revisar ingresos laborales
summary(casen$ytrabajocor)

# revisar categorias de sexo
table(casen$sexo, useNA = "ifany")

#la base CASEN incluye a personas que no necesariamente trabajan, como estudiantes, niños y personas fuera de la fuerza laboral,
#esto significa que no hay que interpretar estos ingresos faltantes como iguales a 0

# PASO 6: DEFINIR LA MUESTRA DE ANALISIS

# Registrar cantidad inicial
n_inicial <- nrow(casen)

# Seleccionar adultos con informacion valida
casen_limpia <- casen |>
  filter(
    edad >= 18,
    !is.na(esc),
    !is.na(ytrabajocor),
    ytrabajocor > 0,
    !is.na(sexo),
    !is.na(expr),
    expr > 0
  )


# Comparar cantidad de observaciones
cat("Observaciones iniciales:", n_inicial, "\n")
cat("Observaciones finales:", nrow(casen_limpia), "\n")
cat("Observaciones excluidas:",
    n_inicial - nrow(casen_limpia), "\n")

# PASO 7: REVISAR VALORES EXTREMOS

# Resumen de los ingresos de la muestra
summary(casen_limpia$ytrabajocor)

# Percentiles de la distribucion
quantile(
  casen_limpia$ytrabajocor,
  probs = c(0.50, 0.90, 0.95, 0.99, 0.995, 1),
  na.rm = TRUE
)

# Contar ingresos superiores a 10 millones
sum(casen_limpia$ytrabajocor > 10000000)


# PASO 8: GUARDAR BASE LIMPIA

# Se conservan los ingresos extremos porque
# no se ha comprobado que sean errores.

# Guardar base para R
saveRDS(
  casen_limpia,
  "data/processed/casen_limpia.rds"
)

# Guardar base para Stata
haven::write_dta(
  casen_limpia,
  "data/processed/casen_limpia.dta"
)

# Verificar que los archivos existen
file.exists("data/processed/casen_limpia.rds")
file.exists("data/processed/casen_limpia.dta")

# Confirmar dimensiones de la base final
dim(casen_limpia)
