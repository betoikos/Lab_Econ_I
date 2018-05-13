library(MASS)

USample = function(n,sigmasquare){
  meanu = matrix(0,n,1)
  varu = sigmasquare*diag(1,n,n)
  U = mvrnorm(n,meanu,varu)
  return(U)
}

Muestrau = matrix(USample(800,0.4),800,1)
XSample = matrix(data = cbind(runif(800,1,1),runif(800,0,10)),800,2)
b = runif(2,-5,5)


bmco = b + solve(t(XSample)%*%XSample)%*%t(XSample)%*%Muestrau
bmco

