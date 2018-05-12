#ejercicio 3.5
#genera una muestra para x=100 
library(MASS)
N      = 50
m.yx1   = c(0,-1)

a=1
b=-1/4
c=b
d=1/2

cov.yx1 = matrix(c(a,b , c, d), 2,2 )
x1     = mvrnorm(N, m.yx1, cov.yx1)

m.yx2   = c(-2,0,2)

a=1
b=1/3
c=-1/2
d=b
e=1/4
f=0
g=c
h=f
i=a

cov.yx2 = matrix(c(a,b , c, d, e, f, g, h, i), 3,3 )
x2     = mvrnorm(N, m.yx2, cov.yx2)
X      = matrix(c(x1,x2),100,5)

X
