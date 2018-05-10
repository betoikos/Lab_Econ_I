# Ejercicio 2.5

# Desarrolle una función para bmco y bmcr


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

# Ejemplo

x=matrix(c(-1,2,6,17,22,32,4,53,-69,77,83,91),byrow=T,nrow=4)
x
y=matrix(c(1,6,7,4),nrow=4,1)
y

bmco(x,y)

# bmcr

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

x=matrix(c(2,0,0,1,7,9),ncol=2)
Y=matrix(c(1,0,5),ncol=1)
R=matrix(c(0,1,1),ncol=3)
r=2

bmcr(x,Y,R,r)


