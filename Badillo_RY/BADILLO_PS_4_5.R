#ejercicio 4.5
#genera una muestra para x=100 
library(MASS)
u= function(sigma, n){
  j=dim(sigma)
  zero=matrix(0, j[2], 1)
  w   = mvrnorm(n, zero, sigma)
return(w)
}

S=matrix(c(1,0,4,1),2,2)
u(S,800)


