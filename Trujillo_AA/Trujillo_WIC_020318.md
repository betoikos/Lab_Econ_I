# Segunda Clase R

Antes que nada, hay que picarle al logo de Rstudio

![alt text](C:/Users/alex_/OneDrive/Escritorio/Econometria/R.png "Logo.")

Abrimos un nuevo R script puchandole en 
![alt text](C:/Users/alex_/OneDrive/Escritorio/Econometria/Nuevo.png "Logo.") Y despues en *R script*.


## Aprendiendo a guardar el Script

Usamos el comando **getwd()** para saber en dónde está guardándose el *script*.
Usamos el comando **setwd()** para guardarlo en una nueva carpeta.

## Aprendiendo condicionales

Se hacen operaciones de condicionales con == , <= y !=

El == sirve para saber si una variable es igual a otra.

El <= sirve para saber si una variable es menor a otra

Por último, != es para ver si una variable es diferente a otra

Ejemplo:

    7 == 7
    7!=8
    7==8
    7<=8



### Usando funciones de condicionales

    a=1
    b=1
### Verificando si dos numeros son iguales
    if(a == b){
    print("Los dos numeros son iguales!!")
    } else {
    print ("Los dos numeros no son iguales")
    }

### Verificando si el primer número es menor o igual al segundo
if(a<=b){
  print(" a es menor o igual a b!")
} else {
  print("a es mayor a b")
}


## Funciones

Ahora vamos a aprender a crear nuestras propias funciones. Esto funciona con el comando **Function**
help("function") #ayuda a encontrar cosas en la documentación de R

    sqrt(25) 

    nrow(x)
    ncol(x)

    cuadrado = function(z){
    y=z^2
    return(y)
    }
    cuadrado(6)

    raiz = function(x){
    if(x<0){
    print("El numero es negativo y me niego a regresarte numeros imaginarios")
    } else {
    return(sqrt(x))
    }
    }
    raiz(81)
    raiz(-4)

    hipo = function(a,b){
    c = sqrt(a^2+b^2)
    return(c)
    }

    hipo(-4,4)

    chicharronera = function(a,b,c){
    cond = b^2>=4*a*c
    if (cond){
    z1 = (-b+sqrt(b^2-4*a*c))/2*a
    z2 = (-b-sqrt(b^2-4*a*c))/2*a
    Z = matrix(c(z1,z2),1)
    return(Z)
    } else {
    print("El polinomio tiene raíces complejas, por favor utiliza otro método")
    }
    }

    chicharronera (-2,-2,2)

## Loops

Otra función muy importante que tenemos con R es el uso de los loops. Generar variables en secuencia, hasta que la condición que pongamos lo detenga.

Ejemplo:

    x = 1
    while(x<5) {
    x = x+1
    print(x)
    }

 ### next hace que se brinque un paso el loop
 ### break termina el loop abruptamente

    x = 1
    while(x<8){
    x = x+1
    if (x==4) next
    print(x)
    }

### Ahora el **for**
    for(i in 1:3000){
    print(paste("Este es el loop",i))
    print(i*i)
    }

    for (year in c(2010,2011,2012,2013,2014,2015)){
    print(paste("Este es el año",year))
    }

## Algoritmos en práctica
### Un algoritmo muy comun es el algoritmo de Euclides para el máximo común divisor, este se construye de la siguiente manera:
    mcd <- function(a,b){
    A = a
    B = b
    if(A!=0){
    while(B != 0) {
      if(A>B){
        A=A-B
      } else {
        B=B-A
      }
    }
    return(A)
    } else {
    return(B)
    }   
    }

    mcd(0,8)
    mcd(5,25)
    mcd(10,0)
    
### Así se genera el beta de Mínimos Cuadrados Ordinarios

    MCO = function(x,y){
    X=x
    Y=y
    xr=nrow(X)
    yr=nrow(Y)
    if(xr==yr){
    b=solve(t(X)%*%X)%*%t(X)%*%Y
    return(b)
    }else{
    print("No se puede llevar a cabo la operación, verifique las dimensiones de las matrices")
    }
    }

    A=matrix(c(5,9,15,65,98,84,5,48,8,32,45,788,4,8,98),3)
    B=matrix(c(7,15,16,80,97,100,9,50,8,33,56,932,4,9,102),3)
    MCO(A,B)


### Por último creamos numeros normales aleatorios.
library(MASS)
n = 30

mu = 0
su = 0.2

mx = c(4,2,0,0,2)
sx = matrix(c(4,-1,0,0,0,
              -1,1,0,0,0,
              0,0,1,0,0,
              0,0,0,9,2,
              0,0,0,2,4),5)
Usample = rnorm(n,mu,su)
Xsample = mvrnorm(n,mx,sx)

Usample
Xsample
  