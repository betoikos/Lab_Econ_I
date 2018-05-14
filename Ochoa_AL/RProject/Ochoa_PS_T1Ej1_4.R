
#Tarea 1
 
#Ejercicio 4

#definiciones
Ex1 = 0
Ex2 = -4
Ex3 = 1
Ey1 = -1
Ey2 = 4

varx1 = 1
varx2 = 4
varx3 = 2
vary1 = 1
vary2 = 9

covx1x2 = -1
covx1x3 = 0
covx1y1 = 0
covx1y2 = 1

covx2x3 = 2
covx2y1 = -1
covx2y2 = -3

covx3y1 = 0
covx3y2 = 3
covy1y2 = -2

#inciso1
#E(x) esperanza de x

#EX = t(t(c(Ex1,Ex2,Ex3)))
#EX = Matrix(c(variables,,))  son columna
EX = matrix(c(Ex1,Ex2,Ex3))
EX

#var X
VarM= matrix (c(1,2,3,4,5,6),2) # la instruccion <,2> indica en cuantos renglones se dividen los datos, es decir corta una columna con N elementos y empieza a formar la siguiente
VarM


varX = matrix(c(varx1, covx1x2, covx1x3,covx1x2, varx2, covx2x3, covx1x3, covx2x3, varx3),3)
varX

#var y

varY = matrix(c(vary1, 
                covy1y2,
                covy1y2,vary2),2)
varY

#i) encontrar E(X)
EX
#i)VarX
varX

#i)EY
EY = matrix(c(Ey1,Ey2))
EY

#i)varY
varY = matrix(c(vary1,covy1y2,covy1y2,vary2),2)
varY

#i) cov (x,y)
covXY = matrix(c(covx1y1,covx2y1,covx3y1,covx1y2,covx2y2,covx3y2),3)
covXY

#i) cov (y,x)
covYX = t(covXY)
covYX

#ii) E(-x1+3/2X2-4X3)=EW

A= matrix(c(-1,3/2,-4),1)
A

EW = A%*%EX #multiplicacion de matrices %*%
EW

#ii) Var(W)
varW = A%*%varX%*%t(A)
varW

#iii)
A= matrix(c(-2,1,0,4,1,-2),2)
A

b= matrix(c(1,1),2)
b
#E(AX+b)=EZ
EZ=A%*%EX+b
EZ
#Var(AX+b)
varZ=A%*%varX%*%t(A)
varZ

#iv) para U=AX+c y V=BX+d
A=matrix(c(1,0,0,0,1,2,-3,0,3),3)
A
c=matrix(c(2,0,5),3)
c

B=matrix(c(1,-1,-1,4,1,-1),2)
B
d=matrix(c(1,0),2)
d

#U=AX+c; V=BX+d
EU=A%*%EX+c
EU

EV=B%*%EX+d
EV

varU=A%*%varX%*%t(A)
varU

varV=B%*%varX%*%t(B)
varV


covUV=A%*%varX%*%t(B)
covUV

covVU=t(covUV)
covVU

#v) 
C=matrix(c(-2,1,5),1)
C
d=8
d

A= matrix(c(-2,1,0,4,1,-2),2)
A

b= matrix(c(1,1),2)
b

#cov(AX+b,CX+d)
covAXC=A%*%varX%*%t(C)
covAXC
t(C)

#cov5(AX+b,DY+e)

D=matrix(c(1,2,4,0,-2,3),3)
D
e=matrix(c(1,0,-1),3)
e

cov5=A%*%covXY%*%t(D)
cov5

#vii)varW=var(AX+b)
A=matrix(c(1,-1,0,2,-4,0),2)
A
b=matrix(c(0,-1),2)
b

varW=A%*%varX%*%t(A)
varW

#Z=CY
C=matrix(c(1,0,1,1,1,-1),3)
C

#cov(W,Z)=cov(AX+b,CY)=AcovXYt(C)

covWZ=A%*%covXY%*%t(C)
covWZ

covZW = t(covWZ)
covZW

