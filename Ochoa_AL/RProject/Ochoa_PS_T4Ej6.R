#Tarea 4
#Ejercicio 6

library(MASS)

#Generar funcion para obtener U
#Funcion
#ObtU
#input: varU=sigmaUsq: escalar, n = tamaño de la muestra
#output: U:vector 1xn

ObtU = function(sigmaUsq,n){
  
  muU=0
  
  U<-rnorm(n,muU,sqrt(sigmaUsq))
  U<-matrix(U,n)
  nrow(U)
  ncol(U)
  return(U)
}
 


n=3
sigmaUsq=2


ObtUmulti = function(sigmaUsq,n){
  
  muU=matrix(0,n,1)
  VarU=sigmaUsq*diag(n)
  U<-mvrnorm(n,muU,VarU)
  nrow(U)
  ncol(U)
  return(U)
}


a<-ObtUmulti(2,4)
a

##Obtener U

n=800
U1<-ObtU(0.04,n)
U1

#Generar X aleatoria


muX<-matrix(c(3,0,4,1),4)
VarX<-matrix(c(3,0,1,0,
               0,9,0,1,
               1,0,4,0,
               0,1,0,2),4)

Xsample<-mvrnorm(n,muX,VarX)
Xsample
nrow(Xsample)
ncol(Xsample)

vone<-matrix(1,n,1)
vone
DaFrX<-as.data.frame(Xsample)
# Poniendo nombre a las columnas 
names(DaFrX) <- c("X1","X2","X3","X4")

View(DaFrX)

X<-cbind(vone,DaFrX$X1,DaFrX$X2,DaFrX$X3,DaFrX$X4)
X
nrow(X)
ncol(X)

bo<-matrix(c(2,0.5,-1.2,3,1),5)
bo
#Dividir b valor verdadero en escalares para estimar Yi
bo0<- bo[1,1]
bo1<- bo[2,1]
bo2<- bo[3,1]
bo3<- bo[4,1]
bo4<- bo[5,1]  
bo0
bo1
bo2
bo3
bo4

Yj<- bo0+bo1*DaFrX$X1+bo2*DaFrX$X2+bo3*DaFrX$X3+bo4*DaFrX$X4+U1
Yj<-matrix(Yj,n)
nrow(Yj)
ncol(Yj)


#a) fn para obtener bMCO

#Funcion  
# bmco1
# Input: Matriz X, vector Y de muestra
# Output: Entrega el bmco de tantos parametros como haya en Xvector incluyendo un termino independiente si X tiene columna de 1s

bmco1 = function(X,Y){
  XX=t(X)%*%X
  InvXX = solve(XX)
  InvXX
  XtransY = t(X)%*%Y
  XtransY
  b= InvXX%*%XtransY
  return(b)
}


#Funcion
#bmco2
#input: b:vector de valores verdaderos(kx1), X:matriz nxk reales fijos
#input: u: vector aleat de dim nx1
#Output: bmco

bmco2 = function(b,X,U){
  XX=t(X)%*%X
  InvXX = solve(XX)
  bmco=b+InvXX%*%t(X)%*%U
  return(bmco)
}

#Obtener bmco
#Forma 1

A1bmco<-bmco1(X,Yj)
A1bmco

#Forma 2
A2bmco<-bmco2(bo,X,U1)
A2bmco
