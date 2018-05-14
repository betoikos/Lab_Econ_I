# Ejercicio 6

### Definimos las matrices de esperanzas y varianzas
    medias=c(0,0,1,1)
    varianzotas=matrix(c(1,0,1,0,0,9,0,1,1,0,4,0,0,1,0,9),4)

### Generamos muestra aleatoria
    x=mvrnorm(200,medias,varianzotas)
    Z=matrix(c(0,0,0,1,0,1,0,0,1,0,0,0,0,0,1,0),4)

    x1=Z%*%t(x)

### Esto es una transformación lineal de un vector que distribuye normal. Por lo tanto, es normal. 

    media1=Z%*%medias
    var1=Z%*%varianzotas%*%t(Z)