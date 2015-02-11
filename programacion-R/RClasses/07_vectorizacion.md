Vectorización en R
========================================================
author: Kenneth Cabrera
date: 8 de Octubre de 2014

Operaciones vectorizadas
========================================================

```r
x <- 1:5; y <- 11:15
x + y
x > 2
x >= 2
y == 8
x * 6
x / y
```

Vectorización en matrices
========================================================

```r
x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
x * y
x / y
x %*% y
```


Familia "apply"
========================================================
En esta familia se encuentran:

- `lapply`: Iteración sobre una lista y evalúa una función
en cada elemento.
- `sapply`: Igual a `lapply` pero trata de simplificar 
el resultado.
- `apply`: Aplica una función sobre alguna marginalización
de un arreglo.
- `tapply`: Aplica una función a un subconjunto de un vector.
- `mapply`: Versión multivariada de `lapply`.

Algunas funciones auxiliares como `split` usada con `lapply`

lapply I
========================================================
`lapply` tiene tres argumentos


```r
args(lapply)
```

```
function (X, FUN, ...) 
NULL
```

- una lista `x`.
- una función (FUN).
- una lista de argumento que se pasan a la función (FUN).

El objeto de entrada, si no 
es una lista se pasa a una lista con `as.list`.

lapply II
========================================================
Siempre se devuelve una lista, sin importar la clase
del objeto de entrada.


```r
x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)
```

lapply III
========================================================

```r
x <- 1:4
lapply(x, runif)

x <- 1:4
lapply(x, runif, min = 0, max = 10)

x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x

# Función "anónima" o construida al instante ("on the fly")
lapply(x, function(elt) elt[,1])
```

sapply I
========================================================
`sapply` simplifica el resultado de un lapply si es posible.
- Si el resultado es una lista donde cada elemento tiene
  longitud 1, devuelve un vector.
- Si el resultado es una lista donde cada elemento es
  un vector de la misma longitud (>1), se devuelve
  una matriz.
- Si no lo puede convertir a un vector o a una lista,
  devuelve una lista (exacto a `lapply`).


sapply II
========================================================

```r
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))

mean(x)

lapply(x, mean)

sapply(x, mean)
```

apply I
========================================================
`apply` se usa para evaluar una función sobre las marginales
de un arreglo.
- Lo más usual es usar la función `apply` en las filas
o columnas de una matriz.
- El uso más general es en arreglo, pudiento por ejemplo
obtenerse el promedio de un arreglo de matrices.

```r
str(apply)
```

```
function (X, MARGIN, FUN, ...)  
```

apply II
========================================================

```r
x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean)
apply(x, 1, sum)
apply(x, 1, quantile, probs = c(0.25, 0.75))
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
a
apply(a, c(1, 2), mean)
```

Versiones más rápidas para sumas y medias
========================================================
- `rowSums = apply(x, 1, sum)`
- `rowMeans = apply(x, 1, mean)`
- `colSums = apply(x, 2, sum)`
- `colMeans = apply(x, 2, mean)`

apply II
========================================================

```r
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean)
rowMeans(a, dims = 2)
```

Comparación en velocidad
========================================================

```r
a1 <- array(rnorm(1000*100*100),c(1000,100,100))
r0 <- vector("integer",1000)
system.time(for (i in 1:length(r0)) r0[i] <- sum(a1[i,,]))
system.time(r1 <- apply(a1,1,sum))
system.time(r2 <- rowSums(a1))
```

En las nuevas versiones de R (R > 3.0.0), no siempre el uso de `apply` disminuye la velocidad.

tapply
========================================================
Se usa para aplicar una función sobre un subconjunto
de un vector.


```r
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
f
tapply(x, f, mean)
tapply(x, f, mean, simplify = FALSE)
tapply(x, f, range)
```


mapply I
========================================================
Versión multivariada de `lapply`

```r
str(mapply)
```

```
function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)  
```


```r
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))

mapply(rep, 1:4, 4:1)
```

mapply II
========================================================

```r
ruido <- function(n, mean, sd) {
 rnorm(n, mean, sd)
}

ruido(5, 1, 2)

ruido(1:5, 1:5, 2)

mapply(ruido, 1:5, 1:5, 2)

list(ruido(1, 1, 2), ruido(2, 2, 2),
ruido(3, 3, 2), ruido(4, 4, 2),
ruido(5, 5, 2))
```
