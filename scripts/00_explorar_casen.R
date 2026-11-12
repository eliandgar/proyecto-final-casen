
# ==============================================
# PROYECTO FINAL - ANALISIS ECONOMICO
# Tema: Educacion e ingresos con CASEN 2024
# Hito 1: Exploracion inicial
# Elizabeth Andrades
# ==============================================

# PASO 1: VERIFICAR PROYECTO

# Ejecutar desde la carpeta principal del
# proyecto, abriendo el archivo .Rproj

if (!dir.exists("scripts")) {
  stop("Abre proyecto-final-casen.Rproj antes de ejecutar.")
}

dir.create("data/raw",
           recursive = TRUE,
           showWarnings = FALSE)

dir.create("data/processed",
           recursive = TRUE,
           showWarnings = FALSE)

# PASO 2: CARGAR PAQUETES

paquetes <- c("haven", "dplyr")

for (p in paquetes) {
  if (!requireNamespace(p, quietly = TRUE)) {
    install.packages(p)
  }
}

library(haven)
library(dplyr)

# PASO 3: LOCALIZAR BASE CASEN 2024

ruta_dta <- "data/raw/casen_2024.dta"
ruta_zip <- "data/raw/casen_2024stata.zip"

# Descomprimir solo si no existe el .dta

if (!file.exists(ruta_dta)) {
  
  if (!file.exists(ruta_zip)) {
    stop(
      "Falta la base CASEN 2024. Descarga el archivo ",
      "desde BIDAT y coloca casen_2024.dta ",
      "o casen_2024stata.zip en data/raw/"
    )
  }
  
  unzip(
    ruta_zip,
    files = "casen_2024.dta",
    exdir = "data/raw"
  )
}

if (!file.exists(ruta_dta)) {
  stop("No se encontro casen_2024.dta despues de descomprimir.")
}

# PASO 4: CARGAR VARIABLES NECESARIAS

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

dim(casen)
names(casen)
head(casen)

# PASO 5: EXPLORAR LOS DATOS

str(casen)
colSums(is.na(casen))
summary(casen)
table(casen$sexo, useNA = "ifany")
sum(casen$ytrabajocor > 0, na.rm = TRUE)

# PASO 6: PREPARAR LA MUESTRA

casen_modelo <- casen |>
  filter(
    edad >= 18,
    !is.na(esc),
    !is.na(ytrabajocor),
    ytrabajocor > 0,
    !is.na(sexo),
    !is.na(expr),
    expr > 0
  )

dim(casen_modelo)

summary(
  casen_modelo[, c("esc", "edad", "ytrabajocor")]
)

table(casen_modelo$sexo)

# PASO 7: GUARDAR MUESTRA PRELIMINAR

saveRDS(
  casen_modelo,
  "data/processed/casen_modelo_preliminar.rds"
)

# PASO 8: VERIFICAR RESULTADOS

print(dim(casen_modelo))

print(file.exists(
  "data/processed/casen_modelo_preliminar.rds"
))

message("Exploracion CASEN finalizada correctamente.")
