# Ejercicio 5, Tarea 2.

Para este ejercicio se procedió a generar una función para calcular los estimadores de MCO y MCR.

1. Función para obtener estimadores de MCO.

Para el desarrollo de la formula de consideró como insumos:

- x: que se define como una matriz de n observaciones por k columnas de variables explicativas.
- Y: que se define como un vector columna de n observaciones.
-varianza: una variable boleana que en caso de tomar "True" genera además de los estimadores de MCO una estimación de la varianza de U.

En el codigo se generá una matrix X que procede a agregar la columna de 1's a el insumo x.

    X=cbind(rep(1,nrow(x)),x)

Se generá una matriz de etiquetas para cada uno de los estimadores
    
    Cnames=matrix(,1,ncol(x))
      for(i in 1:ncol(x)){
        Cnames[1,i]=(paste("\beta",i))
      }
      c=cbind("Intercepto",Cnames,"Var(U)")

Se genera la condición para ejecutar MCO, además de un condicional sobre la variable boleana para presentarse en los resultados la varianza de U u omitirse:

    if(nrow(x)==nrow(Y)){
        B=solve(t(X)%*%X)%*%t(X)%*%Y
        VU=(1/(nrow(X)-ncol(X)))*(t(Y-X%*%B)%*%(Y-X%*%B))
        Est=matrix(rbind(B,VU),ncol=1,dimnames = list((as.vector(c)),c("Valor estimado")))
        if (varianza==F){matrix(Est[1:ncol(X),1],ncol=1,dimnames = list((cbind("Intercepto",Cnames)),c("Valor estimado")))
        } else {print(Est)} 
      } else {print("El número de observaciones en x es distinto a las de Y")}
  
Siendo el codigo completo el siguiente:

    EstMCO=function(x,Y,varianza){
      X=cbind(rep(1,nrow(x)),x)
      Cnames=matrix(,1,ncol(x))
      for(i in 1:ncol(x)){
        Cnames[1,i]=(paste("??",i))
      }
      c=cbind("Intercepto",Cnames,"Var(U)")
      if(nrow(x)==nrow(Y)){
        B=solve(t(X)%*%X)%*%t(X)%*%Y
        VU=(1/(nrow(X)-ncol(X)))*(t(Y-X%*%B)%*%(Y-X%*%B))
        Est=matrix(rbind(B,VU),ncol=1,dimnames = list((as.vector(c)),c("Valor estimado")))
        if (varianza==F){matrix(Est[1:ncol(X),1],ncol=1,dimnames = list((cbind("Intercepto",Cnames)),c("Valor estimado")))
        } else {print(Est)} 
      } else {print("El número de observaciones en x es distinto a las de Y")}
    }


2. Función para obtener estimadores de MCR.

Para el desarrollo de la formula de consideró como insumos:

- x: que se define como una matriz de n observaciones por k columnas de variables explicativas.
- Y: que se define como un vector columna de n observaciones.
- R: matriz de qx(k+1), donde q es el número de restricciones y k el número de variables explicativas.
- r: es una matriz columna de q hileras.
-varianza: una variable boleana que en caso de tomar "True" genera además de los estimadores de MCO una estimación de la varianza de U.

En el codigo se generá una matrix X que procede a agregar la columna de 1's a el insumo x.
    
    X=cbind(rep(1,nrow(x)),x)

Se generá una matriz de etiquetas para cada uno de los estimadores
    
    Cnames=matrix(,1,ncol(x))
      for(i in 1:ncol(x)){
        Cnames[1,i]=(paste("\beta",i))
      }
      c=cbind("Intercepto",Cnames,"Var(U)")

Se genera la condición para ejecutar MCR, además de un condicional sobre la variable boleana para presentarse en los resultados la varianza de U u omitirse:

    if(nrow(X)==nrow(Y) & ncol(X)==ncol(R)){
        B=solve(t(X)%*%X)%*%t(X)%*%Y
        BR=B-solve(t(X)%*%X)%*%t(R)%*%solve(R%*%solve(t(X)%*%X)%*%t(R))%*%(R%*%B-r)
        VU=(1/(nrow(X)-ncol(X)))*(t(Y-X%*%BR)%*%(Y-X%*%BR))
        Est=matrix(rbind(BR,VU),ncol=1,dimnames = list((as.vector(c)),c("Valor estimado")))
        if (varianza==F){matrix(Est[1:ncol(X),1],ncol=1,dimnames = list((cbind("Intercepto",Cnames)),c("Valor estimado")))
          } else {print(Est)}
      } else {print("El número de observaciones en X es distinto a Y o el número de restricciones supera los párametros")}
  
Siendo el codigo completo:

    EstMCR=function(x,Y,R,r,varianza){
      X=cbind(rep(1,nrow(x)),x)
      Cnames=matrix(,1,ncol(x))
      for(i in 1:ncol(x)){
        Cnames[1,i]=(paste("\beta",i))
      }
      c=cbind("Intercepto",Cnames,"Var(U)")
      if(nrow(X)==nrow(Y) & ncol(X)==ncol(R)){
        B=solve(t(X)%*%X)%*%t(X)%*%Y
        BR=B-solve(t(X)%*%X)%*%t(R)%*%solve(R%*%solve(t(X)%*%X)%*%t(R))%*%(R%*%B-r)
        VU=(1/(nrow(X)-ncol(X)))*(t(Y-X%*%BR)%*%(Y-X%*%BR))
        Est=matrix(rbind(BR,VU),ncol=1,dimnames = list((as.vector(c)),c("Valor estimado")))
        if (varianza==F){matrix(Est[1:ncol(X),1],ncol=1,dimnames = list((cbind("Intercepto",Cnames)),c("Valor estimado")))
          } else {print(Est)}
      } else {print("El número de observaciones en X es distinto a Y o el número de restricciones supera los párametros")}
    }

3. Prueba de funciones.

Se consideraron los datos del ejercicio 1 de la tarea 15 obteniendo:

- Estimadores MCO con y sin varianza:

        > EstMCO(D15.1[1:120,],Y1,varianza=F)
                       Valor estimado
         Intercepto      0.5760072
         \beta 1         0.5079889
         \beta 2        -1.1955320
         \beta 3        -0.7473102

        > EstMCO(D15.1[1:120,],Y1,varianza=T)
                       Valor estimado
        Intercepto      0.5760072
        \beta 1         0.5079889
        \beta 2        -1.1955320
        \beta 3        -0.7473102
        Var(U)          0.3494417

-Estimadores de MCR con y sin varianza.

    > EstMCR(D15.1[1:120,],Y1,diag(4),rep(0,4),varianza=T)
               Valor estimado
    Intercepto  -2.220446e-16
    \beta 1     -2.220446e-16
    \beta 2      6.661338e-16
    \beta 3     -5.551115e-16
    Var(U)       1.429367e+00

    > EstMCR(D15.1[1:120,],Y1,diag(4),rep(0,4),varianza=F)
               Valor estimado
    Intercepto  -2.220446e-16
    \beta 1     -2.220446e-16
    \beta 2      6.661338e-16
    \beta 3     -5.551115e-16