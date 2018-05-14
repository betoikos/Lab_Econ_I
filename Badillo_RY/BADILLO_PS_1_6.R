# Ejercicio 1.6


EZ=matrix(c(1,0,2),nrow=3)
EZ

var.Z= matrix(c(0.8,0.4,-0.2,0.4,1,-0.8,-0.2,-0.8,2),byrow=T, nrow=3)
var.Z

# I

# var.Y

var.Y=var.Z[1,1]
var.Y

# var.X

var.X=matrix(c(var.Z[2,2],var.Z[2,3],var.Z[3,2],var.Z[3,3]),byrow=T,nrow=2)
var.X

# Cov(Y,X)

cov.YX=matrix(c(var.Z[1,2],var.Z[1,3]),byrow=T,nrow=1)
cov.YX

# Cov(X,Y)

CovXY=t(cov.YX)
CovXY

# II

# E(Y^2)

EY2=var.Y+(EZ[1,1]^2)
EY2

# E(Xt(X))

E.XXt=var.X+c(0,2)%*%t(c(0,2))
E.XXt

# E(t(X)X)

E.XtX=var.X[1,1]+var.X[2,2]+1
E.XtX

# E(Yt(X))

E.YXt=cov.YX+c(0,2)
E.YXt

# E(XY)

EXY=t(E.YXt)
EXY