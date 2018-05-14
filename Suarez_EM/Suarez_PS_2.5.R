#
#           Evelyn Magali Suárez Reyes
#
####################################################
##
##   Tarea 2. Ejercicio 5.
##
####################################################
#
# Sea X una matriz n*k de número reales fijos, b un vector de dimensión k de números reales
# fijos, U un vector aleatorio de dimensión n con E(U)=0 var(U)=sigma^2*I  y Rb=r. Generar
#funciones para b_MCO, b_MCR.
#
#
# Función para obtener el vector de coeficientes por mínimos cuadrados ordianrios 
library(MASS)
MCO = function(x,y){
  X=x
  Y=y
  xr=nrow(X)
  yr=nrow(Y)
  if(xr==yr){
    b=solve(t(X)%*%X)%*%t(X)%*%Y
    return(b)
  } else {
    print("No se puede llevar a cabo la operación, verifique las dimensiones de las matrices.")
  }
}


A=matrix(c(2,2,2,2,2,2,3,4,5,10,2,4),4)
A

B=matrix(c(0,1,1,3),4)
B

C=matrix(c(1,1,1,1,1,1,1,1,1),ncol=3)
C
MCO(A,B)

MCO(A,C)
# Función para el estimador de coeficientes en mínimos cuadrados restringidos
MCR=function(X,Y,R,r){
  
  Yr=nrow(Y)
  Rc=ncol(R)
  Rr=nrow(R)
  rc=ncol(r)
  rr=nrow(r)
  
  Xr=nrow(X)
  X=cbind(rep(1,Xr),X)
  Xc=ncol(X)
  if (Xr==Yr & Rc==Xc & Rr==rr){
    b=solve(t(X)%*%X)%*%t(X)%*%Y
    b-solve(t(X)%*%X)%*%t(R)%*%solve(R%*%solve(t(X)%*%X)%*%t(R))%*%(R%*%b-r)
  }
  
  else{ print("No se puede llevar acabo la operación, definir los valores de X, Y, R y r como matrices y verificar dimensiones de éstas. Además recuerda que el número de columnas de x más uno es igual a las de r")
    
    if (Xr!=Yr){ print("La operación no se puede llevar acabo, verifica que las dimensiones de X y Y sean correctas (no olvides que el número de filas de X es igual al número de filas de Y")}
    if (Rc!=Xc) { print("La operación no se puede llevar acabo, verifica que las dimensiones de R y X sean correctas (no olvides que el número de columnas de R es igual al número de columnas de X más 1)")}
    if (Rr!=rr) { print("La operación no se puede llevar acabo, verifica que las dimensiones de R y r sean correctas (no olvides que el número de filas de R es igual al número de filas de r")}
  }}

# Ejemplo para ver el resultado de la función
X=matrix(c(1,0,0,1,1,0),ncol=2)
Y=matrix(c(1,0,0),ncol=1)
R=matrix(c(1,1,1),ncol=3)
r=matrix(c(1),,ncol=1)

MCR(X,Y,R,r)
#Ejemplo para ver cuando las dimensiones no son las correctas
MCR(X,Y,R,r)

# Ejemplo para ver cuando las dimensiones de la matríz son incorrectas

X=matrix(c(1,0,0,0,1,0,0,0,1),ncol=3)
Y=matrix(c(1,0,2),ncol=1)
R=matrix(c(1,1,1,1,1,1,1,1),ncol=2)
r=matrix(c(1,1,1),ncol=1)

MCR(X,Y,R,r)
