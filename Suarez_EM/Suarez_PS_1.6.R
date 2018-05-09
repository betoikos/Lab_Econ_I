# Evelyn Magali Suárez Reyes
#
#############################################################################################
##
##   Tarea 1. Ejercicio 6
##
#############################################################################################
#
## i) Encontrar var(Y), var(X), cov(Y,X) y cov(X,Y), dado que z=(Y,X1,X2)' X=(X1,X2)'
### Definamos E(Z) y var(Z)

EZ=c(1,0,2)
varZ=t(matrix(c(0.8,0.4, -0.2,0.4,1.0,-0.8,-0.2,-0.8,2.0 ),3))

### Como Y=(1,0,0)'*Z entonces EY=(1,0,0)'*EZ.

A=t(c(1,0,0))
EY=A%*%EZ
EY

### Como X=B*Z entonces E(X)=B*E(Z).

B=t(matrix(c(0,1,0,0,0,1),3))
EX=B%*%EZ
EX

### var(Y)

varY=A%*%varZ%*%t(A)
varY

### var(X)

varX=B%*%varZ%*%t(B)
varX

### cov(X,Y). Por propiedades de covarianza tenemos que cov(X,Y)=A*var(Z)*B'

covXY=A%*%varZ%*%t(B)
covXY

### cov(Y,X). Por propiedades de covarianza tenemos que cov(Y,X)=B*var(Z)*A'

covYX=B%*%varZ%*%t(A)
covYX

## ii) Calcular E(Y^2), E(X'X), E(YX') y E(XY)

### E(Y^2). Como var(Y)=E(Y^2)-E(Y)^2 entonces E(Y^2)=var(Y)+E(Y)^2

EY2=varY+(EY)%*%(EY)
EY2

### E(X'X). Como var(X)=E(X'X)-E(X)E(X)' entonces E(X'X)=var(X)+E(X)E(X)'

EXX=varX+EX%*%t(EX)
EXX

### E(XX'). Como var(X')=var(X)=E(XX')-E(X')E(X) entonces E(XX')=var(X)+E(X)'E(X)

EXXt=varX+t(EX)%*%EX
EXXt



