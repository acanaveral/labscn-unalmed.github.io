Herramientas de programación
========================================================
author: Kenneth Roy Cabrera Torres
date: miércoles, 18 de septiembre de 2019
width: 1440
height: 900



split()
========================================================


```r
str(split)
```

+ `x` es un vector o lista.
+ `f` es un factor o una lista de factores.
+ `drop` indica si los niveles que salgan vacíos se
  deben excluir o no.

Ejemplo split I
========================================================

```r
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)
```
Uso combinado de lapply y split.

```r
lapply(split(x, f), mean)
```

Ejemplo split II
========================================================

En una base de datos.

```r
library(datasets)
head(airquality)
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = T))
```

Ejemplo split III
========================================================

```r
x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
f1
f2
interaction(f1, f2)
str(split(x, list(f1, f2)))
str(split(x, list(f1, f2), drop = TRUE))
```

Estándares de codificación en R
========================================================
- Siempre utilice un editor que sea de texto únicamente.
- Escriba su código con sangrías ("indentación").
- Limite el ancho de su código (80 columnas).
- Limite la longitud de las funciones individuales.
- [Reglas según Google](https://google.github.io/styleguide/Rguide.xml)
- [Reglas resumidas por el semillero de R](https://rpubs.com/fhernanb/RstyleGUIDE)


Fechas y tiempo en R
========================================================
+ Los fechas suelen representarse por la clase `Date`.
+ El tiempo se suele representar por las clases
  `POSIXct` o `POSIClt`.
+ Las fechas se guardan internamente como del número
  de días desde 1970-01-01
+ El tiempo se guarda internamente como el número de
  segundos desde 1970-01-01


Fechas
========================================================
Las fechas se representan por la clase `Date` y se
convierte de una sarta usando la función `as.Date()`.


```r
x <- as.Date("1970-01-01")
x

unclass(x)

unclass(as.Date("1970-01-02"))

unclass(as.Date("1967-05-30"))
```


Tiempo en R I
========================================================
El tiempo se representa mediante el uso de las clases
`POSIXct` o `POSIXlt`.

- `POSIXct` es un entero muy grande, y se usa para guardar
   fechas en base de datos `data.frame`.
- `POSIXlt` es una lista y guarda otra información como
   el día de la semana, el día del añor, el mes y el día
   del mes.

Tiempo en R II
========================================================
Algunas funciones trabajan en fechas y tiempo.

+ `weekdays`: Devuelve el día de la semana.
+ `months`: Devuelve el nombre del mes.
+ `quarters`: Devuelve el número del trimestre ("Q1", "Q2", "Q3", o "Q4")


Tiempo en R III
========================================================

Ejemplo 1:


```r
x <- Sys.time()
x

p <- as.POSIXlt(x)

names(unclass(p))

p$sec
```


Tiempo en R IV
========================================================

```r
x <- Sys.time()
x
unclass(x)
x$sec
p <- as.POSIXlt(x)
p$sec
```

Tiempo en R V
========================================================
La función `srtptime` para convertir fechas
en formatos diferentes al tipo fecha.


```r
sarta_fechas <- c("Enero 10, 2012 10:40", "diciembre 8, 2011 9:10",
                  "MAYO 30, 2015 23:59")
x <- strptime(sarta_fechas, "%B %d, %Y %H:%M")
x
class(x)
x1 <- as.POSIXct(x)
x1
class(x1)
```

Use `help(strptime)` para identificar los códigos de las fechas.

Operaciones con fechas I
========================================================
Se pueden hacer operaciones de + y -, como también
comparaciones (==, <=, etc).


```r
x <- as.Date("2012-01-01")
y <- strptime("9 ene 2011 11:34:21", "%d %b %Y %H:%M:%S")
x-y
x <- as.POSIXlt(x)
x-y
```

Operaciones con fechas II
========================================================
Se lleva registro de los años bisiestos, segundos adicionales,
horario de invierno y zonas horarias.

```r
x <- as.Date("2012-03-01"); y <- as.Date("2012-02-28")
x-y

x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 01:00:00", tz = "GMT")
y-x
```

Operaciones con fechas III
========================================================

```r
x1 <- as.POSIXct(strptime("1 de mayo de 1992 00:00","%d de %B de %Y %H:%M"))
x1
weekdays(x1)
x2 <- as.POSIXct(strptime("2 de mayo de 1992 00:00","%d de %B de %Y %H:%M"))
x2
weekdays(x2)
x2 - x1
x3 <- as.POSIXct(strptime("3 de mayo de 1992 00:00","%d de %B de %Y %H:%M"))
x3
weekdays(x3)
x2 - x1
x3 - x2
```

Depuración de código
========================================================
Cuando algo salga mal, pregúntese:

- ¿Cuál fue la entrada? ¿Cómo se llamó a la función?
- ¿Qué estaba usted esperando? ¿Salidas, mensajes u otros mensajes?
- ¿Qué obtuviste?
- ¿En qué difiere lo que usted obtuvo de y lo que estaba esperando?
- ¿Eran sus expectativas correctas?
- ¿Puede reproducir el problema (exactamente)?

Herramientas de depuración
========================================================
- `traceback`: Imprime la pila de las llamadas a funciones.
- `debug`: Marca una función en modo de depuración para seguir
           la ejecución paso a paso.
- `browser`: Suspende la ejecución y la pone en modo `debug`.
- `trace`: Permite insertar código de depuración en una función
           en sitios específicos.
- `recover`: Permite modificar el comportamiento frente al error,
            de tal manera que puede revisar la pila de llamadas.

La técnica más artesanal de usar las funciones `print` y `cat`
dentro del código de las funciones.

traceback, debug y recover
========================================================

```r
mean(w)
traceback()

lm(w ~ z)
traceback()

debug(lm)
lm(w ~ z)
undebug(lm)

oopt <- options()
options(error = recover)
read.csv("archivoinexistente")
options(oopt)
```

Depuración
========================================================
+ El R muestra muestra indicación de problemas potenciales
  con: `message`, `warning` y `error`.
  - Sólo `error` detiene la ejecución del código.
+ Al analizar, reproduzca el problema, compare lo que
  usted obtiene con que es esperaba.
+ Use las herramientas `traceback`, `debug`, `browse`, `trace`
  y `recover` para encontrar los problemas.
+ **La depuración no sustituye pensar**
