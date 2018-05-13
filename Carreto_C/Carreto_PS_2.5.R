###### Proyecto final de R #######
#tarea 2
#Ejercicio 5
# Funciones para b_mco y b_mcr

#Encontramos funciones para los estimadores de b_mco y b_mcr
#esto a partir de una muestra aleatoria y para el caso del
#estimador de b_mcr lo aplicamos al caso de una restriccion de 
#un problema de cambio estructural

#install.packages("MASS")
library(MASS)

#generamos datos una base de datos de forma aleatoria
#a partir de una distribucion como a continuacion se indica
n=260
mu1<-c(1,0,2)
sigma1=matrix(c(0.8,0.4,-0.2,0.4,1,-0.8,-0.2,-0.8,2),3)
mu2<-c(0)
sigma2=matrix(c(0.4),1)

modelo<-matrix(0,nrow = 260, ncol = 5)
datos1=mvrnorm(n,mu1,sigma1)
unos<-rep(1,n)
x<-datos1[,1:3]
x<-matrix(c(unos,x),nrow = n)
#generar datos de u
datos2=mvrnorm(n,mu2,sigma2)
u<-datos2[,1:1]
u<-matrix(c(u),nrow = n)
#generar y para i=1 a 120
b1<-matrix(c(0.6,0.5,-1.2,-0.8),4)
y1<-(x%*%b1)+u
#generar y para i=121 a 260
b2<-matrix(c(0.9,0.3,0.9,-1.1),4)
y2<-(x%*%b2)+u
#fusionar ambas ys
y<-matrix(c(y1[1:120,1:1],y2[121:260,1:1]),nrow = n)

########### estimadores de MCO
b_hat_mco1<-solve(t(x[1:120,1:4])%*%x[1:120,1:4])%*%(t(x[1:120,1:4])%*%y1[1:120,1:1])
b_hat_mco2<-solve(t(x[121:260,1:4])%*%x[121:260,1:4])%*%(t(x[121:260,1:4])%*%y2[121:260,1:1])
b_hat_mco<-matrix(c(b_hat_mco1,b_hat_mco2),8)
b_hat_mco 
#estimador de sigma2
u_hat1<-(y1[1:120,1:1])-(x[1:120,1:4]%*%b_hat_mco1)
u_hat2<-(y2[121:260,1:1])-(x[121:260,1:4]%*%b_hat_mco2)
u_hat_mco<-matrix(c(u_hat1,u_hat2),n)
sigma_hat_mco<-(1/(n-4))%*%t(u_hat_mco)%*%u_hat_mco


#definimos la matriz R de de restricciones
R=matrix(c(1,0,0,0,0,1,0,0,
           0,0,1,0,0,0,0,1,
           -1,0,0,0,0,-1,0,0,
           0,0,-1,0,0,0,0,-1),4)
ceros1<-rep(0,140)
ceros2<-rep(0,120)
X<-matrix(c(x[1:120,1:1],ceros1,x[1:120,2:2],ceros1,x[1:120,3:3],ceros1,x[1:120,4:4],ceros1,
            ceros2,x[121:260,1:1],ceros2,x[121:260,2:2],ceros2,x[121:260,3:3],ceros2,x[121:260,4:4]),nrow = 260)

#u de mco
u_tu<-t(u_hat_mco)%*%u_hat_mco
#encontrar b mcr
b_hat_mcr<-b_hat_mco-solve((t(X)%*%X))%*%t(R)%*%solve(R%*%solve(t(X)%*%X)%*%t(R))%*%(R%*%b_hat_mco)
b_hat_mcr

