# Tarea 3
# ejercicio 5

# a) generar una muestra, n=100
    library(MASS)
    n1=100
    mu1<-c(0,-1)
    sigma1=matrix(c(1,-.25,-.25,0.5),2)
    datos1=mvrnorm(n1,mu1,sigma1)


# b) generar una muestra, n=200
    n2=200
    mu2<-c(-2,0,2)
    sigma2=matrix(c(1,1/3,-1/2,1/3,1/4,0,-1/2,0,1),3)
    datos2=mvrnorm(n2,mu2,sigma2)