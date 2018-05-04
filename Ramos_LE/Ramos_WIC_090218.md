# Notas de clase Luis Enrique Ramos Alvarez

## Sobre el uso de Markdown

### Titulos

Para los titulos debemos agregar un sisno de gato al principio de la línea.

### Párrafos

Los párrafos se hacen dejando una línea sin caracteres entre líneas de código (es decir, para empezar un párrafo en lugar de "dar un sólo ENTER" se deben "dar dos ENTER").

Este es el segundo párrafo y así.

 
### Negritas, cursivas y combinación de negritas y cursivas

En los párrafos se puede incluir *texto en cursivas* poniendo las palabras entre asteriscos o bien entre guiones bajos como este otro _texto en cursivas_. 

Para **texto en negritas** se ponen las palabras entre asteriscos dobles o bien entre guiones bajos dobles como __este otro texto en negritas__.

Y, naturalmente, *cursivas y  **negritas** pueden combinarse* como pueden claramente ver.

### Listas

Para hacer listas enumeradas se pone número seguido de punto y un espacio: 

1. Elemento 1 de la lista enumerada
2. Elemento 2 de la lista enumerada
    1. Elemento 2.1 de la lista
    2. Elemento 2.2 de la lista
        1. Elemento 2.2.1 de la lista
        2. Elemento 2.1.2 de la lista
3. Elemento 3 de la lista enumerada
    1. Elemento 3.1 de la lista
    2. Elemento 3.2 de la lista
 
Para hacer listas sin enumerar:

* Uno
* Dos
* Tres
    - Sí
    - No
    - Quizá
    - 5
        - Sí que sí
        - No que no
    - ajam
* Cuatro

## Links
Link hacia google [aquí](https://www.google.com), y [aquí adelante](https://www.google.com "Google's Homepage") también pero con un "título" . 

Para que el link completo sea mostradoa se debe encerrar en signos de "menor que" y "mayor que" <http://www.github.com>.

### Añadir imágenes
Para que puedan poner imágenes que tengan en su carpeta:

![alt text](img/acdc.png "Letrero cuando se ubica el cursor encima.")

## Citas en bloque

Como dijo alguna Jack el destripador
> Vamos
>
> por
>
> partes.


## Referencias para profundizar
La referencia oficial para la sintaxis de Markdown es [Daring Fireball](https://daringfireball.net/projects/markdown/syntax).

Si quieres volver a aprender lo básico de Markdown cono un tutorial práctico y muy didáctico puedes probar con [este](http://commonmark.org/help/tutorial/).


## Sobre el uso de R-Studio

### Comandos básicos

Cuando incluímos texto para comentario o pafa señalar, incluímos el signo de # al inicio, con esto no corre código.

    # no es interpretado por R como código
    
### Para seleccionar y verificar el directorio

    getwd()
    # para seleccionar carpeta

    setwd("C:/Users/LuisEnrique/Documents/GitHub/Lab_Econ_I/Ramos_LE")

    #verificar directorio
    
### Operaciones y asigar valores

    sqrt(144)

    #no funciona mi R

    a= 52


    sum(a,b)

    class(a)


    g <- "perrito"
    class(g)

    t

    a+b

    a*g

    # variables booleanas

    h <- TRUE

    a*h


    #renombrar variables sobre variables

    aporb <- a*b

    aentreb<- a/b

### Crear vectores y matrices

    # creando un vector. (es una función)

    c(2,4,6,8,10)

    A <- c(2,4,6,8,10)

    Animalitos <- c("perros","gato","lobo")

    Animalitos

    vbooleano <- c(TRUE,FALSE)

    B <- c(3,5,7,9,11)

    A<B

    F = matrix(c(1,2,3,4,5,6,7,8,9),3)
    F

    G <- t(F)

    # función identidad

    I_10 <- diag(10)

    # Inversa de una matriz

    O <- solve(F)

    # concatenar matrices

    P <- cbind(F,G)

### Ejemplo para realizar las tareas

    # Tarea 1
    ## Ejercicio 4

    # Definiciones

    Ex1 <- 0
    Ex2 <- -4
    Ex3 <- 1
    Ey1 <- -1
    Ey2 <- 4

    varx1 <- 1
    varx2 <- 4
    varx3 <- 2
    vary1 <- 1
    vary2 <- 9

    covx1x2 <- -1
    covx1x3 <- 0
    covx1y1 <- 0
    covx1y2 <- 1

    covx2x3 <- 2
    covx2y1 <- -1
    covx2y2 <- -3

    covx3y1 <- 0
    covx2y2 <- 3
    covy1y2 <- -2

    # Inciso i)

    # E[X]

    Ex <- t(t(c(Ex1, Ex2,Ex3)))

    Ex

    Ex <- matrix(c(Ex1,Ex2,Ex3),3)
    Ex

    # var(X)

    varX <- matrix(c(varx1,covx1x2,covx1x3,
                     covx1x2,varx2,covx2x3,
                     covx1x3,covx2x3,varx3),3)
    varX

    # var(Y)

    varY <- matrix(c(vary1,covy1y2,
                     covy1y2,vary2),2)
    varY
    
    