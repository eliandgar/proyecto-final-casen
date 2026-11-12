
# Proyecto Final - Análisis Económico

## Tema
Educación e ingresos laborales en Chile utilizando CASEN 2024.

## Pregunta de investigación
¿Cómo se relacionan los años de educación con los ingresos laborales mensuales de las personas en Chile y cómo varía esta asociación según el sexo?

## Objetivo
Analizar la relación entre educación e ingresos laborales en Chile, considerando las diferencias entre hombres y mujeres.

## Fuente de datos
Encuesta de Caracterización Socioeconómica Nacional (CASEN 2024).

Ministerio de Desarrollo Social y Familia.

https://bidat.gob.cl/details/ficha/dataset/base-de-datos-casen-2024

## Metodología propuesta
Se utilizarán estadísticas descriptivas y modelos de regresión lineal para estudiar la asociación entre los años de escolaridad y los ingresos laborales.

## Herramientas
- RStudio: exploración de datos y elaboración de gráficos.
- Stata: estimación de modelos econométricos.

## Estado del proyecto
Hito 1: propuesta inicial en elaboración.

## Declaración de autoría humana y uso de tecnologías digitales emergentes
- Integrantes y responsabilidades: Trabajo individual. Responsable de la selección del tema, preparación de datos, análisis y revisión de resultados.
- Herramientas de IA utilizadas: ChatGPT.
- Para qué se utilizaron: comprender comandos de R y configurar GitHub.
- Trabajo realizado por el estudiante: Descarga de CASEN 2024, ejecución de comandos en RStudio, exploración inicial y revisión de resultados.
- Verificación: El código y las interpretaciones serán revisados para asegurar su comprensión antes de la entrega.


==============================================
## Cómo reproducir el análisis

Este proyecto utiliza los datos de la Encuesta
CASEN 2024 para estudiar la relación entre
educación e ingresos laborales en Chile.

### 1. Descargar los datos

La base CASEN 2024 está disponible en:

https://bidat.gob.cl/details/ficha/dataset/base-de-datos-casen-2024

Descargar la base en formato Stata (.dta).

### 2. Preparar los archivos

Guardar el archivo `casen_2024.dta` en:

`data/raw/`

También se puede utilizar el archivo
`casen_2024stata.zip`, sin descomprimirlo,
si contiene `casen_2024.dta`.

La base original no se incluye en GitHub
debido a su tamaño.

### 3. Ejecutar el proyecto

1. Instalar R y RStudio.
2. Abrir `proyecto-final-casen.Rproj`.
3. Abrir `scripts/00_explorar_casen.R`.
4. Ejecutar el script completo con Source.

El script comprueba los paquetes necesarios,
carga CASEN 2024, selecciona las variables,
aplica los filtros y guarda la muestra.

### 4. Resultado esperado

La muestra preliminar contiene:

- 98.583 observaciones.
- 7 variables.

El archivo generado se guarda en:

`data/processed/casen_modelo_preliminar.rds`

Estos resultados corresponden a la exploración
inicial del Hito 1.
