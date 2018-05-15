#Rogelio Daniel González González
#Colegio de México
#Econometría I
#Prof. Eneas Caldiño
#Trabajo Final

#2.5


#Para utilizar esta función se necesita una matriz X de orden nxk y una matriz Y de orden nx1.

#Primero calculamos el vector de mínimos cuadados ordinarios
#Después, utilizamos la formula de MCR


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
    print("Las dimensiones no coinciden, carnal. Échale ganas.")
}
