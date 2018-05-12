#ejercicio 3.5
#genera una muestra para x=100 
library(MASS)
N      = 200
m.yx1   = c(0,0,1,1)

a=1
b=0
c=4
d=9
cov.yx1 = matrix(c(1,0,1,0,0,9,0,1,1,0,4,0,0,1,0,9), 4,4 )
x1     = mvrnorm(N, m.yx1, cov.yx1)


