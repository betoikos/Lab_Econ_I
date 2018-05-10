# Ejercicio 1.4
#Raquel Badillo 

# Valores esperados de las variables aleatorias

E.x1=0
E.x2=-4
E.x3=1
E.y1=-1
E.y2=4

# varianzas y covarianzas de las variables aleatorias

var.x1=1
var.x2=4
var.x3=2
var.y1=1
var.y2=9

cov.x1x2=-1
cov.x1x3=0
cov.x1y1=0
cov.x1y2=1
cov.x2x3=2
cov.x2y1=-1
cov.x2y2=-3
cov.x3y1=0
cov.x3y2=3
cov.y1y2=-2

# I

# Matriz de valores esperados de X

E.X=matrix(c(Ex1,Ex2,Ex3),3)
E.X

# Matriz de varianzas y covarianzas de X

var.X=matrix(c(var.x1,cov.x1x2,cov.x1x3,cov.x1x2,var.x2,cov.x2x3,cov.x1x3,cov.x2x3,var.x3),nrow=3, byrow=T)
varX

# Matriz de valores esperados de Y

E.Y=matrix(c(E.y1,E.y2),2)
E.Y

# Matriz de varianzas y covarianzas de Y

var.Y=matrix(c(var.y1,covy1y2,covy1y2,var.y2),byrow=T,nrow=2)
var.Y

# Matriz de covarianzas de X,Y

covXY=matrix(c(covx1y1,covx1y2,covx2y1,covx2y2,covx3y1,covx3y2),nrow=3, byrow=T)
covXY

covYX=t(covXY)
covYX

# II

# Vector de constantes

a=matrix(c(-1, 3/2,-4),nrow=3)
a


# E(aX)

EaX=a*EX
EaX

var.aX= t(a)%*%var.X%*%a
var.aX

# III

A=matrix(c(-2,0,1,1,4,-2),byrow=T,nrow=2)
A

b=matrix(c(1,1),nrow=2)
b


# Sea Z=AX+b

EZ=(A%*%EX)+b
EZ

var.Z=A%*%var.X%*%t(A)
var.Z

# IV

u.1=matrix(c(1,0,-3,0,1,0,0,2,3),nrow=3, byrow=T)
u.1

u=matrix(c(2,0,5),nrow=3)
u

V1=matrix(c(1,-1,1,-1,4,-1),byrow=T,nrow=2)
V1

v=matrix(c(1,0),nrow=2)
v
# E(U)

EU=(u.1%*%EX)+u
EU

# E(V)

EV=(V1%*%EX)+v
Ev

# var.(U)

var.u=u.1%*%var.X%*%t(u.1)
var.u

# var.(V)

var.V=V1%*%var.X%*%t(V1)
var.V

# cov(U,V)

cov.UV=u.1%*%var.X%*%t(V1)
cov.UV

# cov(V,U)

cov.VU=t(cov.UV)
cov.VU

# V

C=matrix(c(-2,1,5),nrow=3)
C

d=8
d

# Sea cov(AX+b,Cx+d)=covW

cov.W=A%*%var.X%*%C
cov.W

# VI

D=matrix(c(1,0,2,-2,4,3),nrow=3, byrow=T)
D

e=matrix(c(1,0,-1),nrow=3)
e

#Sea cov(AX+b,Dy+e)=covP

cov.P=A%*%covXY%*%t(D)
cov.P

# VII

N1=matrix(c(-1,0,-4,1,2,-1),byrow=T,nrow=2)
N1

var..N1X=N1%*%var.X%*%t(N1)
var..N1X

# VIII

W1=matrix(c(-1,0,-4,1,2,-1),byrow=T,nrow=2)
W1

Z1=matrix(c(1,1,0,1,1,-1),nrow=3, byrow=T)
Z1

cov.WZ=W1%*%cov.XY%*%t(Z1)
cov.WZ

cov.ZW=t(cov.WZ)
cov.ZW


