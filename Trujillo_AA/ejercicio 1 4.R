#Ejercicio 1.4

Ex1 = 0
Ex2 = -4
Ex3 = 1
Ey1 = -1
Ey2 = 4
Varx1 = 1
Varx2 = 4
Varx3 = 2
Vary1 = 1
Vary2 = 9
Covx1x2 = -1
Covx1x3 = 0
Covx1y1 = 0
Covx1y2 = 1
Covx2x3 = 2
Covx2y1 = -1
Covx2y2 = -3
Covx3y1 = 0
Covx3y2 = 3
Covy1y2 = -2
#------------------------------
#i)

EX = matrix(c(Ex1,Ex2,Ex3),3)
EX

EY = matrix(c(Ey1,Ey2),2)
EY

VarX = matrix(c(Varx1,Covx1x2,Covx1x3,Covx1x2,Varx2,Covx2x3,
                Covx1x3,Covx2x3,Varx3),3)
VarX

VarY = matrix(c(Vary1,Covy1y2,Covy1y2,Vary2))
VarY

CovXY=matrix(c(Covx1y1,Covx2y1,Covx3y1,Covx1y2,Covx2y2,Covx3y2),3)
CovXY

CovYX=matrix(c(Covx1y1,Covx1y2,Covx2y1,Covx2y2,Covx3y1,Covx3y2),2)
CovYX
#---------------------------
#Ejercicio ii)
A=matrix(c(-1, 3/2,-4),3)
A
#Por proposición
EAX=t(A)%*%EX
EAX
#Por proposición también
VarAX= t(A)%*%VarX%*%A
VarAX
#------------------------------
#Ejercicio iii)
C=matrix(c(-2,1,0,4,1,-2),2)
C

d=matrix(c(1,1),2)
d

EZ=(C%*%EX)+d
EZ

VarZ=C%*%VarX%*%t(C)
VarZ
#-------------------------
#Ejercicio iv)

U=matrix(c(1,0,0,0,1,2,-3,0,3),3)
U

u=matrix(c(2,0,5),3)
u

V=matrix(c(1,-1,-1,4,1,-1),2)
V

v=matrix(c(1,0),2)
v

EU=(U%*%EX)+u
EU

EV=(V%*%EX)+v
v

VarU=U%*%VarX%*%t(U)
VarU

VarV=V%*%VarX%*%t(V)
VarV


CovUV=U%*%VarX%*%t(V)
CovUV


CovVU=V%*%VarX%*%t(U)
CovVU
#-----------------------
#Ejercicio v)
Ce=matrix(c(-2,1,5),1)
Ce

d=8
d

CovZ=C%*%VarX%*%t(Ce)
CovZ

#----------------------
#Ejercicio vi)
De=matrix(c(1,2,4,0,-2,3),3)
De

e=matrix(c(1,0,-1),3)
e

CovVI = C%*%CovXY%*%t(De)
CovVI

#---------------------
#Ejercicio vii)
M=matrix(c(-1,1,0,2,4,0),2)
M

VarM=M%*%VarX%*%t(M)
VarM

#--------------------
#Ejercicio viii)

W=matrix(c(-1,1,0,2,-4,0),2)
W

Z=matrix(c(1,0,1,1,1,-1),3)
Z

CovWZ=W%*%CovXY%*%t(Z)
CovWZ

CovZW=t(CovWZ)
CovZW


