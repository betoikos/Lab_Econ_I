### Ejercicio 3.5
###### Susana Almeida Martinez

        install.packages("magic")
        install.packages("abind")
        library(magic)
        library(MASS)

#### Datos 

        miu1<-c(0,-1)
        miu2<-c(-2,0,2)
        sigma11<-matrix(c(1,-1/4,-1/4,1/2),2)
        sigma22<-matrix(c(1,1/3,-1/2,1/3,1/4,0,-1/2,0,1),3)

#### Generar una muestra aleatoria para X, n=100

        medias<-c(miu1,miu2)
        varianzas<-adiag(sigma11,sigma22)
        varianzas

        muestra <-mvrnorm(100,medias,varianzas)

#### i) ¿Cual es la distribucion del vector aleatorio X=c(x1,x2)?
##### Tenemos la proposicion "Sean x1, x2,...xn, vectores aleatorios independientes donde cada uno distribuye normal multivariado"
##### Entonces X=c(x1,x2) distriburan tambien normal multivariado. Calculemos ahora sus parametros:

        media_X<-c(miu1,miu2)
        media_X

        varianza_X <-adiag(sigma11,sigma22)
        varianza_X

##### Asi, X distribuye normal multivariada 5, con parametros (media_X,varianza_X)

##### Nota: los otros incisos no los hicimos pues no vimos funcion generadora de momentos en clase.

