#Rogelio Daniel Gonz�lez Gonz�lez
#Colegio de M�xico
#Econometr�a I
#Prof. Eneas Caldi�o
#Trabajo Final

#3.6

library(MASS)

M=c(0,0,1,1)
VAR=matrix(c(1,0,1,0,0,9,0,1,1,0,4,0,0,1,0,9),4)
X=mvrnorm(200,M,VAR)
A=matrix(c(0,0,0,1,0,1,0,0,1,0,0,0,0,0,1,0),4)

#i

M1=A%*%M
VAR1=A%*%VAR%*%t(A)

