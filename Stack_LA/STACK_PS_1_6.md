# Tarea 1 ejercicio 6

### Definimos el vector de esperanzas y la matríz de varianzas y covarianzas del vector Z

    EZ=matrix(c(1,0,2),nrow=3)
    EZ

    VarZ= matrix(c(0.8,0.4,-0.2,0.4,1,-0.8,-0.2,-0.8,2),byrow=T, nrow=3)
    VarZ

### Inciso (i)

### Calculamos la VarY, VarX, CovXY

    VarY=VarZ[1,1]
    VarY

    VarX=matrix(c(VarZ[2,2],VarZ[2,3],VarZ[3,2],VarZ[3,3]),byrow=T,nrow=2)
    VarX

    CovYX=matrix(c(VarZ[1,2],VarZ[1,3]),byrow=T,nrow=1)
    CovYX

    CovXY=t(CovYX)
    CovXY

### Inciso (ii)

### Calculamos E(Y^2), E(Xt(X)), E(t(X)X), E(Yt(X)), E(XY)

    EYcuadrado=VarY+(EZ[1,1]^2)
    EYcuadrado

    EXXtrans=VarX+c(0,2)%*%t(c(0,2))
    EXXtrans

    EXtX=VarX[1,1]+VarX[2,2]+1
    EXtX

    EYXtrans=CovYX+c(0,2)
    EYXtrans

    EXY=t(EYXtrans)
    EXY