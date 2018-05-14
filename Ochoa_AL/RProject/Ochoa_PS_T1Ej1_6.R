
#Tarea 1 Ejercicio 6
#inciso i)
EZ=c(1,0,2) #media de Z
VarZ=matrix(c(0.8,.4,-.2,.4,1,-.8,-.2,-.8,2),3)
EZ
VarZ
EZ<- as.matrix(EZ,3)
EZ

VarY<-VarZ[1]
VarY
VarZ2<-VarZ[2,,drop=FALSE] #renglon2
VarZ2
VarZ3<-VarZ[3,,drop=FALSE] #renglon3
VarZ3

varZ4<-rbind(VarZ2,VarZ3) #unir vertical
varZ4
VarZ5<-varZ4[,2, drop=FALSE] #columna2
VarZ5
VarZ3<-varZ4[,3,drop=FALSE]#columna 3
VarZ3
VarX<- cbind(VarZ5,VarZ3)
VarX

VarZ1<-VarZ[1,,drop=FALSE] #renglon2
VarZ1

CovYX<-cbind(VarZ1[2],VarZ1[3])
CovYX

CovXY<-t(CovYX)
CovXY

#inciso ii)

EY2=VarY + EZ[1]^2
EY2

########Revisar

#Para E(XX´)

EX1c=VarX[1]+EZ[2]^2

EX1X2=VarX[2]+EZ[2]*EZ[3]

EX2c=VarX[4]+EZ[3]^2

EXXt= matrix(c(EX1c,EX1X2,EX1X2,EX2c),2)
EXXt

#Para E(X´X)

EXtX=EX1c+EX2c
EXtX

#E(YX´)

EYX1= VarZ[2]+EZ[1]*EZ[2]

EYX2= VarZ[3]+EZ[1]*EZ[3]

EYXt <- matrix(c(EYX1,EYX2),1)
EYXt

# E(XY)
EXY <- matrix(c(EYX1,EYX2),2)
EXY