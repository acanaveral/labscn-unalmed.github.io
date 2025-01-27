<!---
layout: curso
title: 'Trabajos'
curso: 'estadistica-espacial'
custom_js: 'mathjax'
order: 05
---

## Contenido
{: .no_toc}

* ToC
{: toc}



## Primer trabajo en grupo

### Objetivo

Calcular y graficar un correlograma, autocorrelación y
semivariograma empírico con los datos del ruido.

### Material guía.

- [Comprimido de bases de datos](https://www.dropbox.com/s/8ywui8x3ns9zn1c/trabajo_grupal_1.zip?dl=0)
- [Archivo en formato ".Rmd"](./guiones/Trabajo1.Rmd)
- [Guión de elementos inciales](./guiones/Trabajo1.html)
- [Archivo de calibraciones](./datos/calibracion.xlsx)

### Actividades

- Conformar grupos de máximo tres (3) personas.

- Llevar todas la bases de datos a un horizonte común de tiempos
  entre 1 y 20 segundos. (Cada grupo elige nivel).

- Graficar el conjunto de realizaciones dado el nivel de segundos elegidos.
  Utilizando un difuminado o una transparencia para facilitar
  la visualización.

- Mostrar la distribución en cada punto del sonido,
    con los valores originales y otro con los valores corregidos
    por la calibración realizada previamente. (Verificar comportamiento de valores centrales y de dispersión.)

- Hallar la correlación  de cada punto de coordenada con todos los demás.
  (Matriz de correlación
  de los datos tomados) Tanto corregido como si corregir y comparar.

- Graficar la función de autocorrelación.

- Hallar el semivariograma de los datos de sonido.

- Repetir el ejercicio utilizando otro nivel común de tiempo mayor de 20
  segundos. Comparar los resultados con los obtenidos anteriormente.

### Documentos a entregar

- Documento en formato ".Rmd" con el código utilizado.
- Documento en formato ".html" con el informe de los resultados obtenidos.

### Fecha de entrega

Miércoles, 28 de febrero de 2018 al correo **krcabrer@unal.edu.co** y
no olvidar escibir en asunto **[EE]**.


## Primer trabajo individual

[Enunciado del primer trabajo individual](./guiones/trabajo_individual1.html)
-->

<!---
## Contenido
{: .no_toc}

* ToC
{: toc}

## Primer trabajo en grupo

### Objetivo

Calcular y graficar un correlograma, autocorrelación y
variograma empírico con los datos del ruido y
la luminosidad utilizando como punto de partida las coordenadas
propias de cada grupo y los datos de los demás compañeros
a las distancias respectivas.

### Actividades

- Hallar la distancia desde el punto de partida hasta cada uno
  de los puntos de los demás compañeros.
- Llevar a un horizonte común de tiempo por segundo, los datos
  de luminosidad y ruido.
- Calcular para cada distancia la covarianza y la correlación.
- Graficar el covariograma, la función de correlación y el
   semivariograma empírico para el caso del grupo.   


### Documentos de entrega.

- Archivos en formato ".csv" con la información para procesar.
- Archivo en formato ".Rmd" con los códigos desarrollados para
  el análisis.
- Archivo en formato ".html"  con el informe de los resultados
  obtenidos del análisis exploratorio.

### Fecha de entrega.

Lunes 6 de marzo de 2017 antes de las 23:59 hora de Colombia al
correo krcabrer@unal.edu.co y no olvidar en asunto escribir [EE].

## Trabajo individual de simulación.

### Objetivo:

Constuir curvas de potencia para el problema propio y determinar
tamaños de muestra adecuados para detectar estrucutra espacial.

### Actividades:

 - Mediante simulación construir la curva de potencia para
   su caso de ejemplo y variable propia.
   Deberá ser un modelo Matérn.
 - Aumentar el rango del anterior escenario y de nuevo hallar
   la curva de potencia.
 - Disminuir el rango del escenario inicial y construir de
   nuevo la curva de potencia.
 - Repetir los tres anteriores escenarios pero cambiando
   significativamente la varianza del modelo.

### Documentos a entregar:

 - Transcribir los resultados a la  [plantilla](./datos/CabreraTorresKennethRoy.xlsx) y
   cambiar el nombre del archivo ".xlsx", por sus apellidos y
   nombres completos.   
 - Documento en formato ".pdf" o formato ".html" en donde
   se muestre el comportamiento de las seis curvas obtenidas
   anteriormente y se permita hacer comparaciones.
   Escribir conclusiones y recomendaciones apropiadas.
 - Archivo ya sea en formato ".R"  o en ".Rmd" en donde se muestre
   el código utilizado.

### Fecha de entrega:

Viernes, 24 de marzo de 2017 antes de las 23:59 hora de Colombia al
correo **krcabrer@unal.edu.co** y no olvidar escribir en asunto **[EE]**   

--->
