# Ejercicio 2.5
# Susana Almeida Mart??nez

#Encontrar funciones para bmco, bmcr 

#b m??nimos cuadrados ordinarios:

bmco= function(x,y){
  xr=nrow(x)
  yr=nrow(y)
  X=cbind(rep(1,xr),x)
  if(xr==yr){
    b=solve(t(X)%*%X)%*%t(X)%*%y
    return(b)
  } else {
    print("Error")
  }
}


# b m??nimos cuadrados restringidos

bmcr=function(x,y,R,r){
  xr=nrow(x)
  X=cbind(rep(1,xr),x)
  yr=nrow(y)
  rc=ncol(R)
  rr=nrow(R)
  xc=ncol(X)
  if (xr==yr & rc==xc){
    b=solve(t(X)%*%X)%*%t(X)%*%y
    b-solve(t(X)%*%X)%*%t(R)%*%solve(R%*%solve(t(X)%*%X)%*%t(R))%*%(R%*%b-r)
  }else
    print("Error")
}

