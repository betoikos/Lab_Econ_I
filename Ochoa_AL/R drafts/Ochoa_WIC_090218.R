#ncvbcnvbncm
#vbmfvlfv
#muestra directorio de trabajo
getwd()

#fija directorio de trabajo, usar diagonales invertidas /
setwd("C://Users/sony/Documents/GitHub/Lab_Econ_I/Ochoa_AL")

#corrobora directorio de trabajo
getwd()
getwd()

# sirve como calculadora
#funcion valor absoluto
abs(-5)
4+3

## sqrt(y)	fn raíz cuadrada

sqrt(25)

# round(x, digits=n) redondea el número x a n dígitos
round(234.214345467687879980,5)

#log(y)  da el logaritmo de un numero
log(25)

#exp(a) da el log de un numero
exp(a)

m = TRUE # Booleanos
n = FALSE

m
n

#si se selecciona un par de líneas, se puede usar el atajo CTR+Enter 
#para solo correr esas líneas


#sirve para signar variables
a = 52 #numeros enteros
b <- 32
c = "perrito"
d = 35
e = 2

g = TRUE
h = FALSE
#Se pueden definir variables a partir de otras variables
#existen operaciones booleanas
#se puede multiplicar TRUE con numeros
# no se puede multiplicar string con TRUE


#class(x) da el tipo de variable
class(g)
class(a)
class(c)



#Llamar valores

g

#generar nuevas variable a partir de otro
l=a+b
l
m=a-b
m



#_________________-

# Vector
c(5,4,6,10.5,4)
c

#para poder llamar un vector hay que asignarlo a variable

A = c(23, 45, 123.33)
A
a #R distingue entre mayusculas y minisculas

Animalitos = c("perro", "gato", "pollo")  # crea vector string
Animalitos #llama al vector, pero no lo presenta entre parentesis

#Se pueden hacer operaciones con vectores
A = c(10,2,3)
B = c(50,6,7)
C = c(80,3,1)

E= A + B
F = A - B
E
F
#Hace operaciones con booleanos
F = A>E
F


#__________________
#Para Matrices
# ordenados de n elementos  en m=3 renglones

H = matrix(c(1,2,3,4,5,6,7,8,9,10, 11, 12, 13, 14, 15),3)
H
# matriz de cincos, con 4 renglones y 2 columnas
I = matrix(5,4,2)
I
#Se puede hacer operaciones con matrices

J = matrix(c(2,2,2,4,5,6,7,10,10,10, 11, 12, 13, 14, 15),3)
J


#operaciones con matrices

K= H+J
K

L= 2*K
L

A=matrix(c(1:9),3)
A

# Producto de matrices, verificar dimensiones para que sea posible
H = A%*%A
H

# transpuesta
M=t(H)
M

# Identidad de tamaño k
I_11 = diag(11)	
I_11

#para selecionar elementos de una matriz


# Elemento a11
A
A[1]
# Fila 2
A[2,]
# Columna 3
  A[,3]

# Inversa de una matriz


K = solve(A)
K

#Cambiando el elemento 1 de la matriz A
A[1]=5555

K = solve(A)
K

# Cambiando la primera columna de M
M[,1]=c(1,2,3)
M

# Concatenar matrices horizontalmente
P = cbind(A,M)
P

#unir matrices y vectores

a = c(1,2,3)
a

Q = cbind(A,a,a,M)
Q

# Concatenar matrices verticalmente

R = rbind(A,M)

R




#_____________________



#tarea 1

#definiciones
Ex1 = 0
Ex2 = -4
Ex3 = 1
Ey1 = -1
Ey2 = 4

varx1 = 1
varx2 = 4
varx3 = 2
vary1 = 1
vary2 = 9

covx1x2 = -1
covx1x3 = 0
covx1y1 = 0
covx1y2 = 1

covx2x3 = 2
covx2y1 = -1
covx2y2 = -3

covx3y1 = 0
covx3y2 = 3
covy1y2 = -2

#inciso1
#E(x)

#EX = t(t(c(Ex1,Ex2,Ex3)))
EX = matrix(c(Ex1,Ex2,Ex3))
EX

#var X

varX = matrix(c(varx1, covx1x2, covx1x3,covx1x3, varx2, covx2x3, covx1x3, covx2x3, varx3),3)
varX

#var y

varY = matrix(c(vary1, 
                covy1y2,
                covy1y2,vary2),2)
varY

varX

