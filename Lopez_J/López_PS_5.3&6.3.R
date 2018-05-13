#################Ejercicio 5, Tarea 3#########################
install.packages("magic")
library(magic)
library(MASS)
#Dado que X1 y X2 son independientes, X=(X1,X2) se distribuye normal con Cov(X1,X2)=0
m1=c(0,-1)
Sig1=matrix(c(1,-0.25,-0.25,0.5),ncol=2,byrow=T)
m2=c(-2,0,-2)
Sig2=matrix(c(1,1/3,-1/2,1/3,1/4,0,-1/2,0,1),ncol=3,byrow=T)
S=adiag(Sig1,Sig2)
mu=c(0,-1,-2,0,-2)
X=mvrnorm(n=100,mu,S)
X

#################Ejercicio 6, Tarea 3#########################

mean=c(0,0,1,1)
SIGMA=matrix(c(1,0,1,0,0,9,0,1,1,0,4,0,0,1,0,9),ncol=4,byrow=T)
X.6=mvrnorm(n=200,mean,SIGMA)
X.6

#Distribución del vector Z=(X3,X2,X4,X1)
#Z=MX
M=matrix(c(0,0,1,0,0,1,0,0,0,0,0,1,1,0,0,0),ncol=4,byrow=T)

#Por propiedades de la distribución normal Z=(X3,X2,X4,X1) se distribuye normal con:

meanz=M%*%mean
sigmaz=M%*%SIGMA%*%t(M)
meanz
sigmaz
