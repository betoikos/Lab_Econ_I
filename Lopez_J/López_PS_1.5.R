####################Ejercicio 6, Tarea 1.############################

#z=(y,X), tal que X=(x1,x2)
EZ=matrix(c(1,0,2),ncol=1)
VZ= matrix(c(0.8,0.4,-0.2,0.4,1,-0.8,-0.2,-0.8,2),ncol=3,byrow=T)
#i) Entrontar:

VarY1.6=VZ[1,1]
VarX1.6=matrix(c(VZ[2,2],VZ[2,3],VZ[3,2],VZ[3,3]),ncol=2)
covYX1.6=matrix(c(VZ[1,2],VZ[1,3]),ncol=2)
covXY1.6=t(covYX1.6)

#ii) Calcular:

EYcuadrada=VarY1.6+EZ[1,1]^2
EXtX=VarX1.6+c(0,2)%*%t(c(0,2))
EtXX=VarX1.6[1,1]+VarX1.6[2,2]+1
EytX=covYX1.6+c(0,2)
EyX=t(EytX)
