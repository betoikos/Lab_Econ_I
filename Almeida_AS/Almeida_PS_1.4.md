## Ejercicio 1.4
###### Susana Almeida Martinez

### Datos 

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

### Inciso i)

#### E[X]

        EX = t(t(c(Ex1,Ex2,Ex3)))
        EX = matrix(c(Ex1,Ex2,Ex3),3)
        EX

#### var(X)
        varX = matrix(c(varx1,covx1x2,covx1x3,covx1x2,varx2,covx2x3,covx1x3,covx2x3,varx3),3)
        varX

#### E[Y]
        EY= c(Ey1,Ey2)
        EY

#### var(Y)
        varY = matrix(c(vary1,covy1y2,covy1y2,vary2),2)
        varY

#### cov(X,Y)
        covXY= matrix(c(covx1y1,covx2y1,covx3y1,covx1y2,covx2y2,covx3y2),3)
        covXY

        covYX=t(covXY)
        covYX

### inciso ii)

#### E[-x1+3/2x2-4x3]

        E=(Ex1+(3/2)*Ex2-4*Ex3)
        E

#### var(-x1+3/2x2-4x3)

        Va=varx1+(3/2)^2*varx2+(4^2)*varx3-3*covx1x2+8*covx1x3-12*covx2x3
        Va

### inciso iii)

        A= matrix(c(-2,1,0,4,1,-2),2)
        A

        b=c(1,1)
        b

        #E(AX+b)

        C=(A%*%EX)+b
        C

        #Var(AX+b)

        t=t(A)
        t
        D=A%*%varX%*%t
        D

### inciso iv)

##### U=c(x1-3x3+2,x2,2x2+3x3+5)
##### V=c(x1+x2+x3+1,-x1+4x2-x3)

##### E[U]= 

        EU =matrix(c(Ex1-3*Ex3+2,Ex2,2*Ex2+3*Ex3+5),3)
        EU

        EV=matrix(c(Ex1-Ex2+Ex3+1,Ex1+4*Ex2-Ex3),2)
        EV

##### Var[U]=

##### Utilizando la proposici??n var[U]=var(BX+c)=Bvar(X)t(B)
##### De inciso i) tenemos varx, definimos entonces la matrix B y su transpuesta

        B=matrix(c(1,0,0,0,1,2,-3,0,3),3)
        B

        tB=t(B)
        tB

        varU=(B*varX*tB)
        varU

##### Var[V]

        D=matrix(c(1,-1,-1,4,1,-3),2)
        D

        tD=t(D)
        tD

        varX
        varV=D%*%varX%*%tD
        varV

##### Cov(U,V)
##### Utilizamos proposicion cov(U,V)=cov(AX+b,CX+d)=Avar(X)t(C)

        covUV=B%*%varX%*%tD
        covUV

##### Cov(V,U)

        covVU=D%*%varX%*%tB
        covVU

### inciso v)

        C=c(-2,1,5)
        C

        tC=matrix(c(-2,1,5),3)
        tC

        d=8

#### cov(AX+B,CX+d)=covAXCX

        covAXCX=A%*%varX%*%tC
        covAXCX

### inciso vi)

        E=matrix(c(1,2,4,0,-2,3),3)
        E

        e=c(1,0,-1)
        e

        tE=t(E)
        tE

##### Calcular cov(AX+B,EY+e)=covAXEY

        covAXEY=A%*%covXY%*%tE
        covAXEY


#### inciso vii)

##### Calcular var(c,(-x1-4x3,x1+2x2-1),2)
##### Utilizando proposicion var(FX+b)=F*varX*t(F), definimos la matriz F

        F=matrix(c(-1,1,0,2,-4,0),2)
        F

        tF=t(F)
        tF

        varFX=F%*%varX%*%tF
        varFX

### inciso viii)

#### W=c(-x1-4x3,x1+2x2-1)
#### Z=c(y1+y2,y2,y1-y2)

#### Calcular cov(W,Z)
#### Utilizando proposici??n: cov(AX+b,CY+d)=Acov(XY)t(C)

##### Definimos matrices A, C y t(C)

        A=matrix(c(-1,1,0,2,-4,0),2)
        A

        C=matrix(c(1,0,1,1,1,-1),3)
        C

        tC=t(C)
        tC

        covWZ=A%*%covXY%*%tC
        covWZ

#### Calcular cov(Z,W)

        covZW=t(covWZ)
        covZW
