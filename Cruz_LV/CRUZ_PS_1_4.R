MEANX = c(0,-4,1)
MEANY = c(-1,4)
VARX = matrix(c(1,-1,0,-1,4,2,0,2,2),3,3)
VARY = matrix(c(1,-2,-2,9),2,2)
COVXY = matrix(c(0,-1,0,1,-3,3),3,2)
COVYX = t(COVXY)

MEANX
MEANY
VARY
VARX
COVXY
COVYX

#ii 

E21 = c(-1,3/2,-4)%*%MEANX
E21
E22 = c(-1,3/2,-4)%*%VARX%*%c(-1,3/2,-4)
E22

#iii 
A = matrix(c(-2,1,0,4,1,-2),2,3)
b = c(1,1)

E31 = A%*%MEANX + b
E32 = A%*%VARX%*%t(A)

E31
E32

#iv
G = matrix(c(1,0,0,0,1,2,-3,0,3),3,3)
g = c(2,0,5)
H = matrix(c(1,-1,-1,4,1,-1),2,3)
h = c(1,0)

E41 = G%*%MEANX + g
E42 = H%*%MEANX + h
E43 = G%*%VARX%*%t(G)
E44 = H%*%VARX%*%t(H)
E45 = G%*%VARX%*%t(H)
E46 = t(E45)

E41
E42
E43
E44
E45
E46

#v
C = c(-2,1,5)
d = 8

E51 = A%*%VARX%*%C
E51

#vi
D = matrix(c(1,2,4,0,-2,3),3,2)
e = c(1,0,-1)

E61 = A%*%COVXY%*%t(D) 
E61

#vii
J = matrix(c(-1,1,0,2,-4,0),2,3)

E71 = J%*%VARX%*%t(J)
E71

#viii
K = matrix(c(-1,1,0,2,-4,0),2,3)
k = c(0,-1)
L = matrix(c(1,0,1,1,1,-1),3,2)

E81 = K%*%COVXY%*%t(L)
E82 = L%*%COVYX%*%t(K)
E81
E82
