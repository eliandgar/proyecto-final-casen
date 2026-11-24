------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Proyecto Final – Hito 2: Avance

### Objetivo

Analizar la asociación entre los años de escolaridad y los ingresos laborales de personas adultas en Chile, utilizando datos de CASEN 2024.

### Datos

- **Fuente:** Encuesta CASEN 2024, Ministerio de Desarrollo Social y Familia.
- **Archivo original:** `data/raw/casen_2024.dta`.
- **Unidad de análisis:** personas de 18 años o más, con información válida de escolaridad e ingresos laborales positivos.
- **Muestra utilizada:** 98.583 observaciones.
- **Variables principales:** escolaridad (`esc`), ingreso laboral corregido (`ytrabajocor`), edad (`edad`) y sexo (`sexo`).
- **Diseño muestral:** factor de expansión `expr`, estratos `varstrat` y conglomerados `varunit`.

### Estructura y ejecución

Los archivos deben ejecutarse desde la carpeta principal del proyecto, en el siguiente orden:

1. `scripts/01_limpiar.R`: lee la base CASEN original, aplica los filtros documentados y genera `casen_limpia.rds` y `casen_limpia.dta` en `data/processed`.
2. `scripts/02_describir.R`: produce estadísticas descriptivas y guarda `output/tablas/tabla_descriptiva.csv`.
3. `scripts/03_modelar.do`: estima una regresión inicial y una regresión que considera el diseño muestral de CASEN. Guarda los resultados en `output/03_modelar.log`.

Para ejecutar el proyecto se requiere R con los paquetes `haven` y `dplyr`, además de Stata.

La base original CASEN 2024 debe descargarse desde la fuente oficial y ubicarse como `data/raw/casen_2024.dta`, ya que los archivos de datos originales y procesados no se incluyen en el repositorio.

### Limpieza y criterios de selección

Se seleccionaron personas adultas con ingresos laborales positivos, escolaridad registrada y factor de expansión válido. La muestra pasó de 218.367 a 98.583 observaciones.

Los ingresos excepcionalmente elevados se conservaron porque no se comprobó que correspondieran a errores. Su influencia constituye un aspecto que debe evaluarse al interpretar los resultados.

### Avance del análisis

Se estimó un modelo lineal de ingresos laborales utilizando escolaridad, edad y sexo como variables explicativas, junto con una segunda especificación que incorpora el diseño muestral mediante `svyset` y `svy:` en Stata.

Los resultados representan asociaciones estadísticas y no deben interpretarse como efectos causales. Las estimaciones del diseño muestral son preliminares mientras se revisa el tratamiento de la subpoblación analizada.

### Declaración de autoría humana y uso de tecnologías digitales emergentes – Hito 2

- **Integrantes y responsabilidades:** Elizabeth Andrades. Desarrollo, ejecución y revisión del análisis de CASEN 2024.
- **Herramienta de IA utilizada:** ChatGPT.
- **Para qué se utilizó:**explicación de comandos de R y Stata; resolución de dudas técnicas y revisión de errores.
- **Qué hice yo:** ejecuté y revisé los códigos en RStudio y Stata, comprobación de los datos y resultados, la verificación la generación de los archivos
- **Verificación:** los scripts fueron ejecutados y sus resultados comprobados. 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
