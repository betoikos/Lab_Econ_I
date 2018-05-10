# Ejercicio 1.4

### Valores esperados de las variables aleatorias

    Ex1=0
    Ex2=-4
    Ex3=1
    Ey1=-1
    Ey2=4

### Varianzas y covarianzas de las variables aleatorias

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

## I

### Matriz de valores esperados de X

    EX=matrix(c(Ex1,Ex2,Ex3),3)
    EX

### Matriz de varianzas y covarianzas de X

    VarX=matrix(c(Varx1,Covx1x2,Covx1x3,Covx1x2,Varx2,Covx2x3,Covx1x3,Covx2x3,Varx3),byrow=T,nrow=3)
    VarX

### Matriz de valores esperados de Y

    EY=matrix(c(Ey1,Ey2),2)
    EY

### Matriz de varianzas y covarianzas de Y

    VarY=matrix(c(Vary1,Covy1y2,Covy1y2,Vary2),byrow=T,nrow=2)
    VarY

### Matriz de covarianzas de X,Y

    CovXY=matrix(c(Covx1y1,Covx1y2,Covx2y1,Covx2y2,Covx3y1,Covx3y2),byrow=T,nrow=3)
    CovXY

    CovYX=t(CovXY)
    CovYX

## II

### Vector de constantes

    a=matrix(c(-1, 3/2,-4),nrow=3)
    a


### E(aX)

    EaX=a*EX
    EaX

    VaraX= t(a)%*%VarX%*%a
    VaraX

## III

    A=matrix(c(-2,0,1,1,4,-2),byrow=T,nrow=2)
    A

    b=matrix(c(1,1),nrow=2)
    b


### Sea Z=AX+b

    EZ=(A%*%EX)+b
    EZ

    VarZ=A%*%VarX%*%t(A)
    VarZ

## IV

    U1=matrix(c(1,0,-3,0,1,0,0,2,3),byrow=T,nrow=3)
    U1

    u=matrix(c(2,0,5),nrow=3)
    u

    V1=matrix(c(1,-1,1,-1,4,-1),byrow=T,nrow=2)
    V1

    v=matrix(c(1,0),nrow=2)
    v

### E(U)

    EU=(U1%*%EX)+u
    EU

### E(V)

    EV=(V1%*%EX)+v
    v

### Var(U)

    VarU=U1%*%VarX%*%t(U1)
    VarU

### Var(V)

    VarV=V1%*%VarX%*%t(V1)
    VarV

### Cov(U,V)

    CovUV=U1%*%VarX%*%t(V1)
    CovUV

### Cov(V,U)

    CovVU=t(CovUV)
    CovVU

## V

    C=matrix(c(-2,1,5),nrow=3)
    C

    d=8
    d

### Sea Cov(AX+b,Cx+d)=CovW

    CovW=A%*%VarX%*%C
    CovW

## VI

    D=matrix(c(1,0,2,-2,4,3),byrow=T,nrow=3)
    D

    e=matrix(c(1,0,-1),nrow=3)
    e

### Sea Cov(AX+b,Dy+e)=CovP

    CovP=A%*%CovXY%*%t(D)
    CovP

## VII

    N1=matrix(c(-1,0,-4,1,2,-1),byrow=T,nrow=2)
    N1

    VarN1X=N1%*%VarX%*%t(N1)
    VarN1X

## VIII

    W1=matrix(c(-1,0,-4,1,2,-1),byrow=T,nrow=2)
    W1

    Z1=matrix(c(1,1,0,1,1,-1),byrow=T,nrow=3)
    Z1

    CovWZ=W1%*%CovXY%*%t(Z1)
    CovWZ

    CovZW=t(CovWZ)
    CovZW