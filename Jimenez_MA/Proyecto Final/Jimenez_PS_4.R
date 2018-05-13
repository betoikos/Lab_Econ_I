#----------Tarea 4----------
library(mvtnorm)
set.seed(100)

#Pregunta 5
n<-10 #Colocar n observaciones.
Mean<-rep(0,n) #Vector de medias.
VarU<-1 #Colocar sigma cuadrada si se cumple homocedasticidad.
Sigma4<-diag(VarU,n)
U<-t(rmvnorm(1,mean=Mean,sigma=Sigma4))

#Mínimos cuadrados ordinarios
n1<-800
Sigma5<-matrix(c(0.8,0.4,-0.2,0.4,1,-0.8,-0.2,-0.8,2),3) 
Muestra<-rmvnorm(n1,mean=c(1,0,2),sigma=Sigma5)

Y<-Muestra[,1]
Xj<-Muestra[,2:3]
Constante<-matrix(rep(1,n1),n1)
X<-cbind(Constante,Xj)
bMCO<-(solve(t(X)%*%X))%*%(t(X)%*%Y)
