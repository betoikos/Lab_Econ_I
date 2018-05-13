#ejercicio 2.5
#fuinciones para bmco bmcr y y para u // no se puede calcular para y y para u, necesimos a fuerzas la 
library(MASS)
N      = 100
m.yx   = c(1,0,2)
cov.yx = matrix(c(0.8, 0.4, -0.2, 0.4, 1, -0.8, -0.2, -0.8, 2), 3)
yx     = mvrnorm(N, m.yx, cov.yx)
one    = matrix(1,N,1)
Y      = matrix(yx[,1], 100,1)
X      = matrix(c(one,yx[,-1]),100,3)


Bmco = function(x,y){
  a=is(x, "matrix")
  b=is(y, "matrix")
  if ((a=TRUE) & (b=TRUE)) {
    w=solve(t(x)%*%x)%*%t(x)%*%y
    return(w)
  }
  else{
    print("Please only use matrix")
  }
}

Bmcr = function(x,y,R,r){
    w=Bmco(x,y)-solve(t(x)%*%x)%*%t(R)%*%solve(R%*%solve(t(x)%*%x)%*%t(R))%*%(R%*%Bmco(x,y)-r)
    return(w)
}

R=matrix(c(1,2,0,0,2,3,4,0,5),3,3)
r=matrix(c(1,2,3),3,1)
Bmco(X,Y)
Bmcr(X,Y,R,r)



