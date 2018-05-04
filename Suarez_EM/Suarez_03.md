# Humberto Martínez García
# hmartinez@colmex.mx
# Licence Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)

# ----------------------------------
# Segunda sesión de laboratorio en R
# ----------------------------------

# Obtener la ruta de trabajo actual
getwd()

# Para fijar el directorio de trabajo deben usar el código de abajo. 
# Utilicen el directorio de la carpeta con su nombre

setwd("C://Users/Humberto Martínez/Documents/GitHub/Lab_Econ_I/H/R_drafts")

# Verificar que el directorio se fijó correctamente
getwd()

# Para guardar el script sólo es: ctrl+s

# -------------------------------------------------------------------------

# En esta sesión


# Algoritmos
# Programación
# Operadores relacionales
# Condicionales 
# Funciones
# Loops (Ciclos)
# Paquetes 

# -----------------------
# Operadores relacionales

7==4

7 == 8 # Es 7 igual a ocho?

7 == 7 # Es 7 igual a 7?

7 != 7 # Es 7 distinto de 7?

7 != 8 # Es 7 distinto de 8?

7 > 7 # Es 7 mayor a 7?

7 < 7 # Es 7 menor a 7?

7 <= 8 # es 7 menor o igual a 8?

7 >= 8 # Es 7 mayor o igual a 8?

# -----------------------
# Condicionales
a = 1
b = 7
# Verificando si dos números son iguales
  if(a == b){
    print("Los dos números son iguales!!")
  } else {
    print("Los dos números son distintos!!")
  }

# Verificando si dos números son distintos
if(a != b){
  print("Los dos números son distintos !!")
} else {
  print("Los dos números son iguales !!")
}

# Verificando si el primer número es menor o igual al segundo
if(a <= b){
  print(" a es menor o igual a b!")
} else {
  print(" a es mayor a b!")
}

# ----------------------------------------------------
# Funciones

################################## Llamando funciones 

help("function") # Ayuda a encontrar cosas en la documentación de R

sqrt(25) # Regresa la raíz cuadrada del argumento

nrow(X) # Regresa el número de filas de la matriz X
ncol(X) # Regresa el número de columnas de la matriz X

################################## Haciendo funciones

# Cuadrado
# Input: un número real
# Output: el cuadrado del número real

cuadrado = function(z){
  y=z^2
  return(y)
}

cuadrado(5)


# Raíz
# Input: un número real x
# Output: si x es positivo regresa la raíz del número, si no lo es entonces regresa un mensaje.
raiz = function(x){
  if(x<0){
    print("El número es negativo y me niego a regresarte números imaginarios")
  } else {
    return(sqrt(x))
  }
}

raiz(9)

# Hipotenusa
# Input: dos números reales a, b "altura" y "base"
# Output: un número real c, "hipotenusa"

hipo = function(a,b){
  c = sqrt(a^2+b^2)
  return(c)
}

hipo(3,4)

# Chicharronera para polinomios de la forma ax^2+bx+c
# Input: tres números reales a, b, c
# Output: si se cumple que b^2>=4ac entonces se obtienen las raíces del polinomio, sino, entonces se regresa un mensaje

chicha = function(a,b,c){
  cond = b^2 >=4*a*c
  if(cond){
    z1 = (-b+sqrt(b^2 - 4*a*c))/2*a
    z2 = (-b-sqrt(b^2 - 4*a*c))/2*a
    Z = matrix(c(z1,z2),1)
    return(Z)
  } else {
    print("El polinomio tiene raíces complejas, por favor utiliza otro método")
  }
}

# Aplicando la chicharronera en x^2+2x-1
chicha(1,2,-1)

# -------------------------------------------
# Loops

###################################### While

x = 1
while(x < 5) {
  x = x+1 
  print(x)
  }

# "next" hace que se brinque un paso el loop
# "break" termina el loop abruptamente

x = 1
while(x < 8) {
  x = x+1
  if (x == 4) next 
  print(x)
  }

###################################### For

for(i in 1:30){
  print(paste("Este es el loop",i))
  print(i*i)
}

year = 98798798798798

for (year in c(2010,2011,2012,2013,2014,2015)){
  print(paste("Este es el año", year))
}


# --------------------------------------------------
# Algoritmos en práctica


# Algoritmo de Euclides para el máximo común divisor
# Input: dos números enteros reales a y b
# Output: el máximo común divisor de los dos números
mcd <- function(a, b){
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

mcd(10,7)

mcd(25,15)

mcd(0,5)

mcd(8,0)
# Algoritmo para calcular MCO
# Input: matriz x de variables explicativas, matriz y de variables dependientes
# Output: vector b que miniza la suma de residuos al cuadrado en y=xb-U
MCO = function(x,y){
  X=x
  Y=y
  xr=nrow(X)
  yr=nrow(Y)
  if(xr==yr){
    b=solve(t(X)%*%X)%*%t(X)%*%Y
    return(b)
  } else {
    print("No se puede llevar a cabo la operación, verifique las dimensiones de las matrices")
  }
}


A=matrix(c(5,9,15,65,98,84,5,48,8,32,45,788,4,8,98,7,15,8),6)
A

B=matrix(5:10,6)
B

C=matrix(5:9,5)
C
MCO(A,B)

MCO(A,C)

## -----------------------------------------------------------------------------

#
# Libraries
# 

# Buscar por un paquete

# Instalar un paquete

# Llamar a un paquete



## -----------------------------------------------------------------------------

## Muestras aleatorias normales

  library(MASS)

  n = 30 # Tamaño de la muestra

  mu = 0 # Media de U
  su = 0.2 # Varianza de U

  mx = c(4,2,0,0,2) # Vector de medias de X 
  sx = matrix(c(4,-1,0,0,0,
                -1,1,0,0,0,
                0,0,1,0,0,
                0,0,0,9,2,
                0,0,0,2,4),5) # Varianza de X

  Usample = rnorm(n,mu,su) # Muestra aleatoria de U
  Xsample = mvrnorm(n,mx,sx) # Muestra aleatoria de x1 y x2


  Usample
  Xsample
