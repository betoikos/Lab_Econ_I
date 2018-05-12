library(MASS)

#Función para mínimos cuadrados ordinarios
#Inputs:
#b: vector de constantes de kx1
#X: matriz de constantes nxk
#U: vector aleatorio de nx1 con distribución normal multivariada N(0,sigmasquare*I)
#Y = Xb + U 

f1bmco = function(b,X,U){
  bmco = b + solve(t(X)%*%X)%*%t(X)%*%U
  return(bmco)
}

f2bmco = function(X,Y){
  bmco = solve(t(X)%*%X)%*%t(X)%*%Y
  return(bmco)
}

#Función para mínimos cuadrados reestringidos
#Inputs:
#b: vector de constantes de kx1
#X: matriz de constantes nxk
#U: vector aleatorio de nx1 con distribución normal multivariada N(0,sigmasquare*I)
#Y = Xb + U 
#R: matriz de constantes kxk

fbmcr = function(b,R,X,U){
  bmco = b + solve(t(X)%*%X)%*%t(X)%*%U
  r = R%*%b
  bmcr = bmco - solve(t(X)%*%X)%*%t(R)%*%solve(R%*%solve(t(X)%*%X)%*%t(R))%*%(R%*%bmco - r)
}