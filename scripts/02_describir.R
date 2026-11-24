
# PROYECTO FINAL - CASEN 2024
# HITO 2: ESTADISTICAS DESCRIPTIVAS

# PASO 1: CARGAR LA BASE LIMPIA

ruta_limpia <- "data/processed/casen_limpia.rds"

if (!file.exists(ruta_limpia)) {
  stop("Primero debes ejecutar scripts/01_limpiar.R")
}

casen_limpia <- readRDS(ruta_limpia)

# Verificar las dimensiones
dim(casen_limpia)


# PASO 2: ESTADISTICAS DESCRIPTIVAS

# Resumen de las variables principales
summary(
  casen_limpia[, c("esc", "edad", "ytrabajocor")]
)

# Promedio de escolaridad
mean(casen_limpia$esc, na.rm = TRUE)

# Promedio de ingreso laboral
mean(casen_limpia$ytrabajocor, na.rm = TRUE)

# Mediana de ingreso laboral
median(casen_limpia$ytrabajocor, na.rm = TRUE)

# Distribucion por sexo
table(casen_limpia$sexo)

# PASO 3: CREAR TABLA DESCRIPTIVA

# Variables que queremos resumir
variables <- c("esc", "edad", "ytrabajocor")

# Calcular estadisticas para cada variable
tabla_descriptiva <- data.frame(
  variable = variables,
  observaciones = sapply(casen_limpia[variables], length),
  promedio = sapply(casen_limpia[variables], mean),
  mediana = sapply(casen_limpia[variables], median),
  minimo = sapply(casen_limpia[variables], min),
  maximo = sapply(casen_limpia[variables], max)
)

# Mostrar la tabla
print(tabla_descriptiva)

# Guardar la tabla como archivo CSV
dir.create("output/tablas",
           recursive = TRUE,
           showWarnings = FALSE)

write.csv(
  tabla_descriptiva,
  "output/tablas/tabla_descriptiva.csv",
  row.names = FALSE
)
#el ingreso promedio es bastante mayor que la mediana, esto
#significa que la distribución está influida por ingresos elevados

