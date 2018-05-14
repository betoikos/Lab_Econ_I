# Tarea 1 ejercicio 4
Primero meteremos los valores de las variables

    x1=0
    x2=-4
    x3=1
    y1=-1
    y2=4
    sx1=1
    sx2=4
    sx3=2
    sy1=1
    sy2=9
    Cx1x2=-1
    Cx1x3=0
    Cx1y1=0
    Cx1y2=1
    Cx2x3=2
    Cx2y1=-1
    Cx2y2=-3
    Cx3y1=0
    Cx3y2=3
    Cy1y2=-2

Encontrar Ex

    Ex=c(x1,x2,x3)
    Ex
Ahora calculamos la matriz de varianzas y covarianzas

    sx=matrix(c(sx1,Cx1x2,Cx1x3,Cx1x2,sx2,Cx2x3,Cx1x3,Cx2x3,sx3),3,3)
    sx
    
Esperanzas de Y

    Ey=matrix(c(y1,y2),2)
    Ey
    
Matriz de varianzas y Covarianzas para Y

    sY=matrix(c(sy1,Cy1y2,Cy1y2,sy2),2,2)
    sY

Matriz de Carianzas conjunta de X,Y

    Cxy=matrix(c(Cx1y1,Cx1y2,Cx2y1,Cx2y2,Cx3y1,Cx3y2),3,3)
    Cxy

Ahora calculamos su transpuesta

    Cyx=t(Cxy)
    Cyx

### Inciso 2
Incorporamos los nuevos datos

    z=c(1,1.5,-4)
    Calculamos la esperanza
    Ez=z*Ex
    Ez
    ESte es para la covarianza
    sz=t(z)%*%sx%*%z
    sz

### Inciso 3

Metemos las matrices de constantes

    A=matrix(c(-2,1,0,4,1,-2),,3)
    A
    b=matrix(c(1,1),2)
    b
calculamos la transformación EAx=Ax+b

    EAx=A%*%Ex+b
    EAx

Ahora la varianza de la tranformación se calcula como

    sAx= A%*%sx%*%t(A)
    sAx

### inciso 4

Estableceremos primero las siguientes matrices

    U=matrix(c(1,0,-3,0,1,0,0,2,3),3,3)
    U
    t(U)
    w=matrix(c(2,0,5),3)
    w

    V=matrix(c(1,-1,-1,4,1,-1),2,3)
    V

    v=matrix(c(1,0),2)
    v
Ahora calculamos esperanzas

    EU=(t(U)%*%Ex)+w
    EU
    EV=(V%*%Ex)+v
    EV
Posteriormente la varianza Var(U)

    sU=t(U)%*%sx%*%U
    sU
Ahora se hara lo mismo pero con Var(V)

    sV=V%*%sx%*%t(V)
    sV

y ahora las covarianzas 

    Cov(U,V)
    CUV=t(U)%*%sx%*%t(V)
    CUV
    y la transpuesta
    Cov(V,U)
    CVU=t(CUV)
    CVU

### inciso 5

Primero meteremos las siguiente matriz de datos

    C=matrix(c(-2,1,5),3)
    C
    d=8
    d

ahora procederemos al cálculo de Cov(AX+b,Cx+d)

    CW=A%*%sx%*%C
    CW

### inciso 6

Primero meteremos las matrices de datos

    D=matrix(c(1,0,2,-2,4,3),byrow=T,3)
    D
    e=matrix(c(1,0,-1),3)
    e

ahora se calculará C(AX+b,Dy+e)

    CP=A%*%Cxy%*%D
    CP

### inciso 7

Primero meteremos la matrices de datos

    N=matrix(c(-1,0,-4,1,2,-1),byrow=T,2)
    N
Ahora procederemos al cálculo de la varianza

    sNx=N%*%sx%*%t(N)
    sNx

### Inciso 8

Procedemos a la introducción de datos

    G=matrix(c(-1,0,-4,1,2,-1),byrow=T,2)
    G

    H=matrix(c(1,1,0,1,1,-1),byrow=T,3)
    H

Ahora se calculará la covarianza

    CWZ=G%*%Cxy%*%H
    CWZ

    CZW=t(CWZ)
    CZW




# Tarea 2 
## Ejercicio 5

Se realizará un algoritmo de mco

Sea x es una matriz de orden n*k y y es una matriz de n*1
El algoritmo se describe en el siguiente codigo

    bmc=function(x,y){
      xr=nrow(x)
      yr=nrow(y)
      X=cbind(rep(1,xr),x)
      if(xr==yr){
        b=solve(t(X)%*%X)%*%t(X)%*%y
        return(b)
      } else {
        print("leer es bueno, sigue intentando")
      }
    }

Ahora se proderá el algoritmo para bmcr
Sea x una matriz de n*k, y una matriz de n*1, R una matriz donde se describe las restricciones y r vector de constante para las restricciones

    bmcr=function(x,y,R,r){
      xr=nrow(x)
      X=cbind(rep(1,xr),x)
      yr=nrow(y)
      rc=ncol(R)
      rr=nrow(R)
      xc=ncol(X)
      if (xr==yr & rc==xc){
        b=solve(t(X)%*%X)%*%t(X)%*%y
        b-solve(t(X)%*%X)%*%t(R)%*%solve(R%*%solve(t(X)%*%X)%*%t(R))%*%(R%*%b-r)
      }else
        print("leer es bueno, verifica")
    }




# Tarea 3
## ejercico 5

Para realizar este ejercicio primero instalaremos unas paqueteria que es necesaria para facilitar el trabajo, esta fue facilitada por Yahir López López

    install.packages("magic")
    library(magic)

Escribimos las siguientes matrices

    vectores de medias
    m1=c(0,-1)
    m2=c(-2,0,2)
    
    matrices de covarianzas
    s1=matrix(c(1,-.25,-.25,.5),2)
    s2=matrix(c(1,1/3,-1/2,1/3,1/4,0,-.5,0,1),3)
    
    Unimos los vectores de medias
    m=c(m1,m2)
    
    Unimos las matrices de varianzas y covarianzas
    s=adiag(s1,s2)

Ahora generamos una muestra aleatoria para n=100 con los anteriores vectores de medias y varianzas

    x=mvrnorm(800,m,s)


## Ejercicio 6

Escribimos las siguientes matrices para formar la muestra aleatoria

    vector de medias
    m=c(0,0,1,1)
    
    matriz de varianzas
    s=matrix(c(1,0,1,0,0,9,0,1,1,0,4,0,0,1,0,9),4)
    
    Generamos la muestra
    x=mvrnorm(200,m,s)
    A=matrix(c(0,0,0,1,0,1,0,0,1,0,0,0,0,0,1,0),4)

### Inciso 1

Realizamos el siguiente cambio de variable

    x1=A%*%t(x)

La anterior transformación es normal por que es una aplicación lineal hacia un vector aleatorio normal

    La media es
    m1=A%x%m
    
    La varianza es
    s1=A%*%s%*%t(A)