# Pirmera clase de R

### getwd()  
    Este comando es para obtener la ruta de trabajo actual

### setwd("C://Users/Carlos/Documents/Lab_Econ_I/Alba_CA")
    Fijar el directorio de trabajo







    ## R se puede usar como calculadora

1+1
2-3


# Funciones integradas en R
### abs(x) 
valor absoluto
abs(-5)

# sqrt(x) raíz cuadrada
sqrt(144)

# log(x) 
log(36514364)

# exp(x) 
exp(6354)

# Variables y sus tipos

## Asignando valores a una variable
a = 52 # Numeric, integers
b <- 52 # Numeric, integers
c = "perrito" # String or Character
d <- 55.5 # Numeric
g = TRUE # Boolean
h = FALSE

# Para saber qué tipo de dato/variable es X objeto usamos:
class(g)
class(a)
class(c)
class(d)

# Una vez creadas, las variables pueden usarse

## llamandolas dan los valores que contienen
a
b
c
d
e
f # no ha sido definida
g
h

## Numéricas con numéricas
a+a
b+a
d/a
g/a

# Numéricas con booleanas
a*g
a*h

## Numéricas con strings
c*a

# Además pueden ser creadas nuevas variables a partir de las existentes

AporB=a*b
DentreA=d/a

worale=AporB/DentreA
worale

# Así mismo, se les pueden aplicar todas las funciones antes mencionadas
sqrt(worale)


# --------------------------------------------- 
# Vectores y matrices

# Creando un vector
c(5,4,6,4,32121,6,0,0,0,0,0,0)

# Los vectores también se pueden guardar
A = c(98,987,987,987,987,7,75.5)
Animalitos =  c("perro", "gato", "pollo")
Vbooleano = c(TRUE,FALSE)

A
Animalitos
Vbooleano

# Se puede operar con vectores

A = c(1,2,3)
B = c(5,6,7)
C = c(8,3,1)

D = A - B
E = D + A
D
E

A<E
A>E

F = A>E
F

# Matrices
# elementos ordenados de n en n
A = matrix(c(1,2,3,4,5,6,7,8,9),3)
A
# matriz de unos, con dos filas y tres columnas
B = matrix(5,2,3)
B
# matriz con elementos del uno al nueve, ordenados en 3 filas 
C= matrix(1:9, byrow = TRUE, nrow = 3)
C
# matriz identica a A
D = matrix(1:9, byrow = FALSE, nrow = 3)
D

# Se puede operar con matrices

#Suma 
E=A+D
E

F = A+A+A+A+A
F

# Producto de escalar por una matriz
G = 2*A
G

# Producto de matrices
H = A%*%A
H

I = A%*%D
I

# Producto (interior) de vectores
a = c(1,2,3)
b = c(2,3,4)
d = a%*%b
d

# Producto de matrices por vectores
J = A%*%a
J

K = a%*%A
K

L = a%*%A%*%a
L

# Funciones sobre matrices

# Transpuesta
M = t(A)
M

N = t(t(A))
N

f = t(a)
f

g = t(f)
g

h = t(g)
h

# Identidad de tamaño k
I_10 = diag(10)	
I_10

# Seleccionar elementos de una matriz

# Elementos 1 y 2 del vector a
a[1]
a[2]

# Elemento a11
A
A[1]
# Fila 1
A[1,]
# Columna 1
A[,1]

j = A[1,]
j

k = A[,1]
k

# Inversa de una matriz

O = solve(A)
O

# Cambiando el elemento 5 de la matriz A
A[5]=5555
A

# Intentando inversa nuevamente
O = solve(A)
O

# Cambiando la primera columna de O
O[,1]=c(1,2,3)
O

# Concatenar matrices horizontalmente
P = cbind(A,O)
P

Q = cbind(A,a,a,b)
Q
# Concatenar matrices verticalmente

R = rbind(P,Q) 

## esto hace parte de la tarea 1
   
    #tarea_1
    ##Ejercicio_4

    Ex1=0
    Ex2=-4
    Ex3=1
    Ey1=-1
    Ey2=4

    varx1=1
    varx2=4
    varx3=2
    vary1=1
    vary2=9

    covx1x2=-1
    covx1x3=0
    covx1y1=0
    covx1y2=1

    covx2x3=2
    covx2y1=-1
    covx2y2=-3

    covx3y1=0
    covx3y2=3
    covy1y2=-2

    # Inciso 1)

    #E[x]

    EX=t(t(c(Ex1,Ex2,Ex3)))  #se puede de las dos formas
    EX=matrix(c(Ex1,Ex2,Ex3))

    #var (x)
    varx=matrix(c(varx1,covx1x2,covx1x3,covx1x2,varx2,covx2x3,covx1x3,covx2x3,varx3),3)

    #var(y)

    vary=matrix(c(vary1,covy1y2,covy1y2,vary2),2) #hasta aqui notas 09/02/18
