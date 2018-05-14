# Tarea 3
# ejercicio 6

    library(MASS)
# a) generar una muestra, n=200
    n=200
    mu<-c(0,0,1,1)
    sigma=matrix(c(1,0,1,0,0,9,0,1,
                   1,0,4,0,0,1,0,9),4)
    datos=mvrnorm(n,mu,sigma)
