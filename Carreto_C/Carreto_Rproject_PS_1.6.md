# Proyecto final de R 
##  Tarea 1
##  ejercicio 6

# primero definimos los parametros de Z
    EZ<-matrix(c(1,0,2),nrow=3)
    VarZ<- matrix(c(0.8,0.4,-0.2,0.4,
                    1,-0.8,-0.2,-0.8,2), nrow=3)
    VarZ

###### i)

# Encontrar VarY
    VarY<-VarZ[1,1]
    VarY

# Encontrar VarX
    VarX<-matrix(c(VarZ[2,2],VarZ[2,3],
                   VarZ[3,2],VarZ[3,3]),nrow=2)
    VarX

# Encontrar Cov(Y,X)
    CovYX=matrix(c(VarZ[1,2],VarZ[1,3]),
                 nrow=1)
    CovYX

# Cov(X,Y)
    CovXY=t(CovYX)
    CovXY

###### ii)

# Calcular E(Y^2)

    EY2<-VarY+(EZ[1,1]^2)
    EY2

# Calcular E(Xt(X))
    q<-c(0,2)
    EXX_t<-VarX+c(0,2)%*%t(q)
    EXX_t

# calcular E(t(X)X)
    EX_tX<-VarX[1,1]+VarX[2,2]+1
    EX_tX

# calcular E(Yt(X))
    EYX_t<-CovYX+c(0,2)
    EYX_t

# calcular E(XY)
    EXY<-t(EYX_t)
    EXY