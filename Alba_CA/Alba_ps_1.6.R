# Ejercicio 1.6


EZ=matrix(c(1,0,2),nrow=3)
EZ

VarZ= matrix(c(0.8,0.4,-0.2,0.4,1,-0.8,-0.2,-0.8,2),byrow=T, nrow=3)
VarZ

# I

# VarY

VarY=VarZ[1,1]
VarY

# VarX

VarX=matrix(c(VarZ[2,2],VarZ[2,3],VarZ[3,2],VarZ[3,3]),byrow=T,nrow=2)
VarX

# Cov(Y,X)

CovYX=matrix(c(VarZ[1,2],VarZ[1,3]),byrow=T,nrow=1)
CovYX

# Cov(X,Y)

CovXY=t(CovYX)
CovXY

# II

# E(Y^2)

EY2=VarY+(EZ[1,1]^2)
EY2

# E(Xt(X))

EXXt=VarX+c(0,2)%*%t(c(0,2))
EXXt

# E(t(X)X)

EXtX=VarX[1,1]+VarX[2,2]+1
EXtX

# E(Yt(X))

EYXt=CovYX+c(0,2)
EYXt

# E(XY)

EXY=t(EYXt)
EXY