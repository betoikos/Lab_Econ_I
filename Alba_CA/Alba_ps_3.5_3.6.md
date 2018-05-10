
#### Este paquete se implementó gracias a Jhair López

    install.packages("magic")
    library(magic)
    library(MASS)

# Ejercico 3.5

### Generar una muestra aleatoria para X, n=100

    m1=c(0,-1)
    m2=c(-2,0,2)
    s1=matrix(c(1,-.25,-.25,.5),2)
    s2=matrix(c(1,1/3,-1/2,1/3,1/4,0,-.5,0,1),3)
    m=c(m1,m2)
    s=adiag(s1,s2)
    x=mvrnorm(800,m,s)

# Ejercicio 3.6

    m=c(0,0,1,1)
    s=matrix(c(1,0,1,0,0,9,0,1,1,0,4,0,0,1,0,9),4)
    x=mvrnorm(200,m,s)
   