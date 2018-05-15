# Ejercicio 3.5
## Descargamos la librería que nos servirá
    library(MASS)
## Generar dos muestras, una n=100, la otra n=200

### Ponemos los datos que nos van a servir

    m1<-c(0,-1)
    m1
    m2<-c(-2,0,2)
    m2
    s1 = matrix(c(1,-.25,-.25,0.5),2)
    s1
    s2 = matrix(c(1,1/3,-0.5,1/3,0.25,0,-0.5,0,1),3)

### Generamos las muestras con estos datos

    samp1 = mvrnorm(100,m1,s1)
    samp1
    samp2 = mvrnorm(200,m2,s2)
    samp2