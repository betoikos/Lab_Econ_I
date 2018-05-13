### Ejercicio 1.6
###### Susana Almeida Martinez

#### Datos

#### Z=c(Y,x1,x2)
#### X=c(x1,x2)

        EZ=c(1,0,2)
        EZ

        Ey=1
        Ex1=0
        Ex2=2

        varZ=matrix(c(0.8,0.4,-0.2,0.4,1,-0.8,-0.2,-0.8,2),3)
        varZ

        vary=0.8
        covyx1=0.4
        covyx2=-0.2
        covx1y=0.4
        varx1=1
        covx1x2=-0.8
        covx2y=-0.2
        covx2x1=-0.8
        varx2=2

### inciso i)
#### Encontrar var(Y), var(X), cov(Y,X), cov(X,Y)

        vary

        varX=matrix(c(varx1,covx2x1,covx1x2,varx2),2)
        varX

        covYX=c(covx1y,covx2y)
        covYX

        covXY=t(covYX)
        covXY

### inciso ii)
#### Encontrar E(Y^2), E(X*t(X)), E(t(X)*X), E(Y*t(X)), E(XY)

        EY2=vary-(Ey)^2
        EY2

#### E(X*t(X))=matrix(c(Ex1^2, Ex1x2, Ex1x2,Ex2^2),2)
##### Calculando cada uno de los t??rminos de esta esperanza utilizando las propiedades:
##### var(X)=E(X^2)-(E(X)^2) y cov(XY)=E(XY)-E(X)E(Y)

        Ex1sqrt=varx1+(Ex1)^2
        Ex1sqrt

        Ex1x2=covx1x2+Ex1*Ex2
        Ex1x2

        Ex2x1=covx2x1+Ex2*Ex1
        Ex2x1

        Ex2sqrt=varx2+(Ex2)^2
        Ex2sqrt

###### Entonces:

        EXXtrans=matrix(c(Ex1sqrt,Ex2x1,Ex1x2,Ex2sqrt),2)
        EXXtrans

        EXtransX=t(EXXtrans)
        EXtransX

###### EYXtrans=matrix(c(Eyx1,Eyx2)

        Eyx1=covyx1+Ey*Ex1
        Eyx1

        Eyx2=covyx2+Ey*Ex2
        Eyx2

###### Asi,

        EYXtrans=matrix(c(Eyx1,Eyx2),1)
        EYXtrans

###### Ahora calculando E(XY)

        Ex1y=covx1y+Ex1*Ey
        Ex1y

        Ex2y=covx2y*Ex2*Ey
        Ex2y

###### Asi,

        EXY=c(Ex1y,Ex2y)
        EXY
