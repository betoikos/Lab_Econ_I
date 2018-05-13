#----------Tarea 1----------

#Ejercicio 4

Ex1=0
Ex2=-4
Ex3=1
Ey1=-1
Ey2=4

varx1=1
varx2=4
varx3=2
vary1=1
vary2=9

covx1x2=-1
covx1x3=0
covx1y1=0
covx1y2=1

covx2x3=2
covx2y1=-1
covx2y2=-3

covx3y1=0
covx3y2=3
covy1y2=-2

# Inciso 4.I)
EX<-matrix(c(Ex1,Ex2,Ex3)) #Esperanza de X

VarX<-matrix(c(varx1,covx1x2,covx1x3,covx1x2,varx2,covx2x3,covx1x3,covx2x3,varx3),3) #Varianza de X

VarY<-matrix(c(vary1,covy1y2,covy1y2,vary2),2) #Varianza de Y

CovXY<-matrix(c(covx1y1,covx2y1,covx3y1,covx1y2,covx2y2,covx3y2),3) #Covarianza(X,Y)

CovYX<-matrix(c(covx1y1,covx1y2,covx2y1,covx2y2,covx3y1,covx3y2),2) #Covarianza(Y,X)

# Inciso 4.II)
S<-matrix(c(-1,3/2,-4),1)
ESX<-S%*%EX
VarSX<-S%*%VarX%*%(t(S))

# Inciso 4.III)
A<-matrix(c(-2,1,0,4,1,-2),2)
b<-matrix(c(1,1))

EAX<-(A%*%EX)+b
VarAX<-A%*%VarX%*%t(A)

# Inciso 4.IV)
U<-matrix(c(1,0,0,0,1,2,-3,0,3),3)
u<-matrix(c(2,0,5))
V<-matrix(c(1,-1,-1,4,1,-1),2)
v<-matrix(c(1,0))

EUX<-(U%*%EX)+u
EVX<-(V%*%EX)+v

VarUX<-U%*%VarX%*%t(U)
VarVX<-V%*%VarX%*%t(V)

CovUXV<-U%*%VarX%*%t(V)
CovVXU<-V%*%VarX%*%t(U)

# Inciso 4.V)

C<-matrix(c(-2,1,5),1)
d<-8

CovAXC<-A%*%VarX%*%t(C)

# Inciso 4.VI)

D<-matrix(c(1,2,4,0,-2,3),3)
e<-matrix(c(1,0,-1))

CovAXYD<-A%*%CovXY%*%t(D)

# Inciso 4.VII)

T<-matrix(c(-1,1,0,2,-4,0),2)
t<-matrix(c(0,-1))

VarTX<-T%*%VarX%*%t(T)

# Inciso 4.VIII)

W<-matrix(c(-1,1,0,2,-4,0),2)
w<-matrix(c(0,-1))
Z<-matrix(c(1,0,1,1,1,-1),3)

CovWXYZ<-W%*%CovXY%*%t(Z)
CovZYXW<-Z%*%CovYX%*%t(W)

#Ejercicio 6

EJ<-matrix(c(1,0,2))
VarJ<-matrix(c(.8,0.4,-0.2,0.4,1,-0.8,-0.2,-0.8,2),3)

# Inciso 6.I)
K<-matrix(c(1,0,0),1)
M<-matrix(c(0,0,1,0,0,1),2)

VarK<-K%*%VarJ%*%t(K)
VarM<-M%*%VarJ%*%t(M)
CovKM<-K%*%VarJ%*%t(M)
COvMK<-M%*%VarJ%*%t(K)

#Inciso 6.II)

EKKt<-(K%*%VarJ%*%t(K))+(K%*%EJ%*%t(EJ)%*%t(K))
EMMt<-(M%*%VarJ%*%t(M))+(M%*%EJ%*%t(EJ)%*%t(M))
EMtM<-(matrix(c(0,1,0),1)%*%VarJ%*%t(matrix(c(0,1,0),1)))+(matrix(c(0,1,0),1)%*%EJ%*%t(EJ)%*%t(matrix(c(0,1,0),1)))+(matrix(c(0,0,1),1)%*%VarJ%*%t(matrix(c(0,0,1),1)))+(matrix(c(0,0,1),1)%*%EJ%*%t(EJ)%*%t(matrix(c(0,0,1),1)))
EKMt<-(K%*%VarJ%*%t(M))+(K%*%EJ%*%t(EJ)%*%t(M))
EMKt<-(M%*%VarJ%*%t(K))+(M%*%EJ%*%t(EJ)%*%t(K))
