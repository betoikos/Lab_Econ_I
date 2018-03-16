## Lab Econ marzo1

#Operadores relacionares para comparar dos numeros, asigna booleanos
7 == 8 #pregunta si es un numero igual, asigna un booleano
3 != 7 # Es 3 diferente de 7?
3 > 7 # es 3 mayor a 7?
3 < 7 # es 3 menor a 7?
3 <= 8 # es 3 menor o igual a 8?
3 >= 8 # es 3 mayor o igual a 8?


# Condicionales
a=1
b=1
# Verificando si los numeros son iguales
if (a==b)  {
    print("los dos numeros son iguales")
  } else { 
    print("lso dos numeros son distintos")
    }

a=1
b=1
# Verificando si los numeros son diferentes
if (a!=b)  {
  print("los dos numeros son diferentes")
} else { 
  print("lso dos numeros son iguales")
}

#---------------------------

#Funciones

##### llamando funciones
help("function") #encuetra documentación de una función

sqrt(25) #regresa raiz cuadrada

nrow(X) # Indica el numero de renglones de la matriz X
ncol(X) # Indica el numero de columnas de la matriz X

########haciendo funciones

#cuadrado
#Input: num real
#output: el cuadrado del num real

cuadrado = function(z){
  y=z^2
  return(y)
} 

cuadrado(5)

#raiz
#Input: numero real positivo
#Output: Raiz del numero positivo

raiz = function(x){
  
  if (x < 0) {
    print("el numero es negativo y no regresare num imaginarios")
  } else {
    return(sqrt(x)) }
}

raiz(25)

#Hipotenusa
#input: 2 numeros reales
#output: valor de la hipotenusa

hipotenusa = function(a,b){
        c=sqrt(a^2+b^2)
      print(c)
    
  }
  
hipotenusa(-3,5)



#Chicharronera para polinomios de la forma ax^2 + bx +c
#si b^2>=4ac entonces se obtienen las raices del polinomio

Chicha = function(a,b,c){
  cond = b^2 >=4*a*c
  if(cond){
    z1 = (-b+sqrt(b^2 - 4*a*c))/2*a
    z2 = (-b-sqrt(b^2 - 4*a*c))/2*a
    Z = matrix(c(z1,z2),1)
    return(Z)
  } else {
    print("Polinomio con raices complejas")
  }
}

Chicha(3,4,5)

Chicha(1,4,2)




#________________--
####Loops


####While
#valores dentro de una fn son locales, no se pueden recuperar

x=1
while (x < 5) {
  x = x+1
  print(x)
}

#solo dentro del loop
# next hace que se brinque un paso el loop
#break para terminar el paso abruptamente



x=1
while (x <8) {
  x = x+1
  if (x==4)next
  print(x)
}


#Paste  Pega string con valor numerico y lo vuelve string
#For

for (i in  1:30) {
  print(paste("este es el loop",i))
  print(i*i)
}


for (year in c(2010,2011,2012,2013,2014)){
  print(paste("este es el año", year))
}


#generar algoritmo de euclides de MCD
#input: dos reales a y b
#ouput: MCD

MCD <- function(a,b){
  A =a
  B =b
  if (A !=0){
    while (B!=0) {
      if (A>B){
        A=A-B
      }else {B=B-A}
      return(A)
    }
  }
  else {return (B)}
}

MCD(10,5)
MCD (0,5)




#Algoritmo para calcular MCO
#input: matriz X de variables explicativas, matriz Y de var 
#Output: vector b que miniza la suma de residuos al cuadrado en y=xb-U

MCO= function (x,y){
  X=x
  Y=y
  xr=nrow(X)
  yr=nrow(Y)
  if(xr==yr){
    b=solve(t(X)%*%X)%*%t(X)%*%Y
    return(b)
  }else {
    print("verifique las dimensiones de la matriz")
  }
}


D=matrix(c(5,9,3,4,98,4,5,48,8,32,22,788,4,5,98,7,15,8),6)
D

E=matrix(5:10,6)
E

F=matrix(5:9,5)
F

MCO (D,E)

MCO (D,F)



#_______________
#libraries

#buscar paquetes
#instalar un paquete
#llamar un paquete

###Llamar un paquete

#muestras  aleatorias normales

library(MASS)

n=30 #Tamaño de la muestra

mu= 0 #media de U una variable aleatoria con 30 observaciones
su= 0.2 #varaianza de u


#rnorm Muestra aleatoria de U , solo 1 var aleat
#mvnorm  Muestra aleatoria de vector normal multivariado



####Este es parte del código del laboratorio para crear las matrices, tomado del reposotorio de Humberto



Usample = rnorm(n,mu,su) # Muestra aleatoria de U
Usample

mx = c(4,2,0,0,2) # Vector de medias de X 
sx = matrix(c(4,-1,0,0,0,
              -1,1,0,0,0,
              0,0,1,0,0,
              0,0,0,8,2,
              0,0,0,2,4),5) # Varianza de X


Xsample = mvrnorm(n,mx,sx) # Muestra aleatoria de x1 y x2
Xsample



