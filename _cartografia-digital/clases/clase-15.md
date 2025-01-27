---
layout: clase
title: 'Consulta sistemática y jerárquica a la estructura de la base de datos de un mapa vectorial'
curso: 'cartografia-digital'
---
<!-- clase: 15 -->

Las preguntas básicas {#preguntas-basicas}
---------------------

- Describir las columnas de una base de datos.

~~~
db.describe -c puntos
~~~

- Identificar las categorías de una variable (columna).

~~~
db.select sql='select PLACE from puntos group by PLACE'
~~~

- Tabla de frecuencia de la categorías de una variable (columna). No cuenta los nulos.

~~~
db.select sql='select PLACE,count(PLACE) from puntos group by PLACE'
~~~

- Desplegar los registros con valor nulo en una variable (columna).

~~~
db.select sql='select * from puntos where PLACE is null'
~~~

- Contar los registros con valor nulo en una variable (columna).

~~~
db.select sql='select count(*) from puntos where PLACE is null'
~~~

Incorporar información proveniente de un DEM o de otro mapa vectorial {#incorporar-informacion-proveniente-dem-otro-mapa-vectorial}
---------------------------------------------------------------------

Se puede transladar información de un archivo raster a un archivo vector, si este último es un archivo de puntos.

- Verificar el manejador de base de datos que está activo actualmente.

~~~
db.connect -p
~~~

- Listado de tablas asociadas al manejador de base de datos.

~~~
db.tables -p
~~~

Incorporar al map vectorial `puntos` la información de altitud utilizando el DEM:

- Se crea una nueva columna de tipo entero en el mapa vectorial `puntos`

~~~
v.db.addcol map=puntos col='ALTITUD INT'
~~~

- Se añade la informacion de altitud de los DEM `ituango`, `porcecito`, y `riogrande_sup` al vectorial `puntos`, teniendo cuidado de definir bien la región.

~~~
g.region rast=ituango
v.what.rast vect=puntos rast=ituango col=ALTITUD
g.region rast=porcecito
v.what.rast vect=puntos rast=porcecito col=ALTITUD
g.region rast=riogrande_sup
v.what.rast vect=puntos rast=riogrande_sup col=ALTITUD
~~~

Incorporar información de un mapa vectorial a otro mapa vectorial

- Se añade una columna al archivo vector que recibirá la información y se hace el traslado.

~~~
v.db.addcol map=puntos col="mpio VARCHAR(25)"
g.region vect=muniantioq
v.what.vect vect=puntos qvect=muniantioq column=mpio qcolumn=MUNICIPIO
~~~

### Consultas auxiliares

- Para obtener el listado de los nombres de los municipios del depto de Antioquia.

~~~
v.db.select map=muniantioq col=MUNICIPIO
~~~

- Consultar información de la base de datos NBI perteneciente al departamento de Antioquia.

~~~
db.select sql=“select * from NBI where Nombre_Departamento='ANTIOQUIA'"
~~~

- Desplegar el listado con el nombre de los municipios de Antioquia de la base de datos NBI.

~~~
db.select sql="select Nombre_Municipio from NBI where Nombre_Departamento='ANTIOQUIA'"
~~~

Aplicación de lo aprendido anteriormente {#aplicacion-aprendido-anteriormente}
----------------------------------------

1. Desplegar el mapa porcecito.
2. Desplegar los puntos del mapa `puntos` que se encuentran dentro de la región del mapa `porcecito`.
3. Mostrar al lado de cada punto, el nombre del municipio al cual pertenece cada punto.
4. Colorear en rojo los nombres de los puntos que se encuentran por encima del valor promedio de altitud del mapa `porcecito` y en azul los puntos cuya altitud sea menor que dicho promedio, el cual se puede calcular con el comando `r.univar`.

### Desarrollo

- Establecemos la región de trabajo para cubrir el mapa de porcecito.

~~~
g.region rast=porcecito
~~~

- Calcular el promedio de altitud en el mapa de porcecito.

~~~
r.univar porcecito
~~~

- Desplegamos el mapa raster de porcecito.

~~~
d.rast porcecito
~~~

- Desplegamos el mapa de los límites municipales del departamento.

~~~
d.vect map=muniantioq type=boundary
~~~

- Desplegamos los puntos con su respectivo municipio.

~~~
d.vect map=puntos display=shape,attr attrcol=MPIO lcolor=black icon="basic/diamond" xref=right yref=bottom
~~~

- Desplegamos en color rojo los puntos de altitud mayor que el promedio.

~~~
d.vect map=puntos display=attr attrcol=ALTITUD where="ALTITUD>1794" lcolor=red xref=right yref=top
~~~

- Desplegamos en color azul los puntos de altitud menor que el promedio.

~~~
d.vect map=puntos display=attr attrcol=ALTITUD where="ALTITUD<1794" lcolor=blue xref=right yref=top
~~~

![Resultado obtenido](/cartografia-digital/images/desarrollo_aplicacion_vectorial.png){: .img-responsive}
