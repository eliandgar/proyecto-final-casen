
## Actividad A5 - Semana 12

Esta actividad realiza limpieza y estadísticas
descriptivas de la base CASEN reducida en Stata.

### Instrucciones de ejecución

1. Abrir Stata.
2. Descargar o clonar el repositorio.
3. Establecer como directorio de trabajo la
   carpeta principal del proyecto usando cd.
4. Ejecutar scripts/tarea_a5.do.

### Archivos

- scripts/tarea_a5.do: código de Stata.
- output/tarea_a5.log: registro de resultados.

### Uso de IA en la Actividad A5

- Herramienta utilizada: GEMINIS
- Uso: apoyo para comprender comandos de Stata.
- Trabajo realizado: ejecución de comandos,
  revisión de resultados y preparación de archivos.
- Verificación: se ejecutó el do-file completo
  y se revisaron sus resultados.



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

## T5 – Semana 13: Do-file automatizado

Esta tarea automatiza el análisis de la base CASEN reducida mediante macros, ciclos y un programa reutilizable en Stata.

Se utilizan regresiones para comparar dos modelos de ingreso laboral y estimar la asociación entre educación e ingresos por sector económico. Los resultados se exportan automáticamente a Excel.

**Archivos de entrega:**
- `scripts/tarea_t5.do`
- `output/tarea_t5.log`
- `output/tarea_t5_por_sector.xlsx`

**Para reutilizar el código:** ejecutar Stata desde la carpeta principal del proyecto y modificar las macros de configuración ubicadas al inicio del do-file. Si se utiliza otra base, verificar que contenga las variables necesarias.

## Declaración de autoría y uso de IA – T5

- **Herramienta utilizada:** ChatGPT.
- **Para qué la utilicé:** resolver errores durante la ejecución
- **Qué hice yo:** trabajé en el editor de Stata, ejecuté los bloques, comprobé las tablas y regresiones, revisé el archivo Excel y realicé las correcciones de las eejecuciones de los comandos.
- **Verificación:** revisé los resultados obtenidos y puedo explicar los procedimientos y comandos utilizados.