# Tarea 3 ejercicios 5 y 6


### Instalamos un paquete que contiene una función que nos permite llenar de ceros los espacios restantes de las matrices 
    install.packages("magic")
    library(magic)
    library(MASS)

### Ejercico 5

### El ejercicio consiste en generar una muestra aleatoria para X, n=100
### Definimos las matrices de medias y varianzas como están en la tarea 
    mean1=c(0,-1)
    mean2=c(-2,0,2)
    var1=matrix(c(1,-.25,-.25,.5),2)
    var2=matrix(c(1,1/3,-1/2,1/3,1/4,0,-.5,0,1),3)
    measns=c(mean1,mean2)

### Usamos comando adiag para juntar las matrices correctamente
    varianzas=adiag(var1,var2)
    x=mvrnorm(800,means,varianzas)



