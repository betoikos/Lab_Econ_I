# Primera Clase R

Antes que nada, hay que picarle al logo de Rstudio

![alt text](C:/Users/alex_/OneDrive/Escritorio/Econometria/R.png "Logo.")

Abrimos un nuevo R script puchandole en 
![alt text](C:/Users/alex_/OneDrive/Escritorio/Econometria/Nuevo.png "Logo.") Y despues en *R script*.


## Aprendiendo a guardar el Script

Usamos el comando **getwd()** para saber en dónde está guardándose el *script*.
Usamos el comando **setwd()** para guardarlo en una nueva carpeta.

## Primeras operaciones

Se hacen operaciones básicas con los símbolos + * / - 
Además de **abs()** para valor absoluto, **sqrt()** para la raíz cuadrada, **round()** para redondear un valor, **log()** para logaritmo natural y **exp()*** para la exponencial

## Crear variables

Esto es bastante sencillo, de manera muy intuitiva. Por ejemplo:

    a = 33
    b >- 12
    c = "variable c"
    d <-12.0
    g = TRUE 
    h = FALSE 

***Nota**: g y h se refieren a variables booleanas que toman el valor de cero y uno.

****Nota**: Si olvidas qué tipo de variable es, se usa el comando **class()** que las describe.

## Vectores y Matrices

Para los vectores se usa el comando **c()**. Pueden ser tanto valores numéricos como palabras.
Para las matrices, el comando más sencillo es **matrix()**, un ejemplo:

    A = matrix(c(1,2,3,4,5,6,7,8,12,45,10,0),4)
![alt text](C:/Users/alex_/OneDrive/Escritorio/Econometria/matriz.png "Logo.")


## Ejemplo tarea 1:

### Ejercicio 4

    Ex1 = 0
    Ex2 = -4
    Ex3 = 1
    Ey1 = -1
    Ey2 = 4
    Varx1 = 1
    Varx2 = 4
    Varx3 = 2
    Vary1 = 1
    Vary2 = 9
    Covx1x2 = -1
    Covx1x3 = 0
    Covx1y1 = 0
    Covx1y2 = 1
    Covx2x3 = 2
    Covx2y1 = -1
    Covx2y2 = -3
    Covx3y1 = 0
    Covx3y2 = 3
    Covy1y2 = -2

#### i)

    EX = matrix(c(Ex1,Ex2,Ex3),3)
    EX
#### ii)

    VarX = matrix(c(Varx1,Covx1x2,Covx1x3,Covx1x2,Varx2,Covx2x3,
                Covx1x3,Covx2x3,Varx3),3)
                VarX
#### iii)

    VarY = matrix(c(Vary1,Covy1y2,Covy1y2,Vary2))
    VarY


