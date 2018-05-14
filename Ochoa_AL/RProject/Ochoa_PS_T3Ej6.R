#Tarea 3
#Ejercicio 6

#Generar una muestra n=200 

library(MASS)

mu<-matrix(c(0,0,1,1),4)
Var1<-matrix(c(1,0,1,0,
               0,9,0,1,
               1,0,4,0,
               0,1,0,9),4)
n=200

Z1sample<-mvrnorm(n,mu,Var1)
Z1sample