#
#           Evelyn Magali Suárez Reyes
#
#############################################################################################
##
##   Tarea 3. Ejercicio 6.
##
#############################################################################################
## Sea X=(X1,X2,X3,X4) un vector aleatorio que se distribuye normal con media m y varianza s.
# ¿ Cuál es la distribución del vector (X3,X2,X4,X5)?. Generé una muestra aleatoria de tamaño 200.
# Primero definamos la media y varianza de X y generemos la muestra aleatoria necesaria.

  mx=c(0,0,1,1)
  sx=matrix(c(1,0,1,0,0,9,0,1,1,0,4,0,0,1,0,9),nrow=4)
  X=mvrnorm(200,m,s)
  A=matrix(c(0,0,0,1,0,1,0,0,1,0,0,0,0,0,1,0),nrow=4)

  # Veamos que (X3,X2,X4,X5)=Ax(X1,X2,X3,X4)', así que por una proposición sabemos que 
  # tiene distribución normal con varianza sy=A*sx*A'  y media my=S*mx,
  Y=A%*%t(X)
my=A%*%mx
sy=A%*%sx%*%t(A)
