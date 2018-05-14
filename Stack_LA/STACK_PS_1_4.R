# Ejercicio 4 de la tarea 1 


#inciso (i) 
# Definimos los Valores esperados, las varianzas y covarianzas de las variables aleatorias

Ex1=0
Ex2=-4
Ex3=1
Ey1=-1
Ey2=4

Varx1=1
Varx2=4
Varx3=2
Vary1=1
Vary2=9

Covx1x2=-1
Covx1x3=0
Covx1y1=0
Covx1y2=1
Covx2x3=2
Covx2y1=-1
Covx2y2=-3
Covx3y1=0
Covx3y2=3
Covy1y2=-2

# Creamos la matriz de esperanzas de las variables aleatorias

EX=matrix(c(Ex1,Ex2,Ex3),3)

# Creamos la matriz de varianzas y covarianzas de las variables aleatorias

VarX=matrix(c(Varx1,Covx1x2,Covx1x3,Covx1x2,Varx2,Covx2x3,Covx1x3,Covx2x3,Varx3),byrow=T,nrow=3)

# Creamos la matriz de esperanzas de Y

EY=matrix(c(Ey1,Ey2),2)

# Creamos la matriz de varianzas y covarianzas de Y

VarY=matrix(c(Vary1,Covy1y2,Covy1y2,Vary2),byrow=T,nrow=2)

# Cramos la matriz de covarianzas de X,Y

CovXY=matrix(c(Covx1y1,Covx1y2,Covx2y1,Covx2y2,Covx3y1,Covx3y2),byrow=T,nrow=3)

CovYX=t(CovXY)

#Vamos a visualizar las matrices 

EX
VarX
EY
VarY
CovYX

#Inciso (ii)
# Generamos un vector de constantes para poder crear el vectos que necesitamos

a=matrix(c(-1, 3/2,-4),nrow=3)
a


# Queremos encontrar la esperanza de E(aX)

EaX=t(a)%*%EX
EaX

#Para calcular la varianza
VaraX= t(a)%*%VarX%*%a
VaraX

# Inciso (iii)

#Definimos las matrices que necesitamos 

A=matrix(c(-2,0,1,1,4,-2),byrow=T,nrow=2)
A

b=matrix(c(1,1),nrow=2)
b


#Definimos los argumentos Sea Z=AX+b

EZ=(A%*%EX)+b
EZ

VarZ=A%*%VarX%*%t(A)
VarZ

#Inciso (iv)

#Definimos la matríz necesaria 
U1=matrix(c(1,0,-3,0,1,0,0,2,3),byrow=T,nrow=3)
U1

#Generamos las constantes que debemos agregar
u=matrix(c(2,0,5),nrow=3)
u

#Matríz necesaria
V1=matrix(c(1,-1,1,-1,4,-1),byrow=T,nrow=2)
V1

#Constantes necesarias
v=matrix(c(1,0),nrow=2)
v


# Ahora, calculamos la Esperanza de U E(U), E(V), Var(U), Var(V) y las covarianzas

EU=(U1%*%EX)+u
EU

EV=(V1%*%EX)+v
v

VarU=U1%*%VarX%*%t(U1)
VarU

VarV=V1%*%VarX%*%t(V1)
VarV

CovUV=U1%*%VarX%*%t(V1)
CovUV

CovVU=t(CovUV)
CovVU

# inciso (v)

#Definimos la matríz que necesitamos al igual que la constante

C=matrix(c(-2,1,5),nrow=3)

d=8

# Definimos Cov(AX+b,Cx+d)=CovQ

CovQ=A%*%VarX%*%C
CovQ

# Inciso (vi)

D=matrix(c(1,0,2,-2,4,3),byrow=T,nrow=3)
D

e=matrix(c(1,0,-1),nrow=3)
e

#Definimos  Cov(AX+b,Dy+e)=CovP

CovP=A%*%CovXY%*%t(D)
CovP

# Inciso (vii)

N1=matrix(c(-1,0,-4,1,2,-1),byrow=T,nrow=2)
N1

VarN1X=N1%*%VarX%*%t(N1)
VarN1X

# Inciso (viii)

W1=matrix(c(-1,0,-4,1,2,-1),byrow=T,nrow=2)
W1

Z1=matrix(c(1,1,0,1,1,-1),byrow=T,nrow=3)
Z1

CovWZ=W1%*%CovXY%*%t(Z1)
CovWZ

CovZW=t(CovWZ)
CovZW