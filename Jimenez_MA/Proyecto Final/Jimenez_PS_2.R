#----------Tarea 2----------
#Pregunta 5

# Solamente se requiere especificar Y, X y las restricciones en forma matricial.

n<-10 #Colocar número de observaciones.
b<- #Colocar vector deverdaderos parámetros.
  U<- #Colocar el vector de U (media cero y homocedástica).
  Xj<- #Colocar la matriz de X (variables independientes).
  Constante<-matrix(rep(1,n),n)
X<-cbind(Constante,Xj)
R<- # Colocar matriz de restricciones.
  r<- #Colocar vector de resultados de las restricciones.
  
  bMCO = function(b,X,U){
    a<-b+(solve(t(X)%*%X)%*%t(X)%*%U)
    return(a)
  }

bMCR = function(bMCO,X,R,r){
  b<-bMCO-((solve(t(X)%*%X))%*%t(R)%*%(solve(R%*%solve(t(X)%*%X)%*%t(R)))%*%((R%*%bMCO)-r))
  return(b)
}

bMCO<-a
bMCR<-b
