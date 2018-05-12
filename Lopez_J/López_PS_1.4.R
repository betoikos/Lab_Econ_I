#######################Ejercicio 4, Tarea 1.#####################
#Datos:
Ex1=0
Ex2=-4
Ex3=1
Ey1=-1
Ey2=4
Vx1=1
Vx2=4
Vx3=2
Vy1=1
Vy2=9
Cx1x2=-1
Cx1x3=0
Cx1y1=0
Cx1y2=1

Cx2x3=2
Cx2y1=-1
Cx2y2=-3

Cx3y1=0
Cx3y2=3
Cy1y2=-2

#i) 

EX=matrix(c(Ex1,Ex2,Ex3),ncol=1)
VX=matrix(c(Vx1,Cx1x2,Cx1x3,Cx1x2,Vx2,Cx2x3,Cx1x3,Cx2x3,Vx3),byrow=T,nrow=3)
EY=matrix(c(Ey1,Ey2),ncol=1)
VY=matrix(c(Vy1,Cy1y2,Cy1y2,Vy2),byrow=T,nrow=2)
CXY=matrix(c(Cx1y1,Cx1y2,Cx2y1,Cx2y2,Cx3y1,Cx3y2),byrow=T,nrow=3)
CYX=t(CXY)


EX
CYX
VX
EY
VY
CXY
CYX

#ii)
#Definiendo un vector "a" como sigue y utilizando las proposiciones de clase:

a=matrix(c(-1, 3/2,-4),ncol=1)

EaX=t(a)%*%EX
EaX
VaX= t(a)%*%VX%*%a
VaX

#iii)
A=matrix(c(-2,0,1,1,4,-2),ncol=3,byrow=T)
b=matrix(c(1,1),ncol=1)

EAxb=A%*%EX+b
EAxb
VAxb=A%*%VX%*%t(A)
VAxb
#iv)
#Definiendo a U=HX+h y V=EX+f, se tiene:
H=matrix(c(1,0,-3,0,1,0,0,2,3),ncol=3,byrow=T)
h=matrix(c(2,0,5),ncol=1)
E=matrix(c(1,-1,1,-1,4,-3),ncol=3,byrow=T)
f=matrix(c(1,0),ncol=1)

EU=H%*%EX+h
EU
EV=E%*%EX+f
EV
VU=H%*%VX%*%t(H)
VU
VV=E%*%VX%*%t(E)
VV
CUV=H%*%VX%*%t(E)
CUV
CVU=t(CUV)
CVU

#v)
C=c(-2,1,5)
d=8

#Cov(AX+b,CX+d) se calcula como sigue:
A%*%VX%*%C

#vi) COV(AX+b,DY+e)
D=matrix(c(1,0,2,-2,4,3),ncol=2,byrow=T)
e=matrix(c(1,0,-1),ncol=1)

A%*%CXY%*%t(D)

#vii) definiendo a var(.)=var(GX+g)
G=matrix(c(-1,0,-4,1,2,0),ncol=3,byrow=T)
g=matrix(c(0,-1),ncol=1)

G%*%VX%*%t(G)

#viii) sea W=GX+g y Z=LY y calculando COV(W,Z) 

L=matrix(c(1,2,0,1,1,-1),ncol=2,byrow=T)

CWZ=G%*%CXY%*%t(L)
CWZ
CZW=t(CWZ)
CZW