#Tarea 2
#Ejercicio 5

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
  


#b) fn para obtener bMCR

#Funcion para calcular bmcr conociendo bmco

# bmcr
# Input: bmco, Matriz X,matriz R, vector r
#input: bmco: estimador bmco kx1, X:matriz nxk reales fijos
#input: R: matriz qxk r: vector aleat de dim qx1
# Output: Entrega el bmcr

bmcr = function(bmco,X,R,r){
  XX=t(X)%*%X
  InvXX = solve(XX)
  InvRXXR=solve(R%*%InvXX%*%t(R))
  bmcr<-bmco-InvXX%*%t(R)%*%InvRXXR%*%(R%*%bmco-r)
  return(bmcr)
}

#ejemplo

library(MASS)
n=100
k=3
mZ=c(1,0,2)
VarZ=matrix(c(0.8,0.4,-0.2,
              0.4,1.0,-0.8,
              -0.2,-0.8,2.0),3)
set.seed(5)
Zsample<-mvrnorm(100,mZ,VarZ)
vone<-matrix(1,100,1)
vone
DaFrZ<-as.data.frame(Zsample)
# Poniendo nombre a las columnas 
names(DaFrZ) <- c("Yj","X1","X2")
Zsample
View(DaFrZ)

X<-cbind(vone,DaFrZ$X1,DaFrZ$X2)
X
nrow(X)
ncol(X)
Yj<- Zsample[,1,drop=FALSE] #me quedo con la columna 1
Yj
nrow(Yj)

#Calcular bmco1
A1<-bmco1(X,Yj)
A1
#calcular bmco2

U<-rnorm(100,1,0.04)
U<-matrix(U,100)
nrow(U)
ncol(U)
b<-matrix(c(1,2,3),3)
b
A2<-bmco2(b,X,U)
A2

#Calcular bmcr

#definimos R
R<-matrix(c(1,1,0,-1,1,1),2)
R
#definimos r
r<-matrix(c(1,0.5),2)
r
#calcular bmcr
A1bmcr1<-bmcr(A2,X,R,r)
A1bmcr1