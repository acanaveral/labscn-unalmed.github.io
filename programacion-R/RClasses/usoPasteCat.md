Uso de "cat" y "paste"
========================================================
author: Kenneth Cabrera
date: 7 de Octubre de 2014

paste
========================================================
Es una función para concatenar sartas 
y guardar el resultado.

Se utiliza entre otas cosas para:
* Crear nombres sistemáticos.
* Crear identificadores únicos al unir claves diferentes.
* Permite también crear nombres de variables de manera
  sistemática.
  
cat
========================================================
Es una función para imprimir sartas o grupos de sartas

Se utiliza principalmente para:
* Generar salidas más legibles al usuario.
* Trata las sartas con sus códigos de escape para 
  controlar el maneja de la pantalla.
  
Ejemplo I
========================================================

```r
paste("Este", " ", "es", "un ", "ejemplo: ", '\"' ,"¿Por qué?\"",sep = "")
```

```
[1] "Este esun ejemplo: \"¿Por qué?\""
```

```r
cat("Este", " ", "es", "un ", "ejemplo: ", '\"' ,"¿Por qué?\"", sep = "")
```

```
Este esun ejemplo: "¿Por qué?"
```

Ejemplo II
========================================================

```r
paste("Por ejemplo:", "\n", "1. Primero", "\n 2. Segundo \t ¿será?")
```

```
[1] "Por ejemplo: \n 1. Primero \n 2. Segundo \t ¿será?"
```

```r
cat("Por ejemplo:", "\n", "1. Primero", "\n 2. Segundo \t ¿será?")
```

```
Por ejemplo: 
 1. Primero 
 2. Segundo 	 ¿será?
```

Ejemplo III
========================================================

```r
s1 <- paste('\"',"y",1:5, '"', "\'a\'" , sep = " ")
s1
print(s1)
cat(s1)
```

Ejemplo IV
========================================================

```r
s2 <- "Basta, \\ basta \"ya\"!!\b\b\n \t 'ya'!!!"
s2
paste(s2)
cat(s2)
```

Ejemplo V
========================================================

```r
cat("Yo \U2764 R")
```
Tabla de código y símbolos unicode:

http://www.alanwood.net/unicode/geometric_shapes.html


```r
plot(1:10, rnorm(10) , main= "yo \U2764 R", pch = -0x2764, cex = 1.5)
```
