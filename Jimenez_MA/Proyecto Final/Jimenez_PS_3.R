#----------Tarea 3----------
library(mvtnorm)
set.seed(100)

#Pregunta 5
Sigma1<-matrix(c(1,-.25,-.25,.5),2)
Muestra1<-rmvnorm(100,mean=c(0,-1),sigma=Sigma1)

Sigma2<-matrix(c(1,(1/3),-.5,(1/3),.25,0,-.5,0,1),3)
Muestra2<-rmvnorm(100,mean=c(-2,0,-2),sigma=Sigma2)

#Pregunta 6
Sigma3<-matrix(c(1,0,1,0,0,9,0,1,1,0,4,0,0,1,0,9),4)
Muestra3<-rmvnorm(200,mean=c(0,0,1,1),sigma=Sigma3)
