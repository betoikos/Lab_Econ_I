#Tarea 3
#Ejercicio 5

#Generar una muestra n=100 

library(MASS)

n=100
mu1<-matrix(c(0,-1),2)
mu1
mu2<-matrix(c(-2,0,2),3)
mu2
Var1<-matrix(c(1,-1/4,-1/4,1/2),2)
Var1
Var2<-matrix(c(1,1/3,-1/2,
               1/3,1/4,0,
               -1/2,0,1),3)
Var2

Z1sample<-mvrnorm(n,mu1,Var1)
Z1sample

Z2sample<-mvrnorm(n,mu2,Var2)
Z2sample

