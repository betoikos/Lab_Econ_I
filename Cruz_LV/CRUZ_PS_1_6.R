#Ejercicio seis tarea 1

MEANZ = matrix(c(1,0,2),3,1)
VARZ = matrix(c(0.8,0.4,-0.2,0.4,1,-0.8,-0.2,-0.8,2),3,3)
MEANX = matrix(c(0,2),2,1)

#i 
VARY = VARZ[1,1]
VARX = matrix(c(1,-0.8,-0.8,2),2,2)
COVYX = matrix(c(0.4,-0.2),1,2)
COVXY = t(COVYX)

VARY
VARX
COVYX
COVXY

#ii
EY2 = VARZ[1,1] + MEANZ[1,1]
EXXT = MEANX%*%t(MEANX) + VARX
EXTX = EXXT[1,1] + EXXT[2,2]
EYXT = MEANZ[1,1]%*%t(MEANX) + COVYX
EXY = t(EYXT)

EY2
EXXT
EXTX
EYXT
EXY
