#Ejercicio 3.6
#Susana Almeida Mart??nez

library(MASS)

#Datos 

#X=c(x1,x2,x3,x4)
miu<-c(0,0,1,1)
miu


sigma<-matrix(c(1,0,1,0,0,
                9,0,1,1,0,
                4,0,0,1,0,9),4)
sigma

# Generar una muestra para X, n=200

muestra <-mvrnorm(200,miu,sigma)

#i) ??Cu??l es la distribuci??n del vector aleatorio c(x3,x3,x4,x1)?
# Por proposici??n sabemos que toda transformaci??n lineal de un vector que distribuye normal multivariado, tambi??n distribuir?? normal multivariada
# Notamos que podemos reescribir el vector c(x3,x3,x4,x1) como un producto de la matriz A por la matriz de X=muestra, lo cual podemos definir como el vector Y=AX

A<- matrix(c(0,0,0,1,0,1,0,0,1,0,0,0,0,0,1,0),4)
A

Y<-A%*%miu
Y

#As??, de nuevo recordando la proposici??n sabemos que su media ser?? igual a A*miu, y su varianza A*sigma*t(A):

mediaY<-A%*%miu
mediaY

varianzaY <-A%*%sigma%*%t(A)
varianzaY

# ii) Existen valores de alpha y beta tales que el vector aleatorio J=c(x3+alpha*x1,x4+beta*x2) sea independiente del vector K=c(x1,x2)?

# Notemos primero que el vector J es una transformaci??n lineal del vector X donde BX=J, B siendo:

a="alpha"
b="beta"
B=matrix(c(a,0,0,b,1,0,0,1),2)
B

# De igual forma, el vector K es una transformaci??n lineal de X, donde CX=K, C siendo:

C=matrix(c(1,0,0,1,0,0,0,0),2)
C

#Si son independientes J y K entonces B*sigmaX*t(C)=0

B%*%sigma%*%t(C)

# Resolviendo el sistema obtenemos que los vectores J y K ser??n independientes si alpha=-1 y beta=-1/9
