# Ejercicio 2.5

library(MASS)

betaMCO = function(b,X,U){
  betaMCO = b + solve(t(X)%*%X)%*%t(X)%*%U
  return(B)
}


betaMCR = function(b,R,X,U){
  betaMCR = b + solve(t(X)%*%X)%*%t(X)%*%U
  r = R%*%b
  betaMCR = betaMCO - solve(t(X)%*%X)%*%t(R)%*%solve(R%*%solve(t(X)%*%X)%*%t(R))%*%(R%*%betaMCO - r)
}