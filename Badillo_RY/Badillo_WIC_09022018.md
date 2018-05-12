

# Introducción a R
## Esto es un comentario
    # hello 
#### Así obtenemos el directorio
    getwd()

#### Seleccionar Directorio
    setwd("C://Users/Yunoen Badillo Salas/Documents/GitHub/Lab_Econ_I/Badillo_RY")

#### operaciones algebraícas
    2-3
    7*4
    10/5
    25^3
    1+14
    sqrt(99)
    abs(-20)
    log(35)
    exp(54)

## Tipos de variables 
### Númericas
##### *Nota* es lo mismo decir:
    a = 62  
    a <- 82 
    c = 6
    
##### String
    b = "Alex"
##### Boolean
    d = TRUE 

## Clases
    class(b)
    class(a)
    class(d)

## Operaciones con variables
    a+a
    a+c
    a*d 
    hello=a*c
    sqrt(hello)

# Vectores y matrices 

### Creando un vector
    c(2,4,1,5)

#### Los vectores también se pueden guardar 
    A= c(2,3,5,6,5)
    Colmecas = c('Alex', "Susi", "Stack")

#### Matrices ( Elementos ordenados de n en n)
    A= matrix(c(2,3,4,5,6,7,8,9,9),2)
    A

#### Matriz de cuatros, con 4 filas y 10 columnas
    C= matrix(4,4,10)
    C

#### Matriz con elementos del uno al nueve, ordenados en 2 filas
    D= matrix(1:9, byrow=TRUE, 2)
    D
#### Transpuesta
    f=t(A)
    f

#### Identidad de tamaño k
    I_5 = diag(5)
    I_5


## Seleccionar elementos de una matriz 

#### Elemento all
##### Fila 1
    A[1,]

##### Columna 1
    A[,1]

##### Inversa
    I = solve(A)
    I

#### Cambiando el elemento 2 de la matriz A
    A[2]= 5521
    A

#### Cambiando la primera columna de O
    A[,1]=c(3,3,3)
    A

#### Concatenar matrices horizontalmente  (juntar dos matrices)
    P= cbind(A,C)
    P
