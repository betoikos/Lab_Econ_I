# Proyecto Final - Econometría I
## El Colegio de México / CEE

### Ochoa Morales Amada Lorena

    
Este documento muestra algunos de los procedimientos principales que se realizaron en R durante el laboratorio de Econometría I.
Se seleccionaron algunos problemas de las tareas enviadas por el Profr. Eneas y un ejercicio de clase, que consiste en un análisis sobre salarios de jugadores deportivos, para replicarlo con diferentes periodo en años (valores) para realizarlo en R .

A continuación se presentan los ejercicios seleccionados:

1. Tarea 1
    1. Ejercicio 4. Replicar los ejercicios.
    2. Ejercicio 6. Replicar los ejercicios.

1. Tarea 2
    1. Ejercicio 5. Generar funciones para bmco, bmcr, Y y U.
    
1. Tarea 3
    1. Ejercicio 5. Generar una muestra para X, n = 100.
    1. Ejercicio 6. Generar una muestra para X, n = 200.
    
1. Artículo: " * Does pay inequality affect team performance?* " 



A continuación se muestran los códigos y los resultados obtenidos.



## Tarea 1: Ejercicio 4.

Este ejercicio consiste en construir un vector de medias, una matriz de varianzas para X, Y con los siguientes valores:

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

Codigo:

    #E(x) esperanza de x

    #EX = t(t(c(Ex1,Ex2,Ex3)))
    #EX = Matrix(c(variables,,))  son columna
    EX = matrix(c(Ex1,Ex2,Ex3))
    EX
    
Resultado:

    > EX
         [,1]
    [1,]    0
    [2,]   -4
    [3,]    1

Código:

    #var X
    VarM= matrix (c(1,2,3,4,5,6),2)  

    VarM


    varX = matrix(c(varx1, covx1x2, covx1x3,covx1x2, varx2, covx2x3, covx1x3, covx2x3, varx3),3)
    varX

    #var y

    varY = matrix(c(vary1, 
                    covy1y2,
                    covy1y2,vary2),2)
    varY

Resultado:


    > #var X
    > VarM= matrix (c(1,2,3,4,5,6),2) # la instruccion <,2> indica en cuantos renglones se dividen los datos, es decir corta una columna con N elementos y empieza a formar la siguiente
    > VarM
         [,1] [,2] [,3]
    [1,]    1    3    5
    [2,]    2    4    6
    > 
    > 
    > varX = matrix(c(varx1, covx1x2, covx1x3,covx1x2, varx2, covx2x3, covx1x3, covx2x3, varx3),3)
    > varX
         [,1] [,2] [,3]
    [1,]    1   -1    0
    [2,]   -1    4    2
    [3,]    0    2    2
    > 
    > #var y
    > 
    > varY = matrix(c(vary1, 
    +                 covy1y2,
    +                 covy1y2,vary2),2)
    > varY
         [,1] [,2]
    [1,]    1   -2
    [2,]   -2    9
    > 
**Nota:** La instruccion **),2)** indica en cuantos renglones se dividen los datos, es decir corta una columna con N elementos y empieza a formar la siguiente

### Inciso ii)

Del inciso ii). al viii). se deben encontrar los valores esperados y las varianzas de algunas transformaciones lineales especificas.

Para ello se programa en R, utilizando las proposiciones vistas en clase para las correspondientes transformaciones de los vectores para encontrar medias y varianzas.

Se utilizan funciones como:

* concatenar:  * ** c() ** *
* Transponer matriz: * **t()** *
* Generar matrices: * **matrix(c(, , , ),n)** *, **n** = numero de renglones
* Multiplicacion de matrices:  ** %*% **
  
**Código:**

    > #i) encontrar E(X)
    > EX
    
**Resultado:**
    
        [,1]
    [1,]    0
    [2,]   -4
    [3,]    1
    
**Código:**

    > #i)VarX
    > varX

**Resultado:**

        [,1] [,2] [,3]
    [1,]    1   -1    0
    [2,]   -1    4    2
    [3,]    0    2    2
    
**Código:**

    > #i)EY
    > EY = matrix(c(Ey1,Ey2))
    > EY
    
**Resultado:**

         [,1]
    [1,]   -1
    [2,]    4

**Código:**

    > #i)varY
    > varY = matrix(c(vary1,covy1y2,covy1y2,vary2),2)
    > varY

**Resultado:**
    
         [,1] [,2]
    [1,]    1   -2
    [2,]   -2    9

**Código:**

    > #i) cov (x,y)
    > covXY = matrix(c(covx1y1,covx2y1,covx3y1,covx1y2,covx2y2,covx3y2),3)
    > covXY
    
**Resultado:**

         [,1] [,2]
    [1,]    0    1
    [2,]   -1   -3
    [3,]    0    3
    
**Código:**
    
    > #i) cov (y,x)
    > covYX = t(covXY)
    > covYX
    
**Resultado:**

         [,1] [,2] [,3]
    [1,]    0   -1    0
    [2,]    1   -3    3


**Código:**

    > #ii) E(-x1+3/2X2-4X3)=EW
    >
    > A= matrix(c(-1,3/2,-4),1)
    > A
    
**Resultado:**

         [,1] [,2] [,3]
    [1,]   -1  1.5   -4

**Código:**

    > EW = A%*%EX #multiplicacion de matrices %*%
    > EW
    
**Resultado:**

         [,1]
    [1,]  -10

**Código:**

    > #ii) Var(W)
    > varW = A%*%varX%*%t(A)
    > varW
    
**Resultado:**

         [,1]
    [1,]   21

### Inciso iii)

**Código:**

    > #iii)
    > A= matrix(c(-2,1,0,4,1,-2),2)
    > A
    
**Resultado:**

         [,1] [,2] [,3]
    [1,]   -2    0    1
    [2,]    1    4   -2

**Código:**

    > b= matrix(c(1,1),2)
    > b
    
**Resultado:**

         [,1]
    [1,]    1
    [2,]    1
    
**Código:**

    > #E(AX+b)=EZ
    > EZ=A%*%EX+b
    > EZ
    
**Resultado:**

         [,1]
    [1,]    2
    [2,]  -17
    
**Código:**

    > #Var(AX+b)
    > varZ=A%*%varX%*%t(A)
    > varZ
    
**Resultado:**

         [,1] [,2]
    [1,]    6   10
    [2,]   10   33

### Inciso iv)

**Código:**

    > #iv) para U=AX+c y V=BX+d
    > A=matrix(c(1,0,0,0,1,2,-3,0,3),3)
    > A
    > c=matrix(c(2,0,5),3)
    > c
    > 
    > B=matrix(c(1,-1,-1,4,1,-1),2)
    > B
    > d=matrix(c(1,0),2)
    > d
    > 
    > #U=AX+c; V=BX+d
    > EU=A%*%EX+c
    > EU
    > 
    > EV=B%*%EX+d
    > EV
    > 
    > varU=A%*%varX%*%t(A)
    > varU
    > 
    > varV=B%*%varX%*%t(B)
    > varV   
    > 
    > covUV=A%*%varX%*%t(B)
    > covUV
    > 
    > covVU=t(covUV)
    > covVU
    
**Resultado:**

         [,1] [,2] [,3]
    [1,]    1    0   -3
    [2,]    0    1    0
    [3,]    0    2    3

         [,1]
    [1,]    2
    [2,]    0
    [3,]    5

         [,1] [,2] [,3]
    [1,]    1   -1    1
    [2,]   -1    4   -1

         [,1]
    [1,]    1
    [2,]    0

         [,1]
    [1,]   -1
    [2,]   -4
    [3,]    0
    
         [,1]
    [1,]    6
    [2,]  -17

         [,1] [,2] [,3]
    [1,]   19   -7  -32
    [2,]   -7    4   14
    [3,]  -32   14   58

         [,1] [,2]
    [1,]    5  -14
    [2,]  -14   59

         [,1] [,2]
    [1,]    2  -23
    [2,]   -3   15
    [3,]   -6   48
    
         [,1] [,2] [,3]
    [1,]    2   -3   -6
    [2,]  -23   15   48

### Inciso v)

**Código:**

    > #v) 
    > C=matrix(c(-2,1,5),1)
    > C
    > 
    > A= matrix(c(-2,1,0,4,1,-2),2)
    > A
    > 
    > b= matrix(c(1,1),2)
    > b
    > 
    > #cov(AX+b,CX+d)
    > covAXC=A%*%varX%*%t(C)
    > covAXC
      > 
    > #cov5(AX+b,DY+e)
    > 
    > D=matrix(c(1,2,4,0,-2,3),3)
    > D
    > e=matrix(c(1,0,-1),3)
    > e
    > 
    > cov5=A%*%covXY%*%t(D)
    > cov5
    > 
    > #vii)varW=var(AX+b)
    > A=matrix(c(1,-1,0,2,-4,0),2)
    > A
    > b=matrix(c(0,-1),2)
    > b
    > 
    > varW=A%*%varX%*%t(A)
    > varW
    > 
    > #Z=CY
    > C=matrix(c(1,0,1,1,1,-1),3)
    > C
    > 
    > #cov(W,Z)=cov(AX+b,CY)=AcovXYt(C)
    > 
    > covWZ=A%*%covXY%*%t(C)
    > covWZ
    > 
    > covZW = t(covWZ)
    > covZW

**Resultado:**

    > #v) 
    > C=matrix(c(-2,1,5),1)
    > C
         [,1] [,2] [,3]
    [1,]   -2    1    5
    > d=8
    > d
    [1] 8
    > 
    > A= matrix(c(-2,1,0,4,1,-2),2)
    > A
         [,1] [,2] [,3]
    [1,]   -2    0    1
    [2,]    1    4   -2
    > 
    > b= matrix(c(1,1),2)
    > b
         [,1]
    [1,]    1
    [2,]    1
    > 
    > #cov(AX+b,CX+d)
    > covAXC=A%*%varX%*%t(C)
    > covAXC
         [,1]
    [1,]   18
    [2,]   37
    > t(C)
         [,1]
    [1,]   -2
    [2,]    1
    [3,]    5
    > 
    > #cov5(AX+b,DY+e)
    > 
    > D=matrix(c(1,2,4,0,-2,3),3)
    > D
         [,1] [,2]
    [1,]    1    0
    [2,]    2   -2
    [3,]    4    3
    > e=matrix(c(1,0,-1),3)
    > e
         [,1]
    [1,]    1
    [2,]    0
    [3,]   -1
    > 
    > cov5=A%*%covXY%*%t(D)
    > cov5
         [,1] [,2] [,3]
    [1,]    0   -2    3
    [2,]   -4   26  -67
    > 
    > #vii)varW=var(AX+b)
    > A=matrix(c(1,-1,0,2,-4,0),2)
    > A
         [,1] [,2] [,3]
    [1,]    1    0   -4
    [2,]   -1    2    0
    > b=matrix(c(0,-1),2)
    > b
         [,1]
    [1,]    0
    [2,]   -1
    > 
    > varW=A%*%varX%*%t(A)
    > varW
         [,1] [,2]
    [1,]   33  -19
    [2,]  -19   21
    > 
    > #Z=CY
    > C=matrix(c(1,0,1,1,1,-1),3)
    > C
         [,1] [,2]
    [1,]    1    1
    [2,]    0    1
    [3,]    1   -1
    > 
    > #cov(W,Z)=cov(AX+b,CY)=AcovXYt(C)
    > 
    > covWZ=A%*%covXY%*%t(C)
    > covWZ
         [,1] [,2] [,3]
    [1,]  -11  -11   11
    [2,]   -9   -7    5
    > 
    > covZW = t(covWZ)
    > covZW
         [,1] [,2]
    [1,]  -11   -9
    [2,]  -11   -7
    [3,]   11    5


Para ejercicios posteriores, los resultados pueden consultarse al ejecutar los archivos R


## Tarea 1: Ejercicio 6.


Este ejercicio consiste en encontrar valores esperados de matrices, dados un vector de medias y su matriz de varianzas.

Para ello utilizamos funciones como:

* Eliminar secciones de una matriz para quedarnos con un renglon:  * ** VarZ2<-VarZ[2,,drop=FALSE] #renglon2 ** *
* Unir matrices en vertical: * ** varZ4<-rbind(VarZ2,VarZ3) #unir vertical ** *
* Tomar un elemento de un vector: * ** EZ[1]^2 ** *

### Inciso i)

Código:


    #inciso i)
    EZ=c(1,0,2) #media de Z
    VarZ=matrix(c(0.8,.4,-.2,.4,1,-.8,-.2,-.8,2),3)
    EZ
    VarZ
    EZ<- as.matrix(EZ,3)
    EZ

    VarY<-VarZ[1]
    VarY
    VarZ2<-VarZ[2,,drop=FALSE] #renglon2
    VarZ2
    VarZ3<-VarZ[3,,drop=FALSE] #renglon3
    VarZ3

    varZ4<-rbind(VarZ2,VarZ3) #unir vertical
    varZ4
    VarZ5<-varZ4[,2, drop=FALSE] #columna2
    VarZ5
    VarZ3<-varZ4[,3,drop=FALSE]#columna 3
    VarZ3
    VarX<- cbind(VarZ5,VarZ3)
    VarX

    VarZ1<-VarZ[1,,drop=FALSE] #renglon2
    VarZ1

    CovYX<-cbind(VarZ1[2],VarZ1[3])
    CovYX

    CovXY<-t(CovYX)
    CovXY


Resultado:

    > EZ=c(1,0,2) #media de Z
    > VarZ=matrix(c(0.8,.4,-.2,.4,1,-.8,-.2,-.8,2),3)
    > EZ
    [1] 1 0 2
    > VarZ
         [,1] [,2] [,3]
    [1,]  0.8  0.4 -0.2
    [2,]  0.4  1.0 -0.8
    [3,] -0.2 -0.8  2.0
    > EZ<- as.matrix(EZ,3)
    > EZ
         [,1]
    [1,]    1
    [2,]    0
    [3,]    2
    > 
    > VarY<-VarZ[1]
    > VarY
    [1] 0.8
    > VarZ2<-VarZ[2,,drop=FALSE] #renglon2
    > VarZ2
         [,1] [,2] [,3]
    [1,]  0.4    1 -0.8
    > VarZ3<-VarZ[3,,drop=FALSE] #renglon3
    > VarZ3
         [,1] [,2] [,3]
    [1,] -0.2 -0.8    2
    > 
    > varZ4<-rbind(VarZ2,VarZ3) #unir vertical
    > varZ4
         [,1] [,2] [,3]
    [1,]  0.4  1.0 -0.8
    [2,] -0.2 -0.8  2.0
    > VarZ5<-varZ4[,2, drop=FALSE] #columna2
    > VarZ5
         [,1]
    [1,]  1.0
    [2,] -0.8
    > VarZ3<-varZ4[,3,drop=FALSE]#columna 3
    > VarZ3
         [,1]
    [1,] -0.8
    [2,]  2.0
    > VarX<- cbind(VarZ5,VarZ3)
    > VarX
         [,1] [,2]
    [1,]  1.0 -0.8
    [2,] -0.8  2.0
    > 
    > VarZ1<-VarZ[1,,drop=FALSE] #renglon2
    > VarZ1
         [,1] [,2] [,3]
    [1,]  0.8  0.4 -0.2
    > 
    > CovYX<-cbind(VarZ1[2],VarZ1[3])
    > CovYX
         [,1] [,2]
    [1,]  0.4 -0.2
    > 
    > CovXY<-t(CovYX)
    > CovXY
         [,1]
    [1,]  0.4
    [2,] -0.2
    > 

### Inciso ii)

    #inciso ii)

    EY2=VarY + EZ[1]^2
    EY2

    #Para E(XXÂ´)

    EX1c=VarX[1]+EZ[2]^2

    EX1X2=VarX[2]+EZ[2]*EZ[3]

    EX2c=VarX[4]+EZ[3]^2

    EXXt= matrix(c(EX1c,EX1X2,EX1X2,EX2c),2)
    EXXt

    #Para E(XÂ´X)

    EXtX=EX1c+EX2c
    EXtX

    #E(YXÂ´)

    EYX1= VarZ[2]+EZ[1]*EZ[2]

    EYX2= VarZ[3]+EZ[1]*EZ[3]

    EYXt <- matrix(c(EYX1,EYX2),1)
    EYXt

    # E(XY)
    EXY <- matrix(c(EYX1,EYX2),2)
    EXY

**Resultado:**

    > EY2=VarY + EZ[1]^2
    > EY2
    [1] 1.8
    > 
    > 
    > #Para E(XXÂ´)
    > 
    > EX1c=VarX[1]+EZ[2]^2
    > 
    > EX1X2=VarX[2]+EZ[2]*EZ[3]
    > 
    > EX2c=VarX[4]+EZ[3]^2
    > 
    > EXXt= matrix(c(EX1c,EX1X2,EX1X2,EX2c),2)
    > EXXt
         [,1] [,2]
    [1,]  1.0 -0.8
    [2,] -0.8  6.0
    > 
    > #Para E(XÂ´X)
    > 
    > EXtX=EX1c+EX2c
    > EXtX
    [1] 7
    > 
    > #E(YXÂ´)
    > 
    > EYX1= VarZ[2]+EZ[1]*EZ[2]
    > 
    > EYX2= VarZ[3]+EZ[1]*EZ[3]
    > 
    > EYXt <- matrix(c(EYX1,EYX2),1)
    > EYXt
         [,1] [,2]
    [1,]  0.4  1.8
    > 
    > # E(XY)
    > EXY <- matrix(c(EYX1,EYX2),2)
    > EXY
         [,1]
    [1,]  0.4
    [2,]  1.8



## Tarea 2: Ejercicio 5.

Consiste en generar funciones para bmco y bmcr para Y y para U.

Para ello introducimos el uso de un nuevo elemento que nos permite generar una especie de rutina de acciones que puede ser llamada cuando sea necesaria y evita programarla cada ocasión, requiere definir unos inputs(entrada de informacion requerida) y definir cual sera el valor que devuelva:

* funciones:  * ** function (inputs) ** * , entre parentesis se inican los argumentos que requiere, * ** {} ** * , entre corchetes las instrucciones y * ** return () ** * indica el valor devuelto.

A continuación se muestran lso códigos generados.
Para ver resultados usar el archivo de R ** Ochoa_PS_T2Ej5.R ** 

### Función de bmco para Y

Código:

    #a) fn para obtener bMCO

    #Funcion  
    # bmco1
    # Input: Matriz X, vector Y de muestra
    # Output: Entrega el bmco de tantos parametros como haya en Xvector incluyendo un termino independiente si X tiene columna de 1s

    bmco1 = function(X,Y){
      XX=t(X)%*%X
      InvXX = solve(XX)
      InvXX
      XtransY = t(X)%*%Y
      XtransY
      b= InvXX%*%XtransY
      return(b)
    }


### Función de bmco para U


Código:

    #Funcion
    #bmco2
    #input: b:vector de valores verdaderos(kx1), X:matriz nxk reales fijos
    #input: u: vector aleat de dim nx1
    #Output: bmco

    bmco2 = function(b,X,U){
      XX=t(X)%*%X
      InvXX = solve(XX)
      bmco=b+InvXX%*%t(X)%*%U
      return(bmco)
    }




### Funcion de bmcr para Y

Código:

    #b) fn para obtener bMCR

    #Funcion para calcular bmcr conociendo bmco

    # bmcr
    # Input: bmco, Matriz X,matriz R, vector r
    #input: bmco: estimador bmco kx1, X:matriz nxk reales fijos
    #input: R: matriz qxk r: vector aleat de dim qx1
    # Output: Entrega el bmcr

    bmcr = function(bmco,X,R,r){
      XX=t(X)%*%X
      InvXX = solve(XX)
      InvRXXR=solve(R%*%InvXX%*%t(R))
      bmcr<-bmco-InvXX%*%t(R)%*%InvRXXR%*%(R%*%bmco-r)
      return(bmcr)
    }


## Tarea 3: Ejercicio 5.

Consiste en generar una muestra de X con n=100




Para ello utilizamos:

*  ** library(MASS) ** Es una librería que nos permite generar muestras aleatorias, integrando los parametrso deseados.
En este caso se especifica en vector de medias y la matriz de varianza.

Código:

    #Tarea 3
    #Ejercicio 5

    #Generar una muestra n=100 

    library(MASS)

    n=100
    mu1<-matrix(c(0,-1),2)
    mu1
    mu2<-matrix(c(-2,0,2),3)
    mu2
    Var1<-matrix(c(1,-1/4,-1/4,1/2),2)
    Var1
    Var2<-matrix(c(1,1/3,-1/2,
                   1/3,1/4,0,
                   -1/2,0,1),3)
    Var2

    Z1sample<-mvrnorm(n,mu1,Var1)
    Z1sample

    Z2sample<-mvrnorm(n,mu2,Var2)
    Z2sample


## Tarea 3: Ejercicio 6.

Consiste en generar una muestra de X con n=200 conforme a los datos indicados en la tarea



Para ello utilizamos:

*  ** library(MASS) ** 

Código:

    #Tarea 3
    #Ejercicio 6

    #Generar una muestra n=200 

    library(MASS)

    mu<-matrix(c(0,0,1,1),4)
    Var1<-matrix(c(1,0,1,0,
                   0,9,0,1,
                   1,0,4,0,
                   0,1,0,9),4)
    n=200

    Z1sample<-mvrnorm(n,mu,Var1)
    Z1sample


## Tarea 4: Ejercicio 4.6

Esta actividad consiste en generar una funcion para U que cumpla con:
Las entradas de está función deben ser  varU (escalar) y n=tamaño de la muestra.
Tambien debe generar X aleatorias.
Despues obtener el bmco para una muestra de n=800



Para ello utilizamos:
* ** Function () **
* **library (MASS) **

El código es:


    library(MASS)

    #Generar funcion para obtener U
    #Funcion
    #ObtU
    #input: varU=sigmaUsq: escalar, n = tamaÃ±o de la muestra
    #output: U:vector 1xn

    ObtU = function(sigmaUsq,n){

      muU=0

      U<-rnorm(n,muU,sqrt(sigmaUsq))
      U<-matrix(U,n)
      nrow(U)
      ncol(U)
      return(U)
    }


    ##Obtener U

    n=800
    U1<-ObtU(0.04,n)
    U1

    #Generar X aleatoria


    muX<-matrix(c(3,0,4,1),4)
    VarX<-matrix(c(3,0,1,0,
                   0,9,0,1,
                   1,0,4,0,
                   0,1,0,2),4)

    Xsample<-mvrnorm(n,muX,VarX)
    Xsample
    nrow(Xsample)
    ncol(Xsample)

    vone<-matrix(1,n,1)
    vone
    DaFrX<-as.data.frame(Xsample)
    # Poniendo nombre a las columnas 
    names(DaFrX) <- c("X1","X2","X3","X4")

    View(DaFrX)

    X<-cbind(vone,DaFrX$X1,DaFrX$X2,DaFrX$X3,DaFrX$X4)
    X
    nrow(X)
    ncol(X)

    bo<-matrix(c(2,0.5,-1.2,3,1),5)
    bo
    #Dividir b valor verdadero en escalares para estimar Yi
    bo0<- bo[1,1]
    bo1<- bo[2,1]
    bo2<- bo[3,1]
    bo3<- bo[4,1]
    bo4<- bo[5,1]  
    bo0
    bo1
    bo2
    bo3
    bo4

    Yj<- bo0+bo1*DaFrX$X1+bo2*DaFrX$X2+bo3*DaFrX$X3+bo4*DaFrX$X4+U1
    Yj<-matrix(Yj,n)
    nrow(Yj)
    ncol(Yj)


    #a) fn para obtener bMCO

    #Funcion  
    # bmco1
    # Input: Matriz X, vector Y de muestra
    # Output: Entrega el bmco de tantos parametros como haya en Xvector incluyendo un termino independiente si X tiene columna de 1s

    bmco1 = function(X,Y){
      XX=t(X)%*%X
      InvXX = solve(XX)
      InvXX
      XtransY = t(X)%*%Y
      XtransY
      b= InvXX%*%XtransY
      return(b)
    }


    #Funcion
    #bmco2
    #input: b:vector de valores verdaderos(kx1), X:matriz nxk reales fijos
    #input: u: vector aleat de dim nx1
    #Output: bmco

    bmco2 = function(b,X,U){
      XX=t(X)%*%X
      InvXX = solve(XX)
      bmco=b+InvXX%*%t(X)%*%U
      return(bmco)
    }

    #Obtener bmco
    #Forma 1

    A1bmco<-bmco1(X,Yj)
    A1bmco

    #Forma 2
    A2bmco<-bmco2(bo,X,U1)
    A2bmco



## Artículo: " * Does pay inequality affect team performance?* " 

Se solicitó replicar el análisis-ejercicio realizado en clase considerando los años 2007-2013, referente aun artículo publicado en <http://rpubs.com/dvorakt/183866> .

Se utilizaron diferentes librerías, que deben instalarse previamente. 
El uso de librerías nos permite manejar de manera más amigable las bases de datos de salarios y juegos ganados, descargar la información de las páginas de internet indicadas.
Al ser R un software abierto, es posible que alguien ya haya construido una herramienta útil para nuestros fines, por lo que conviene visitar la pagina oficial <https://cran.r-project.org/>
El artículo a replicar tiene el proposito de describir la relación que existe entre los salarios pagados y la cantidad de juegos ganados.Se centra en el quintil con pagos más altos de los jugadores y pretende verificar como esto como contribuye a describir las variaciones en los juegos ganados por equipo.

Las librerías utilizadas son:
* **library(XML)**
* **library(dplyr)**
* **library(tidyr)**
* **library(httr)**
* **library(ggplot2)**
* **library(stargazer)**


Del sitio  <http://www.usatoday.com/sports/mlb/salaries/2007/player/all/#card_full_width_main> se obtienen los datos y se generan bases de datos por año:
    #1. Retrieving data 2007 - 2013

    sal2007 <- GET("http://www.usatoday.com/sports/mlb/salaries/2007/player/all/#card_full_width_main")
    sal2007 <- readHTMLTable(rawToChar(sal2007$content))[[1]]

    View(sal2007)

    sal2008 <- GET("http://www.usatoday.com/sports/mlb/salaries/2008/player/all/#card_full_width_main")
    sal2008 <- readHTMLTable(rawToChar(sal2008$content))[[1]]

    sal2009 <- GET("http://www.usatoday.com/sports/mlb/salaries/2009/player/all/#card_full_width_main")
    sal2009 <- readHTMLTable(rawToChar(sal2009$content))[[1]]

    # problema con este aÃ±o
    #sal2015 <- GET("/MLBSalaries2015.html")
    #sal2015 <- readHTMLTable("MLBSalaries2015.html")[[1]]

    sal2010 <- GET("http://www.usatoday.com/sports/mlb/salaries/201/player/all/#card_full_width_main")
    sal2010 <- readHTMLTable(rawToChar(sal2010$content))[[1]]

    sal2011 <- GET("http://www.usatoday.com/sports/mlb/salaries/2011/player/all/#card_full_width_main")
    sal2011 <- readHTMLTable(rawToChar(sal2011$content))[[1]]

    sal2012 <- GET("http://www.usatoday.com/sports/mlb/salaries/2012/player/all/#card_full_width_main")
    sal2012 <- readHTMLTable(rawToChar(sal2012$content))[[1]]

    sal2013 <- GET("http://www.usatoday.com/sports/mlb/salaries/2013/player/all/#card_full_width_main")
    sal2013 <- readHTMLTable(rawToChar(sal2013$content))[[1]]

Se genera la variable año y se asigna a cada base de datos

    sal2007$year <- 2007
    sal2008$year <- 2008
    sal2009$year <- 2009
    sal2010$year <- 2010
    sal2011$year <- 2011
    sal2012$year <- 2012
    sal2013$year <- 2013

Luego se unen las bases de datos, y se escribe un archivo ** *.csv ** como respaldo. Se elimina la columna rango

    #Notar que las bases tienen el mismo número de observaciones, las podemos unir en una sola base

    # Now we can append the four data frames. We should drop the rank variable which was not read from the website.
    salaries <- bind_rows(sal2013,sal2013,sal2012,sal2011,sal2010,sal2009,sal2008,sal2007)
    salaries <- select(salaries, -rank) #quitamos rank

    #Select quita variable rango

    write.csv(salaries, "salaries1.csv", row.names = FALSE)   #genera csv

    # Hasta aquí hemos escrito nuestra nueva base de datos


Luego, se seleccionan las variables que nos interesan * "salaries, year, Salary, Name, Team" * y las ponemos en formato adecuado, númerico.
Se organizan y ordenan por salario de menor a mayor y pedimos que muestre los más altos y más bajos. Filtramos * NAS *.

    # ------------------
    # 2. Selecting observations and variables
    salaries <- read.csv("salaries1.csv")

    salaries <- select(salaries, year, Salary, Name, Team)
    str(salaries) #Ahora todos son strings

    # Se observa que el salario tiene el signo de dolares y comas, eliminemos esos caracteres
    # We also see that Salary is a character with dollar signs and commas. 
    #Letâs strip all the punctuation from Salary, and turn it into a numerical variable.

    salaries$Salary <- as.numeric(gsub("[[:punct:]]","",salaries$Salary)) #punct quita signo $, se vuelve numero
    summary(salaries$Salary)

    # Los ceros son sospechosos

    salaries <- arrange(salaries, Salary) #ordena la base de datos por la var salarios, de menor a mayor
    head(salaries, n=5) #tomamos primeeros 5
    tail(salaries, n=5)

    salaries <- filter(salaries, Salary != 0) #Filtramos los que no son ceros
    salaries <- arrange(salaries, Salary)
    head(salaries, n=5)

Se crean grupos y la variable percentil en el dataframe

    # ------------------
    # Aggregating by groups

    # Se acomodan por quintiles
    salaries <- salaries %>% group_by(year, Team ) %>% mutate(payroll=sum(Salary), pctile=ntile(Salary,5)) #agrega el payroll y asigna percentile dividiendo en 5
    salaries <- arrange(salaries, Salary) #ordena de menor a mayor
    head(salaries, n=3)
    View(salaries)
    # Nos quedamos con el quintil mÃ¡s alto #el numero 5
    salaries <- filter(salaries, pctile==5)
    salaries <- arrange(salaries, Salary)
    head(salaries, n=3)

    # Since now we only have players in the top 20% we can aggregate/summarize the data by year and Team.
    salaries <- salaries %>% group_by(year, Team, payroll) %>% summarize(top20=sum(Salary)) #agrupamos por año,equipo y nomina
    salaries$top20share <- salaries$top20/salaries$payroll*100 #este resumen se llamará top20

Se expresa el salario en millones y se ordena "arrange"


    # Let's put payroll in millions rather than dollars. It will make the magnitude of our regression coefficients easier to read. 
    # Let's also check some descriptive statistics on top20share.
    salaries$payroll <- salaries$payroll/1000000  #el salario lo ponemos en $ en millones USD
    summary(salaries)

    salaries <- arrange(salaries, top20share) #ordenar de menor a mayor el top20 por salario
    head(salaries, n=3)
    tail(salaries, n=3)
    # Convertimos la variable Team en string
    salaries$Team <- as.character(salaries$Team) #se vuelve caracter
    #This is because the performance data may have different set of teams which means that factor levels may not match.

La siguiente etapa del análisis consiste en  analizar partidos ganados tomados de la pagina <http://www.baseball-reference.com/leagues/MLB/#teams_team_wins3000::none>. Se procesa la información


    teamwins <- GET("http://www.baseball-reference.com/leagues/MLB/#teams_team_wins3000::none")
    teamwins <- readHTMLTable(rawToChar(teamwins$content), stringsAsFactors = FALSE)[[1]]
    str(teamwins)


    write.csv(teamwins, "teamwins.csv", row.names = FALSE)
    teamwins <- read.csv("teamwins.csv",stringsAsFactors = FALSE)

    # quedandonos sÃ³lo con lo que nos sirve
    teamwins$Year <- as.numeric(teamwins$Year)
    teamwins <- filter(teamwins, !is.na(teamwins$Year)) #quita NAS

    #Nos quedaremos sÃ³lo con los datos de 2007 en adelante
    teamwins <- filter(teamwins, Year>2006)

    #Nos quedaremos sÃ³lo con los datos hasta 2013 en adelante
    teamwins <- filter(teamwins, Year<2014)

Reacomodar los datos

    # ---------------------------------------------------
    # Reacomodando los datos

    # Primero generamos una variable year_games que colapsa aÃ±os y juegos
    teamwins <- unite(teamwins, year_games, Year, G)

    # Usamos gather para generar teamwins2 y  colapsar columnas de juegos ganados por cada team por año

    teamwins2 <- gather(data=teamwins, value=wins, key=team, ARI,ATL,BLA,BAL,BOS,CHC,CHW,CIN,CLE,COL,DET,HOU,KCR,LAA,LAD,MIA,MIL,MIN,NYM,NYY,OAK,PHI,PIT,SDP,SFG,SEA,STL,TBR,TEX,TOR,WSN)
    head(teamwins2)

    # Nuevamente separamos aÃ±os y juegos
    teamwins2 <- separate(teamwins2,year_games, c("year", "games"))
    head(teamwins2)
    str(teamwins2)

    # Convertimos algunas a numÃ©ricas

    teamwins2$games <- as.numeric(teamwins2$games)
    teamwins2$wins <- as.numeric(teamwins2$wins)
    teamwins2$year <- as.numeric(teamwins2$year)

    # Creamos variable para Obtener el porcentaje de ganados
    teamwins2$pctwin <- teamwins2$wins/teamwins2$games*100
    teamwins2 <- arrange(teamwins2,pctwin)

    # Vemos estadísticos, top y bottom 
    summary(teamwins2)
    head(teamwins2)
    tail(teamwins2)

    # Tenemos algunos NA

    teamwins2 <- filter(teamwins2, !is.na(pctwin)) #filtrar nas
    tail(teamwins2)
    
Antes de hacer * "merge" * con las bases verificamos que los nombres de los equipos sean iguales:

    #Primero tenemos que homologar los cÃ³digos
    salaries$Team[salaries$Team=="SF"] = "SFG"
    salaries$Team[salaries$Team=="KC"] = "KCR"
    salaries$Team[salaries$Team=="SD"] = "SDP"
    salaries$Team[salaries$Team=="TB"] = "TBR"

    salaries$Team[salaries$Team=="WSH"] = "WSN"
    salaries$Team[salaries$Team=="CWS"] = "CHW"

    # Homologando el nombre de la columna a Team para que coincida con el de salaries
    teamwins2$Team <- as.character(teamwins2$team) #ahora tenemos 2 columnas team y Team
    teamwins2 <- select(teamwins2, -team) #quitamos team
    
Se unen las bases 

    # Combinamos/Mergeamos las 2 bases por year y Team usando comando "inner_joint"
    merged <- inner_join(teamwins2, salaries,by=c("year", "Team")) #Unen por año y por equipo, nos quedamos con 8 variables que son las que se traslapan
    summary(merged)

Se grafica la información para observar la dispersión

    library(ggplot2)
    ggplot(data=merged, aes(x=payroll,y=pctwin, label=Team, color=as.factor(year)))+ geom_text(size=3) +
      ggtitle("Payroll and performance of MLB teams, 2007-2013") + 
      xlab("Payroll in millions") + ylab("Percent of games won") +
      scale_color_discrete(name="year") + theme_minimal()
Y se obtiene:

![alt text](img/Payroll and performance MLB 2007-2013.png )



Al observar la gráfica se puede interpretar que un mayor payroll no asegura tener mayor porcentaje de partidos ganados. Como un ejemplo podemos indicar NYY (verde) y PHI (azul), que son equipos con mayor porcentaje de partidos ganados aunque se caracterizan por no contar con un alto payroll. Y por otra parte, se tienen equipos como SFG y BOS con mayor payroll pero no son los equipos con mayor porcentaje de partidos ganados.


Grafiquemos salarios y juegos ganados


    ggplot(data=merged, aes(x=top20share,y=pctwin, label=Team, color=as.factor(year))) + geom_text(size=3) +
      ggtitle("Team inequality and performance of MLB teams, 2007-2013") + 
      xlab("Share of payroll earned by top 20%") + ylab("Percent of games won") +
      scale_color_discrete(name="year") + theme_minimal()
      
Se obtiene

![alt text](img/Team inequality and performance MLB 2007-2013.png )



La gráfica muestra para este periodo que la concentración del ingreso en el primer quintil no está relacionada con el porcentaje de partidos ganados. Se puede observar que equipos como  PHI (azul) y NYY (verde) tienen menor desigualdad en la distribución del payroll y mayor porcentaje de partidos ganados. 
Parece más conveniente la opción para los equipos tratando tener una distribución más estable del payroll en el equipo.


Finalmente, se realiza la regresión con las variables de interes.


    library(stargazer)

    # El paquete stargazer crea tablas para html, latex i ascii bien formateadas.
    m1 <- lm(pctwin ~ top20share, data=merged) #Regresion (Y-X, Database)
    m2 <- lm(pctwin ~ top20share + payroll, data=merged)
    m3 <- lm(pctwin ~ top20share + log(payroll) , data=merged)

    stargazer(m1,m2,m3, type="text")
    
Se generan los siguientes resultados:


    ======================================================================================
                                               Dependent variable:                        
                        ------------------------------------------------------------------
                                                      pctwin                              
                                 (1)                    (2)                   (3)         
    --------------------------------------------------------------------------------------
    top20share                 0.196***              0.204***              0.209***       
                               (0.069)                (0.071)               (0.072)       

    payroll                                            0.003                              
                                                      (0.007)                             

    log(payroll)                                                             0.744        
                                                                            (1.162)       

    Constant                  37.716***              36.737***             33.207***      
                               (4.277)                (4.827)               (8.240)       

    --------------------------------------------------------------------------------------
    Observations                 210                    210                   210         
    R2                          0.038                  0.038                 0.039        
    Adjusted R2                 0.033                  0.029                 0.030        
    Residual Std. Error    6.702 (df = 208)      6.715 (df = 207)      6.712 (df = 207)   
    F Statistic         8.105*** (df = 1; 208) 4.134** (df = 2; 207) 4.246** (df = 2; 207)
    ======================================================================================
    Note:                                                      *p<0.1; **p<0.05; ***p<0.01
    > 
    
    
### Interpretación de resultados

El paquete * stargazer * genera la tabla de resultados anterior.
En los resultados se observa que se efectuan regresiones para variables de nivel en un caso * (payroll) * y en otro caso para generar un coeficiente de semielasticidad *ln(payroll) *.

Estos modelos pretenden describir la relación existente entre las variables * pctwin * porcentaje de juegos ganados, * top20share * el quintil de mayor salario en los jugadores, * payroll * salarios y * log(payroll) *, logaritmo natural de salarios.

Los tres modelos que fueron generados son:

 1. m1 <- lm(pctwin ~ top20share, data=merged) #Regresion (Y-X, Database)
 1. m2 <- lm(pctwin ~ top20share + payroll, data=merged)
 1.  m3 <- lm(pctwin ~ top20share + log(payroll) , data=merged)

La tabla de resultados (mostrada previamente) indica que los parámetros para el primer modelo son estadísticamente significativos. En cambio, en el segundo y último modelo, las variables *payroll* y *log(payroll)* son estadíticamente no significativos, respectivamente. En cuanto a los valores de R<sup>2</sup> se observan valores muy bajos. Esto indica que los parámetros obtenidos de la regresión explican muy poco del comportamiento de la variable dependiente que se desea explicar "juegos ganados".
En cuanto al valor de los estadísticos F , se obtuvieron estadísticamente significativos al nivel de significancia de 0.01, 0.01, 0,05 y 0.01, lo que indica que los datos se encuentran bien explicados.

Respecto a los parámetros de los modelos se puede decir que en el 1er modelo, el cambio en *top20share* durante el periodo estuvo asociado a un cambio positivo en el porcentaje de partidos ganados. En cambio, en los otros dos modelos (Modelo 2 y 3) aunque agregan más variables explicativas o independientes, el valor de los coeficientes asociados obtenido de las regresiones no muestra significancia estadística. Esto implica que los modelos 2 y 3 pueden considerarse como modelos explicados por la variable *top20share*. 

Esto nos permite concluir que, la variable *top20share* permite describir con niveles de confianza adecuados, una pequeña parte de la variación de de los juegos ganados por equipo.
Así que si se desea explicar una mayor proporción de los cambios en esta variable, se recomienda buscar/encontrar otras variables explicativas para tener una mejor descripción del porcentaje de partidos ganados.


