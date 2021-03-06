#Rogelio Daniel Gonz�lez Gonz�lez
#Colegio de M�xico
#Econometr�a I
#Prof. Eneas Caldi�o
#Trabajo Final

#2.5


#Para utilizar esta funci�n se necesita una matriz X de orden nxk y una matriz Y de orden nx1.

#Primero calculamos el vector de m�nimos cuadados ordinarios
#Despu�s, utilizamos la formula de MCR


Bmcr=function(x,y,R,r){
  xr=nrow(x)
  yr=nrow(y)
  
  wan=matrix(1,xr,1)
  X=matrix(c(wan,x),xr,ncol(x)+1)
  
  rc=ncol(R)
  rr=nrow(R)
  xc=ncol(X)
  if (xr==yr & rc==xc){
    Bmco=solve(t(X)%*%X)%*%t(X)%*%y
    Bmcr= Bmco -solve(t(X)%*%X)%*%t(R)%*%solve(R%*%solve(t(X)%*%X)%*%t(R))%*%(R%*%Bmco-r)
  }else
    print("Las dimensiones no coinciden, carnal. �chale ganas.")
}
