# Ejercicio 2.5

## Descargamos la librería que nos funciona 
library(MASS)

## Creamos la función Bmco = ((X'X)-1)(X'U)
betaMCO = function(b,X,U){
  betaMCO = b + solve(t(X)%*%X)%*%t(X)%*%U
  return(B)
}

## Creamos la función de mínimos cuadrados restringidos, tomando la beta de MCO y restando el término de las restricciones
betaMCR = function(b,R,X,U){
  betaMCR = b + solve(t(X)%*%X)%*%t(X)%*%U
  r = R%*%b
  betaMCR = betaMCO - solve(t(X)%*%X)%*%t(R)%*%solve(R%*%solve(t(X)%*%X)%*%t(R))%*%(R%*%betaMCO - r)
}