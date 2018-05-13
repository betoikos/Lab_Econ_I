##############Ejercicio 5, Tarea 2.######################

#Función para estimadores MCO y varianza

#x es una matriz de n (observaciones) por k variables explicativas
#Y es una matriz columna de n observaciones.
#varianza es una variables logica, que en caso de ser "True" otorga además de los estimadores la varianza

EstMCO=function(x,Y,varianza){
  X=cbind(rep(1,nrow(x)),x)
  Cnames=matrix(,1,ncol(x))
  for(i in 1:ncol(x)){
    Cnames[1,i]=(paste("\beta",i))
  }
  c=cbind("Intercepto",Cnames,"Var(U)")
  if(nrow(x)==nrow(Y)){
    B=solve(t(X)%*%X)%*%t(X)%*%Y
    VU=(1/(nrow(X)-ncol(X)))*(t(Y-X%*%B)%*%(Y-X%*%B))
    Est=matrix(rbind(B,VU),ncol=1,dimnames = list((as.vector(c)),c("Valor estimado")))
    if (varianza==F){matrix(Est[1:ncol(X),1],ncol=1,dimnames = list((cbind("Intercepto",Cnames)),c("Valor estimado")))
    } else {print(Est)} 
  } else {print("El número de observaciones en x es distinto a las de Y")}
}
EstMCO(D15.1[1:120,],Y1,varianza=T)

#Función para estimadores MCR y varianza

#x es una matriz de n (observaciones) por k variables explicativas
#Y es una matriz columna de n observaciones.
#R es una matrix de restricciones de qx(k+1), tal que q es el número de restricciones.
#r es una matriz columna de qx1
#varianza es una variables logica, que en caso de ser True otorga además de los estimadores la varianza


EstMCR=function(x,Y,R,r,varianza){
  X=cbind(rep(1,nrow(x)),x)
  Cnames=matrix(,1,ncol(x))
  for(i in 1:ncol(x)){
    Cnames[1,i]=(paste("\beta",i))
  }
  c=cbind("Intercepto",Cnames,"Var(U)")
  if(nrow(X)==nrow(Y) & ncol(X)==ncol(R)){
    B=solve(t(X)%*%X)%*%t(X)%*%Y
    BR=B-solve(t(X)%*%X)%*%t(R)%*%solve(R%*%solve(t(X)%*%X)%*%t(R))%*%(R%*%B-r)
    VU=(1/(nrow(X)-ncol(X)))*(t(Y-X%*%BR)%*%(Y-X%*%BR))
    Est=matrix(rbind(BR,VU),ncol=1,dimnames = list((as.vector(c)),c("Valor estimado")))
    if (varianza==F){matrix(Est[1:ncol(X),1],ncol=1,dimnames = list((cbind("Intercepto",Cnames)),c("Valor estimado")))
      } else {print(Est)}
  } else {print("El número de observaciones en X es distinto a Y o el número de restricciones supera los párametros")}
}
EstMCR(D15.1[1:120,],Y1,diag(4),rep(0,4),varianza=F)

