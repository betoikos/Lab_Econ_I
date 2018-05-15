# Ejercicio 1.6

EZ=matrix(c(1,0,2),3)
EZ

VarZ= matrix(c(0.8,0.4,-0.2,0.4,1,-0.8,-0.2,-0.8,2),3)
VarZ

#Ejercicio i)


VarY=VarZ[1,1]
VarY


VarX=matrix(c(VarZ[2,2],VarZ[2,3],VarZ[3,2],VarZ[3,3]),byrow=T,nrow=2)
VarX


CovYX=matrix(c(VarZ[1,2],VarZ[1,3]),byrow=T,nrow=1)
CovYX


CovXY=t(CovYX)
CovXY

#Ejercicio ii)


EY2=VarY+(EZ[1,1]^2)
EY2


EXtX=VarX+c(0,2)%*%t(c(0,2))
EXtX


EtXX=VarX[1,1]+VarX[2,2]+1
EtXX


EYtX=CovYX+c(0,2)
EYtX


EXY=t(EYtX)
EXY