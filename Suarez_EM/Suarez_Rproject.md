
---
EL COLEGIO DE MÉXICO
MAESTRÍA EN ECONOMÍA. PROMOCIÓN 2017-2019

---


#                                   **Laboratorio de Econometría I**
##                           *Impartido por Humberto Martínez García*

---
#
#                                     **Proyecto final**
#                                  *Evelyn Magali Suárez Reyes*
&nbsp;

---
# Índice
* Descripción del trabajo
* Ejercicio 4 de la tarea 1
* Ejercicio 6 de la tarea 1
* Ejercicio 5 de la tarea 2
* Ejercicio 5 de la tarea 3
* Ejercicio 6 de la tarea 3
* Réplica del ejercicio de beisbol

&nbsp;

#############################################################################################
##
#   Descripción del trabajo.
##
#############################################################################################

En el siguiente trabajo se encuentran algunos ejercicios de las tareas del curso Econometría I replicados con ayuda
del software R-Studio, con el fin de documentar el conocimiento aprendido durante las sesiones de R en el laboratorio de 
este mismo cuso. Estos ejercicios son: el ejercicio 4 de la tarea 1,
ejercicio 6 de la tarea 1, ejercicio 5 de la tarea 2, ejercicio 5 de la tarea 3 y ejercicio 6 de la tarea 3. Además de estos ejercicios,
en el laboratorio de 27 de abril hicimos un ejercicio sobre los salarios de jugadores de las grandes ligas de beisbol en Estados Unidos y la eficiencia de los equipos, basados en este trabajo, en la última parte se realiza una réplica para los años de 2005 a 2011.

#############################################################################################
##
#   Tarea 1. Ejercicio 4.
##
#############################################################################################



## Se tiene que X es un vector aleatorio de dimensión 3 y Y un vector aleatorio de dimensión 2.

Utilizando los datos del ejercicio definimos los valores esperados, varianzas y covarianzas de las variables aleatorias de los vectores.  

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


### Utilizando propiedades de valor esperado sabemos que E(AX+b)=A*E(X)+b
    E2=A%*%EX+b
    E2
          [,1]
    [1,]    2
    [2,]  -17


### Utilizando propiedades de la covarianza sabemos que E(AX+b)=A'*var(X)*A

    V2=(A)%*%varX%*%t(A)
    V2
          [,1] [,2]
    [1,]    6   10
    [2,]   10   33
        
## iv) Calcular E(U), E(V), var(U), var(V), cov(U,V) y cov(V,U)

### Primero definamos U y V. Veamos que U=U1*X+u y V=V1*X+v

    U1=t(matrix(c(1,0,-3,0,1,0,0,2,3),3))
    u=c(2,0,5)
    V1=t(matrix(c(1,-1,1,-1,4,-1),3))
    v=c(1,0)


### E(U)

    EU=U1%*%EX+u
    EU
          [,1]
    [1,]   -1
    [2,]   -4
    [3,]    0

### E(V)

    EV=V1%*%EX+v
    EV
          [,1]
    [1,]    6
    [2,]  -17
    

### var(U)

    varU=(U1)%*%varX%*%t(U1)
    varU
         [,1] [,2] [,3]
    [1,]   19   -7  -32
    [2,]   -7    4   14
    [3,]  -32   14   58

### var(V)

    varV=V1%*%varX%*%t(V1)
    varV
          [,1] [,2]
    [1,]    5  -14
    [2,]  -14   59

### cov(U,V). Sabemos que la cov(U1X+u,V1X+v)=U1*var(X)*V1'

    covUV=U1%*%varX%*%t(V1)
    covUV
           [,1] [,2]
    [1,]    2  -23
    [2,]   -3   15
    [3,]   -6   48

###cov(V,U)

    covVU=t(covUV)
    covVU
          [,1] [,2] [,3]
    [1,]    2   -3   -6
    [2,]  -23   15   48


##  v) Calcular cov(AX+b,CX+d)

### Primero definamos C y d

    C=t(c(-2,1,5))
    d=8

### Calculemos cov(AX+b,CX+d)=A*var(X)*C'=:cov1

    cov1=A%*%varX%*%t(C)
    cov1
          [,1]
    [1,]   18
    [2,]   37

## vi) Calcular la var(W). W=W1*X+w

### Definamos W

    W1=t(matrix(c(1,0,-4,1,2,0),3))
    w=c(0,-1)

### var(W)

    varW=W1%*%varX%*%t(W1)
    varW
          [,1] [,2]
    [1,]   33  -17
    [2,]  -17   13

## vii) Calcular cov(W,Z) y cov(Z,W)

### Definamos Z=Z1*Y

    Z1=t(matrix(c(1,1,0,1,1,-1),2))

### Calculamos  cov(W,Z)

    covWZ=W1%*%covYX%*%t(Z1)
    covWZ
          [,1] [,2] [,3]
    [1,]  -11  -11   11
    [2,]   -7   -5    3

### Calculamos  cov(Z,W)

    covZW=Z1%*%covXY%*%t(W1)
    covZW
    
           [,1] [,2]
     [1,]  -11   -7
     [2,]  -11   -5
     [3,]   11    3

&nbsp;

#############################################################################################
##
##   Tarea 1. Ejercicio 6.
##
#############################################################################################
#
## i) Encontrar var(Y), var(X), cov(Y,X) y cov(X,Y), dado que z=(Y,X1,X2)' X=(X1,X2)'
### Definamos E(Z) y var(Z)

    EZ=c(1,0,2)
    varZ=t(matrix(c(0.8,0.4, -0.2,0.4,1.0,-0.8,-0.2,-0.8,2.0 ),3))

### Como Y=(1,0,0)'*Z entonces EY=(1,0,0)'*EZ.

    A=t(c(1,0,0))
    EY=A%*%EZ
    EY
          [,1]
    [1,]    1

### Como X=B*Z entonces E(X)=B*E(Z).

    B=t(matrix(c(0,1,0,0,0,1),3))
    EX=B%*%EZ
    EX
          [,1]
    [1,]    0
    [2,]    2

### var(Y)

    varY=A%*%varZ%*%t(A)
    varY
         [,1]
    [1,]  0.8

### var(X)

    varX=B%*%varZ%*%t(B)
    varX
         [,1] [,2]
    [1,]  1.0 -0.8
    [2,] -0.8  2.0

### cov(X,Y). Por propiedades de covarianza tenemos que cov(X,Y)=A*var(Z)*B'

    covXY=A%*%varZ%*%t(B)
    covXY
         [,1] [,2]
    [1,]  0.4 -0.2

### cov(Y,X). Por propiedades de covarianza tenemos que cov(Y,X)=B*var(Z)*A'

    covYX=B%*%varZ%*%t(A)
    covYX
         [,1]
    [1,]  0.4
    [2,] -0.2

## ii) Calcular E(Y^2), E(X'X), E(YX') y E(XY)

### E(Y^2). Como var(Y)=E(Y^2)-E(Y)^2 entonces E(Y^2)=var(Y)+E(Y)^2

    EY2=varY+(EY)%*%(EY)
    EY2
    [1] 1.8

### E(X'X). Como var(X)=E(X'X)-E(X)E(X)' entonces E(X'X)=var(X)+E(X)E(X)'

    EXX=varX+EX%*%t(EX)
    EXX
         [,1] [,2]
    [1,]  1.0 -0.8
    [2,] -0.8  6.0
    

### E(XX'). Como var(X')=var(X)=E(XX')-E(X')E(X) entonces E(XX')=var(X)+E(X)'E(X)

    EXXt=varX+t(EX)%*%EX
    EXXt
         [,1] [,2]
    [1,]  1.0 -0.8
    [2,] -0.8  6.0


&nbsp;

#############################################################################################
##
##   Tarea 2. Ejercicio 5.
##
#############################################################################################
#
## Sea X una matriz nxk de número reales fijos, b un vector de dimensión k de números reales fijos, U un vector aleatorio de dimensión n con E(U)=0 var(U)=sigma^2*I  y Rb=r. Generar funciones para b_MCO, b_MCR.

### Función para obtener el vector de coeficientes por mínimos cuadrados ordianrios 

    library(MASS)
    MCO = function(x,y){
      X=x
      Y=y
      xr=nrow(X)
      yr=nrow(Y)
      if(xr==yr){
        b=solve(t(X)%*%X)%*%t(X)%*%Y
        return(b)
      } else {
        print("No se puede llevar a cabo la operación, verifique las dimensiones de las matrices.")
      }
    }

Ejemplo para ver lo que realiza la función MCO 

    A=matrix(c(2,2,2,2,2,2,3,4,5,10,2,4),4)
    B=matrix(c(0,1,1,3),4)
    MCO(A,B)
         [,1]
    [1,] -2.1
    [2,]  1.6
    [3,]  0.2
  Ejemplo para ver cuando las dimensiones no son las correctas.
     
     C=matrix(c(1,1,1,1,1,1,1,1,1),ncol=3)
     MCO(A,C)
     "No se puede llevar a cabo la operación, verifique las dimensiones de las matrices."
### Función para el estimador de coeficientes en mínimos cuadrados restringidos

    MCR=function(X,Y,R,r){

      Yr=nrow(Y)
      Rc=ncol(R)
      Rr=nrow(R)
      rc=ncol(r)
      rr=nrow(r)

      Xr=nrow(X)
      X=cbind(rep(1,Xr),X)
      Xc=ncol(X)
      if (Xr==Yr & Rc==Xc & Rr==rr){
        b=solve(t(X)%*%X)%*%t(X)%*%Y
        b-solve(t(X)%*%X)%*%t(R)%*%solve(R%*%solve(t(X)%*%X)%*%t(R))%*%(R%*%b-r)
      }

      else{ print("No se puede llevar acabo la operación, definir los valores de X, Y, R y r como matrices y verificar dimensiones de éstas. Además recuerda que el número de columnas de x más uno es igual a las de r")

        if (Xr!=Yr){ print("La operación no se puede llevar acabo, verifica que las dimensiones de X y Y sean correctas (no olvides que el número de filas de X es igual al número de filas de Y")}
        if (Rc!=Xc) { print("La operación no se puede llevar acabo, verifica que las dimensiones de R y X sean correctas (no olvides que el número de columnas de R es igual al número de columnas de X más 1)")}
        if (Rr!=rr) { print("La operación no se puede llevar acabo, verifica que las dimensiones de R y r sean correctas (no olvides que el número de filas de R es igual al número de filas de r")}
      }}

Ejemplo para ver el resultado de la función MCR

    X=matrix(c(1,0,0,1,1,0),ncol=2)
    Y=matrix(c(1,0,0),ncol=1)
    R=matrix(c(1,1,1),ncol=3)
    r=matrix(c(1),,ncol=1)

    MCR(X,Y,R,r)
         [,1]
    [1,]    0
    [2,]    1
    [3,]    0
    



Ejemplo para ver cuando las dimensiones de la matríz son incorrectas

    X=matrix(c(1,0,0,0,1,0,0,0,1),ncol=3)
    Y=matrix(c(1,0,2),ncol=1)
    R=matrix(c(1,1,1,1,1,1,1,1),ncol=2)
    r=matrix(c(1,1,1),ncol=1)

    MCR(X,Y,R,r)
        [1] "No se puede llevar acabo la operación, definir los valores de X, Y, R y r como matrices y verificar dimensiones de éstas. Además recuerda que el número de columnas de x más uno es igual a las de r"
        [1] "La operación no se puede llevar acabo, verifica que las dimensiones de R y X sean correctas (no olvides que el número de columnas de R es igual al número de columnas de X más 1)"
        [1] "La operación no se puede llevar acabo, verifica que las dimensiones de R y r sean correctas (no olvides que el número de filas de R es igual al número de filas de r"
        
&nbsp;

#############################################################################################
##
##   Tarea 3. Ejercicio 5.
##
#############################################################################################

## Sea X=(X1,X2)', donde X1 tiene una distribución normal con media m1 y varianza s1 y X2 un vector con districución normal con varianza s2 y media m2 independientes. Generar una muestra aleatoria para X de tamaño 100,

Utilizaremos la siguiente libreria

    library(MASS)

Primero definamos las medias y las varianzas de X1 y X2

    m1=c(0,-1)
    m2=c(-2,0,2)
    s1=matrix(c(1,-.25,-.25,.5),2)
    s2=matrix(c(1,1/3,-1/2,1/3,1/4,0,-.5,0,1),3)

Por una proposición vista en clase, savemos que si dos vectores se distribuyen normal
y son independiente en tonces el vector conformado por estos dos vectores, 
 también se distribuye normal con media m=(m1,m2) y varianza con renglones (s1,0) y (0,s2)
 Así que utilizando esto, escribimos la media de X (m) y la varianza de X (s).

    m=c(m1,m2)
    fs=cbind(s1,matrix(c(rep(0)),ncol=3,nrow=2))
    ss=cbind(matrix(c(rep(0)),ncol=2,nrow=3),s2)
    s=rbind(fs,ss)

Generando una muestra para la matriz X de tamaño 100

    x=mvrnorm(800,m,s)

&nbsp;

#############################################################################################
##
##   Tarea 3. Ejercicio 6.
##
#############################################################################################
## Sea X=(X1,X2,X3,X4) un vector aleatorio que se distribuye normal con media m y varianza s. ¿ Cuál es la distribución del vector (X3,X2,X4,X5)?. Generé una muestra aleatoria de tamaño 200. 

Primero definamos la media y varianza de X y generemos la muestra aleatoria necesaria.

      mx=c(0,0,1,1)
      sx=matrix(c(1,0,1,0,0,9,0,1,1,0,4,0,0,1,0,9),nrow=4)
      X=mvrnorm(200,m,s)
      A=matrix(c(0,0,0,1,0,1,0,0,1,0,0,0,0,0,1,0),nrow=4)

   Veamos que Y=(X3,X2,X4,X5)=Ax(X1,X2,X3,X4)', así que por una proposición sabemos que 
   tiene distribución normal con varianza sy=A*sx*A'  y media my=S*mx,
        
            Y=A%*%t(X)
            my=A%*%mx
            sy=A%*%sx%*%t(A)
      
   
   &nbsp;


#############################################################################################
##
##   Réplica del ejercicio de beisbol
##
#############################################################################################
 Replica el ejercicio realizado en el laboratorio de econometría de la fecha 27 de abril,
desigualdad del pago en salarios sobre porcentage de juegos ganados
en las grandes ligas de beísbol. Es necesario instalar los siguiente paquetes y llamar la siguiente librerias:

    install.packages("dplyr")
    install.packages("tidyr")
    install.packages("RCurl")
    install.packages("httr")
    install.packages("ggplot2")
    install.packages("stargazer")
    install.packages("XML")
    library(XML)
    library(dplyr)
    library(tidyr)
    library(httr)

Ahora desde la página de internet extraemos las bases de datos sobre los salarios de los jugadores

    sal2010 <- GET("http://www.usatoday.com/sports/mlb/salaries/2010/player/all/#card_full_width_main")
    sal2010 <- readHTMLTable(rawToChar(sal2010$content))[[1]]

    sal2009 <- GET("http://www.usatoday.com/sports/mlb/salaries/2009/player/all/#card_full_width_main")
    sal2009 <- readHTMLTable(rawToChar(sal2009$content))[[1]]

    sal2008 <- GET("http://www.usatoday.com/sports/mlb/salaries/2008/player/all/#card_full_width_main")
    sal2008 <- readHTMLTable(rawToChar(sal2008$content))[[1]]

    sal2007 <- GET("http://www.usatoday.com/sports/mlb/salaries/2007/player/all/#card_full_width_main")
    sal2007 <- readHTMLTable(rawToChar(sal2007$content))[[1]]

    sal2006 <- GET("http://www.usatoday.com/sports/mlb/salaries/2006/player/all/#card_full_width_main")
    sal2006 <- readHTMLTable(rawToChar(sal2006$content))[[1]]

    sal2005 <- GET("http://www.usatoday.com/sports/mlb/salaries/2005/player/all/#card_full_width_main")
    sal2005 <- readHTMLTable(rawToChar(sal2005$content))[[1]]


Es necesario asignar el año correspondiente a cada variable
juntar las bases homologar el rango y guardar la base de datos.

    sal2010$year <- 2010
    sal2009$year <- 2009
    sal2008$year <- 2008
    sal2007$year <- 2007
    sal2006$year <- 2006
    sal2005$year <- 2005

    salaries <- bind_rows(sal2010,sal2009,sal2008,sal2007,sal2006,sal2005)
    salaries <- select(salaries, -rank)

    write.csv(salaries, "salaries.csv", row.names = FALSE)


Ahora de la base de datos guardada, la leemos y nos quedamos con las variables necesarias, la función str nos permite ver una descripción d elas variabales.

    salaries <- read.csv("salaries.csv")

    salaries <- select(salaries, year, Salary, Name, Team)
    str(salaries)

Dado que Salary es una cadena de carácteres necesitamos convertirlo en numérico. Necesitamos el promedio de los salarios. Además vemos los 5 salarios más
altos y los 5 más bajos

    salaries$Salary <- as.numeric(gsub("[[:punct:]]","",salaries$Salary))
    salaries <- arrange(salaries, Salary)
    head(salaries, n=5)
    tail(salaries, n=5)

Según el salario los agregamos por quintiles de salary y nos quedamos con el quintil más alto, Después los agreagamos por equipo y por año  lo dividimos entre la nomina del equipo y lo ponemos por millones de dolares.

    salaries <- salaries %>% group_by(year, Team ) %>% mutate(payroll=sum(Salary), pctile=ntile(Salary,5))
    salaries <- arrange(salaries, Salary)
    salaries <- filter(salaries, pctile==5)
    salaries <- arrange(salaries, Salary)

    salaries <- salaries %>% group_by(year, Team, payroll) %>% summarize(top20=sum(Salary))
    salaries$top20share <- salaries$top20/salaries$payroll*100 
    salaries$payroll <- salaries$payroll/1000000

    salaries <- arrange(salaries, top20share)
    head(salaries, n=3)
    tail(salaries, n=3)
Convertimos la variable Team en string

    salaries$Team <- as.character(salaries$Team)

Nosotros queremos hacer un análisis de la inversión en los equipos y la eficiencia, ya tenemos los salarios pero necesitamos la eficiencia. Por
eso de la página electrónica siguiente extraemos los datos sobre partidos ganados de los equipos de beísbol en EU.

    teamwins <- GET("http://www.baseball-reference.com/leagues/MLB/#teams_team_wins3000::none")
    teamwins <- readHTMLTable(rawToChar(teamwins$content), stringsAsFactors = FALSE)[[1]]

    write.csv(teamwins, "teamwins.csv", row.names = FALSE)
    teamwins <- read.csv("teamwins.csv",stringsAsFactors = FALSE)

 Guardamos la variables necesarias y los datos necesarios.

    teamwins$Year <- as.numeric(teamwins$Year)
    teamwins <- filter(teamwins, !is.na(teamwins$Year))

    teamwins <- filter(teamwins, Year>2004 & Year<2011)


 Primero generamos una variable year_games que colapsa years y games.
 
    teamwins <- unite(teamwins, year_games, Year, G)

Usamos gather para colapsar columnas de wins por cada erquipo.

    teamwins2 <- gather(data=teamwins, value=wins, key=team, ARI,ATL,BLA,BAL,BOS,CHC,CHW,CIN,CLE,COL,DET,HOU,KCR,LAA,LAD,MIA,MIL,MIN,NYM,NYY,OAK,PHI,PIT,SDP,SFG,SEA,STL,TBR,TEX,TOR,WSN)
    head(teamwins2)

Necesitamos separa las variables year y games. Y convertir las variables necesasrias en numeéricas.
    
    teamwins2 <- separate(teamwins2,year_games, c("year", "games"))

    teamwins2$games <- as.numeric(teamwins2$games)
    teamwins2$wins <- as.numeric(teamwins2$wins)
    teamwins2$year <- as.numeric(teamwins2$year)

Ahora obtengqos el porcentaje de juegos ganados que es la forma en que mediremos la eficiencia de los equipos.

    teamwins2$pctwin <- teamwins2$wins/teamwins2$games*100
    teamwins2 <- arrange(teamwins2,pctwin)

Quitamos los missing de la base.
    
    teamwins2 <- filter(teamwins2, !is.na(pctwin))
    tail(teamwins2)

Ya que los nombrees de los equipo en las bases en algunos caso varian en las bases, es necesario homologarlos para un buen análisis,
así como llamamos de la misma manera las columnas

    salaries$Team[salaries$Team=="SF"] = "SFG"
    salaries$Team[salaries$Team=="KC"] = "KCR"
    salaries$Team[salaries$Team=="SD"] = "SDP"
    salaries$Team[salaries$Team=="TB"] = "TBR"
    salaries$Team[salaries$Team=="WSH"] = "WSN"
    salaries$Team[salaries$Team=="CWS"] = "CHW"

    teamwins2$Team <- as.character(teamwins2$team)
    teamwins2 <- select(teamwins2, -team)

Unimos las bases por año y equipo y guardamaos la base.
   
       merged <- inner_join(teamwins2, salaries, by=c("year","Team"))
        summary(merged)

        write.csv(merged, "database2010_2005.csv", row.names = FALSE)
 
Ahora graficaremos los datos, para esto es necesario llamar la libreria ggplot2.

    library(ggplot2)
    ggplot(data=merged, aes(x=payroll,y=pctwin, label=Team, color=as.factor(year)))+ geom_text(size=3) +
      ggtitle("Payroll and performance of MLB teams, 2010-2005") + 
      xlab("Payroll in millions") + ylab("Percent of games won") +
      scale_color_discrete(name="year") + theme_minimal()

    ggplot(data=merged, aes(x=top20share,y=pctwin, label=Team, color=as.factor(year))) + geom_text(size=3) +
      ggtitle("Team inequality and performance of MLB teams, 2010-2005") + 
      xlab("Share of payroll earned by top 20%") + ylab("Percent of games won") +
      scale_color_discrete(name="year") + theme_minimal()


## Regresión lineal
Llamamos la libreria stargazer ya que esta crea tablas para html, latex, ascii xon un buen  formato.

    library(stargazer)


    m1 <- lm(pctwin ~ top20share, data=merged)
    m2 <- lm(pctwin ~ top20share + payroll, data=merged)
    m3 <- lm(pctwin ~ top20share + log(payroll) , data=merged)

    stargazer(m1,m2,m3, type="text")

Con el último comando se generó la siguiente tabla:

    =======================================================================================
                                                Dependent variable:                        
                        -------------------------------------------------------------------
                                                      pctwin                               
                                (1)                   (2)                     (3)          
    ---------------------------------------------------------------------------------------
    top20share                -0.111                 0.002                  -0.036         
                              (0.072)               (0.070)                 (0.068)        

    payroll                                        0.083***                                
                                                    (0.015)                                

    log(payroll)                                                           6.054***        
                                                                            (1.108)        

    Constant                 56.351***             42.905***               25.748***       
                              (4.269)               (4.585)                 (6.860)        

    ---------------------------------------------------------------------------------------
    Observations                180                   180                     180          
    R2                         0.013                 0.167                   0.155         
    Adjusted R2                0.008                 0.157                   0.146         
    Residual Std. Error  6.438 (df = 178)      5.933 (df = 177)        5.972 (df = 177)    
    F Statistic         2.356 (df = 1; 178) 17.689*** (df = 2; 177) 16.293*** (df = 2; 177)
    =======================================================================================
    Note:                                                       *p<0.1; **p<0.05; ***p<0.01

### Análisis de los modelos:

Haciendo uso de los datos de bases de datos que se encuentran en la página electrónica http://www.usatoday.com/sports/mlb sobre los salarios de las grandes ligas de beisbol en Estados Unidos para los años de 2005 a 2011 y de los datos de la página "http://www.baseball-reference.com/leagues/MLB/#teams_team_wins3000::none" en el cuál obtuvimos el número de partidos ganados por estos mismos equipos en los mismos años; esto con el de hacer un análisis de la inversión en los pagos de los jugadores y la eficiencia de los equipos. Para hacer un buen  análisis se realizaron tres 
regresiones lineales, que a continuación se explican. 

**Modelo (1).** El primer modelo es una regresión lineal de *pctwin* (porcentaje de juegos ganados) contra  *top20share* ( quintil de los salarios más altos de los jugadores). Este modelo permite ver que si en promedio aumenta un millón de dólares el pago se espera que disminuya  0.11 el porcentaje de juegos ganados, auqnue no es estadísticamente significativo. El R^2 es muy pequeño lo que quiere decir que los coeficientes de la regresión explican muy poco del comportamiento de los juegos ganados, además en conjunto las variables no son significativas, pues el estadístico F no es significativo.

&nbsp;

**Modelo (2).** El segundo modelo es una regresión lineal de *pctwin* (porcentaje de juegos ganados) contra  *top20share* ( quintil de los salarios más altos de los jugadores) y *payroll* (salarios). Analaizando los coeficientes vemos que si en promedio aumenta un millón de dólares los salarios más altos de los jugadores se espera que en promedio aumente 0.11 el porcentaje de juegos ganados, aunque no es estadísticamente significativo este coeficiente; además si auemnta un millón los salarios se esera que incremente en promedio 0.083% la cantidad de juegos ganados, el coeficiente es significativo a un nivel de significancia de 0.01. En esste caso el R^2 también es muy pequeño lo que quiere decir que los coeficientes de la regresión explican muy poco del comportamiento de los juegos ganados, pero esta vez en conjunto las variables son significativas, pues el estadístico F es significativo con un nivel de significancia de 0.1.

&nbsp:

**Modelo (3).** El tercer modelo es una regresión lineal de *pctwin* (porcentaje de juegos ganados) contra  *top20share* ( quintil de los salarios más altos de los jugadores) y el logaritmo natural de *payroll* (salarios). Este modelo permite ver que un aumento de un millón de dólares en los salarios más altos de los jugadores se espera que en promedio disminuye 0.036 el porcentaje de juego ganados, pero este coeficiente no es significativo, en cambio, con 99% de confianza un aumento  de un punto porcentual de los salarios del equipo se espera que aumente 6% el porcentaje de juego ganados. Al igual que los anteriores  el R^2 también es muy pequeño lo que quiere decir que los coeficientes de la regresión explican muy poco del comportamiento de los juegos ganados, y en conjunto las variables son significativas, pues el estadístico F es significativo con un nivel de significancia de 0.1.

Es dificil decidir cuál es el mejor modelo ya que si bien el segundo y el tercero tienen un estadístico F significativo los coeficiente varian de signo cuando se hacen variaciones en las variables explicativas. 



