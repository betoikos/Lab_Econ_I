#Ejercicio 3.6

library(MASS)
#Generamos la muestra n=200
n = 200
mx<-c(0,0,1,1)
mx
sx=matrix(c(1,0,1,0,0,9,0,1,1,0,4,0,0,1,0,9),4)
sx
samp=mvrnorm(n,mx,sx)
samp

#Ejercicio i)

A=matrix(c(0,0,0,1,0,1,0,0,1,0,0,0,0,0,1,0),4)
A

X = A%*%t(samp)
X
MX = A%*%mx
MX
SX = A%*%sx
SX

