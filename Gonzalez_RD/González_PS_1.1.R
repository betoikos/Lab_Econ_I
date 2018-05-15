#Rogelio Daniel González González
#Colegio de México
#Econometría I
#Prof. Eneas Caldiño
#Trabajo Final

#1.4

#Para X

Ex1=0
Ex2=-4
Ex3=1

Varx1=1
Varx2=4
Varx3=2

Covx1x2=-1
Covx1x3=0
Covx2x3=2

#Para Y

Ey1=-1
Ey2=-4

Vary1=1
Vary2=9

Covy1y2=-2

#Para Y y X
Covx1y1=0
Covx1y2=1

Covx2y1=-1
Covx2y2=-3

Covx3y=0
Covx3y2=3

#i

Ex=matrix(c(Ex1,Ex2,Ex3),3,1)
Ey=matrix(c(Ey1,Ey2),2,1)

VARX=matrix(c(Varx1, Covx1x2, Covx1x3,
              Covx1x2, Varx2, Covx2x3,
              Covx1x3, Covx1x2, Varx3),3,3)

VARY=matrix(c(Vary1, Covy1y2,
              Covy1y2, Vary2),2,2)

COVYX=matrix(c(Covx1y1, Covx1y2, Covx2y1, Covx2y2, Covx3y, Covx3y2),2,3)
COVXY=t(COVYX)

#ii

#Sea Q=E(-x1+(3/2)x2-4x3)=-1E(x1)+(3/2)E(x2)-4(x3)
#Definimos una matriz A=(-1 3/2 -4); entonces Q=A%*%EX

A=matrix(c(-1, 3/2, -4), 1, 3)
Q=A%*%Ex

#Sea R= var(-x1+(3/2)x2-4x3)= A%*%VARX%*%t(A)

R=A%*%VARX%*%t(A)

#iii

A=matrix(c(-2, 1, 0, 4, 1, -2),2,3)
b=matrix(c(1, 1),2,1)

#iii.1

#K=E[AX+b]=AE[X]+b

K=A%*%Ex+b


#iii.2

#W=Var(AX+b)=AVar(X)A´

W=A%*%VARX%*%t(A)

#iv

A=matrix(c(1, 0, 0, 0, 1, 2, -3, 0, 3), 3, 3)
b=matrix(c(2, 0, 5), 3, 1)

C=matrix(c(1, -1, -1, 4, 1, -1), 2, 3)
d=matrix(c(1, 0), 2, 1)

#U=AX+b
#V=CX+d

#E[U]=E[AX+b]=AE[X]+b

EU=A%*%Ex+b

#E[V]=E[CX+d]=CE[X]+d

EV=C%*%Ex+d

#Var(U)=VAR(AX+b)=AVar(X)A´

VARU=A%*%VARX%*%t(A)

#Var(V)=Var(CX+d)=CVar(X)C´

VARV=C%*%VARX%*%t(C)

#Cov(U,V)=Cov(AX+b, CX+d)=AVar(X)C´

COVUV=A%*%VARX%*%t(C)

#Cov(V,U)=(Cov(U,V))´

COVVU=t(COVUV)

#V

C=matrix(c(-2, 1, 5), 1, 3)
d=8

A=matrix(c(-2, 1, 0, 4, 1, -2),2,3)
b=matrix(c(1, 1),2,1)

# H= Cov(AX+b,CX+d)=AVar(X)C´

H=A%*%VARX%*%t(C)

#Vi

D=matrix(c(1, 2, 4, 0, -2, 3), 3, 2)
e=matrix(c(1,0,-1), 3, 1)

#J=Cov(AX+b,DY+e)=ACov(X,Y)D´

J=A%*%COVXY%*%t(D)

#Vii

K=matrix(c(-1, 1, 0, 2, -4, 0), 2, 3)
k=matrix(c(0, -1), 2, 1)

#L=Var(KX+k)=KVar(X)K´

L=K%*%VARX%*%t(K)

#Viii

Q=matrix(c(-1, 1, 0, 2, -4, 0), 2,3)
q=matrix(c(0, -1), 2, 1)

#W=QX+q

R=matrix(c(1, 0, 1, 1, 1, -1),3,2)

#Z=RX

#P=Cov(W,Z)=Cov(QX+q, Ry)= QCov(x,y)R´
#O=Cov(Z,W)=Cov(Ry,QX+q)= RCov(y,x)Q´=P´

P=Q%*%COVXY%*%t(R)
O=t(P)

