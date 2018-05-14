#
#           Evelyn Magali Suárez Reyes
#
####################################################
##
##   Tarea 3. Ejercicio 5.
##
####################################################
#
# Sea X=(X1,X2)', donde X1 tiene una distribución normal con media m1 y varianza s1
# y X2 un vector con districución normal con varianza s2 y media m2 independientes.
# Generar una muestra aleatoria para X de tamaño 100
library(MASS)
# Primero definamos las medias y las varianzas de X1 y X2
m1=c(0,-1)
m2=c(-2,0,2)
s1=matrix(c(1,-.25,-.25,.5),2)
s2=matrix(c(1,1/3,-1/2,1/3,1/4,0,-.5,0,1),3)
# Por una proposici´n vista en clase, savemos que si dos vectores se distribuyen normal
#y son independiente en tonces el vector conformado por estos dos vectores, 
# tambienén se distribuye normal con media m=(m1,m2) y varianza con renglones (s1,0) y (0,s2)
# Así que utilizando esto, escribimos la media de X (m) y la varianza de X (s).
m=c(m1,m2)
fs=cbind(s1,matrix(c(rep(0)),ncol=3,nrow=2))
ss=cbind(matrix(c(rep(0)),ncol=2,nrow=3),s2)
s=rbind(fs,ss)
#Generando una muestra para la matriz X de tamaño 100
x=mvrnorm(800,m,s)
