#Rogelio Daniel González González
#Colegio de México
#Econometría I
#Prof. Eneas Caldiño
#Trabajo Final

#3.5

install.packages("magic")
library(magic)
#Este paquete fue instalado con la ayuda de Yahir Lópeñ Lópeñ
#generar una muestra aleatoria para n=100
mx1=c(0,-1)
mx2=c(-2,0,2)
Var1=matrix(c(1,-.25,-.25,.5),2)
Var2=matrix(c(1,1/3,-1/2,1/3,1/4,0,-.5,0,1),3)
M=c(mx1,mx2)
VAR=adiag(Var1,Var2)
X=mvrnorm(800,M,VAR)

