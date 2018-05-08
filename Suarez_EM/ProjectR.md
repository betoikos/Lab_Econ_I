
#           Evelyn Magali Suárez Reyes

########################################################################################################
##
##   Tarea 1. Ejercicio 4.
##
########################################################################################################



# Se tiene que X es un vector aleatorio de dimensión 3 y Y un vector 
# aleatorio de dimensión 

## Utilizando los datos del ejercicio definimos los valores esperados,
## varianzas y covarianzas de las variables aleatorias de los vectores.  

    Ex1 = 0
    Ex2 = -4
    Ex3 = 1
    Ey1 = -1
    Ey2 = 4 

    varx1 = 1
    varx2 = 4
    varx3 = 2
    vary1 = 1
    vary2 = 9

    covx1x2 = -1
    covx1x3 = 0
    covx1y1 = 0
    covx1y2 = 1

    covx2x3 = 2
    covx2y1 = -1
    covx2y2 = -3

    covx3y1 = 0
    covx3y2 = 3
    covy1y2 = -2


## i) Encontrar E(X), var(X), E(Y), var(Y),cov(X,Y) y cov(Y,x) 


###  E(X)

    EX = matrix(c(Ex1,Ex2,Ex3),3)
    EX
          [,1]
    [1,]    0
    [2,]   -4
    [3,]    1
    
###  var(X)

    varX = matrix(c(varx1,covx1x2,covx1x3,covx1x2,varx2,covx2x3,covx1x3,covx2x3,varx3),3)
    varX
          [,1] [,2] [,3]
    [1,]    1   -1    0
    [2,]   -1    4    2
    [3,]    0    2    2


###  var(Y)

    varY = matrix(c(vary1,covy1y2,covy1y2,vary2),2)
    varY
 
         [,1] [,2]
    [1,]    1   -2
    [2,]   -2    9

### cov(X,Y)

    covXY<- matrix(c(covx1y1,covx1y2,covx2y1,covx2y2,covx3y1,covx3y2),2)
    covXY
          [,1] [,2] [,3]
    [1,]    0   -1    0
    [2,]    1   -3    3


### cov(Y,X)   (recordemos que cov(Y,X)=cov(X,Y)')

    covYX=t(covXY)
    covYX
             [,1] [,2]
        [1,]    0    1
        [2,]   -1   -3
        [3,]    0    3



## ii) Calcular E1=E(-X1+3/2x2-4x3) y V2=var(-x1+3/2X2-4X3)

### Llamemos E1 a E(-X1+3x2-4x3), entonces
    E1=c(-1,2,-4)%*%EX
    E1
          [,1]
    [1,]  -12

### Llamemos V1 a var(-x1+3/2X2-4X3), entonces 

    V1=t(c(-1,2,-4))%*%varX%*%c(-1,2,-4)
    V1
          [,1] [,2] [,3]
    [1,]    1   -1    1
    [2,]   -1    4   -1


## iii) Calcular E(AX+b) y var(AX+b)

### Primero definamos A y b

    A=t(matrix(c(-2,0,1,1,4,-2),3))
    b=c(1,1)

$$
\left(\begin{array}
0.8944272 & 0.4472136\\
-0.4472136 & -0.8944272
\end{array}\right\)

\left(\begin{array}
10 & 0\\
0 & 5
\end{array}\right)
$$ 

### Utilizando propiedades de valor esperado sabemos que E(AX+b)=A*E(X)+b
    E2=A%*%EX+b

### Utilizando propiedades de la covarianza sabemos que E(AX+b)=A'*var(X)*A

    V2=(A)%*%varX%*%t(A)
    V2
         [,1]
    [1,]    2
    [2,]  -17

## iv) Calcular E(U), E(V), var(U), var(V), cov(U,V) y cov(V,U)

### Primero definamos U y V. Veamos que U=U1*X+u y V=V1*X+v

    U1=t(matrix(c(1,0,-3,0,1,0,0,2,3),3))
    u=c(2,0,5)
    V1=t(matrix(c(1,-1,1,-1,4,-1),3))
    v=c(1,0)


### E(U)

    EU=U1%*%EX+u
    EU

### E(V)

    EV=V1%*%EX+v

### var(U)

    varU=(U1)%*%varX%*%t(U1)
    varU


### var(V)

    varV=V1%*%varX%*%t(V1)
    varV

### cov(U,V). Sabemos que la cov(U1X+u,V1X+v)=U1*var(X)*V1'

    covUV=U1%*%varX%*%t(V1)
    covUV

###cov(V,U)

    covVU=t(covUV)
    covVU


##  v) Calcular cov(AX+b,CX+d)

### Primero definamos C y d

    C=t(c(-2,1,5))
    d=8

### Calculemos cov(AX+b,CX+d)=A*var(X)*C'=:cov1

    cov1=A%*%varX%*%t(C)
    cov1

## vi) Calcular la var(W). W=W1*X+w

### Definamos W

    W1=t(matrix(c(1,0,-4,1,2,0),3))
    w=c(0,-1)

### var(W)

    varW=W1%*%varX%*%t(W1)

## vii) Calcular cov(W,Z) y cov(Z,W)

### Definamos Z=Z1*Y

    Z1=t(matrix(c(1,1,0,1,1,-1),2))

### Calculamos  cov(W,Z)

    covWZ=W1%*%covXY%*%t(Z1)

### Calculamos  cov(Z,W)

    covZW=Z1%*%covYX%*%t(W1)




