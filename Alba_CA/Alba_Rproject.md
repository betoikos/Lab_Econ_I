# Ejercicio 1.4

### Valores esperados de las variables aleatorias

    Ex1=0
    Ex2=-4
    Ex3=1
    Ey1=-1
    Ey2=4

### Varianzas y covarianzas de las variables aleatorias

    Varx1=1
    Varx2=4
    Varx3=2
    Vary1=1
    Vary2=9

    Covx1x2=-1
    Covx1x3=0
    Covx1y1=0
    Covx1y2=1
    Covx2x3=2
    Covx2y1=-1
    Covx2y2=-3
    Covx3y1=0
    Covx3y2=3
    Covy1y2=-2

## I

### Matriz de valores esperados de X

    EX=matrix(c(Ex1,Ex2,Ex3),3)
    EX

### Matriz de varianzas y covarianzas de X

    VarX=matrix(c(Varx1,Covx1x2,Covx1x3,Covx1x2,Varx2,Covx2x3,Covx1x3,Covx2x3,Varx3),byrow=T,nrow=3)
    VarX

### Matriz de valores esperados de Y

    EY=matrix(c(Ey1,Ey2),2)
    EY

### Matriz de varianzas y covarianzas de Y

    VarY=matrix(c(Vary1,Covy1y2,Covy1y2,Vary2),byrow=T,nrow=2)
    VarY

### Matriz de covarianzas de X,Y

    CovXY=matrix(c(Covx1y1,Covx1y2,Covx2y1,Covx2y2,Covx3y1,Covx3y2),byrow=T,nrow=3)
    CovXY

    CovYX=t(CovXY)
    CovYX

## II

### Vector de constantes

    a=matrix(c(-1, 3/2,-4),nrow=3)
    a


### E(aX)

    EaX=a*EX
    EaX

    VaraX= t(a)%*%VarX%*%a
    VaraX

## III

    A=matrix(c(-2,0,1,1,4,-2),byrow=T,nrow=2)
    A

    b=matrix(c(1,1),nrow=2)
    b


### Sea Z=AX+b

    EZ=(A%*%EX)+b
    EZ

    VarZ=A%*%VarX%*%t(A)
    VarZ

## IV

    U1=matrix(c(1,0,-3,0,1,0,0,2,3),byrow=T,nrow=3)
    U1

    u=matrix(c(2,0,5),nrow=3)
    u

    V1=matrix(c(1,-1,1,-1,4,-1),byrow=T,nrow=2)
    V1

    v=matrix(c(1,0),nrow=2)
    v

### E(U)

    EU=(U1%*%EX)+u
    EU

### E(V)

    EV=(V1%*%EX)+v
    v

### Var(U)

    VarU=U1%*%VarX%*%t(U1)
    VarU

### Var(V)

    VarV=V1%*%VarX%*%t(V1)
    VarV

### Cov(U,V)

    CovUV=U1%*%VarX%*%t(V1)
    CovUV

### Cov(V,U)

    CovVU=t(CovUV)
    CovVU

## V

    C=matrix(c(-2,1,5),nrow=3)
    C

    d=8
    d

### Sea Cov(AX+b,Cx+d)=CovW

    CovW=A%*%VarX%*%C
    CovW

## VI

    D=matrix(c(1,0,2,-2,4,3),byrow=T,nrow=3)
    D

    e=matrix(c(1,0,-1),nrow=3)
    e

### Sea Cov(AX+b,Dy+e)=CovP

    CovP=A%*%CovXY%*%t(D)
    CovP

## VII

    N1=matrix(c(-1,0,-4,1,2,-1),byrow=T,nrow=2)
    N1

    VarN1X=N1%*%VarX%*%t(N1)
    VarN1X

## VIII

    W1=matrix(c(-1,0,-4,1,2,-1),byrow=T,nrow=2)
    W1

    Z1=matrix(c(1,1,0,1,1,-1),byrow=T,nrow=3)
    Z1

    CovWZ=W1%*%CovXY%*%t(Z1)
    CovWZ

    CovZW=t(CovWZ)
    CovZW
    
    
# Ejercicio 1.6


    EZ=matrix(c(1,0,2),nrow=3)
    EZ

    VarZ= matrix(c(0.8,0.4,-0.2,0.4,1,-0.8,-0.2,-0.8,2),byrow=T, nrow=3)
    VarZ

## I

### VarY

    VarY=VarZ[1,1]
    VarY

### VarX

    VarX=matrix(c(VarZ[2,2],VarZ[2,3],VarZ[3,2],VarZ[3,3]),byrow=T,nrow=2)
    VarX

### Cov(Y,X)

    CovYX=matrix(c(VarZ[1,2],VarZ[1,3]),byrow=T,nrow=1)
    CovYX
    
# Ejercicio 2.5

### Desarrolle una función para bmco y bmcr


    bmco= function(x,y){
      xr=nrow(x)
      yr=nrow(y)
      X=cbind(rep(1,xr),x)
      if(xr==yr){
        b=solve(t(X)%*%X)%*%t(X)%*%y
        return(b)
      } else {
        print("Error")
      }
    }

### Ejemplo

    x=matrix(c(-1,2,6,17,22,32,4,53,-69,77,83,91),byrow=T,nrow=4)
    x
    y=matrix(c(1,6,7,4),nrow=4,1)
    y

    bmco(x,y)

### bmcr

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
        print("Error")
    }

    x=matrix(c(2,0,0,1,7,9),ncol=2)
    Y=matrix(c(1,0,5),ncol=1)
    R=matrix(c(0,1,1),ncol=3)
    r=2

    bmcr(x,Y,R,r)
    
    
#### Este paquete se implementó gracias a Jhair López

    install.packages("magic")
    library(magic)
    library(MASS)

# Ejercico 3.5

### Generar una muestra aleatoria para X, n=100

    m1=c(0,-1)
    m2=c(-2,0,2)
    s1=matrix(c(1,-.25,-.25,.5),2)
    s2=matrix(c(1,1/3,-1/2,1/3,1/4,0,-.5,0,1),3)
    m=c(m1,m2)
    s=adiag(s1,s2)
    x=mvrnorm(800,m,s)

# Ejercicio 3.6

    m=c(0,0,1,1)
    s=matrix(c(1,0,1,0,0,9,0,1,1,0,4,0,0,1,0,9),4)
    x=mvrnorm(200,m,s)
  
  



### Réplica del ejercicio realizado en clase 
### Se toma como insumo el script de Humberto Mártinez

    getwd()

### Para fijar el directorio de trabajo deben usar el cÃÂ³digo de abajo. 
### Utilicen el directorio de la carpeta con su nombre

    setwd("C://Users/Humberto MartÃ­nez/Documents/GitHub/Lab_Econ_I/H/Replication")

### Verificar que el directorio se fijÃÂ³ correctamente
    getwd()

    install.packages("dplyr")
    install.packages("tidyr")
    #install.packages("RCurl")
    #install.packages("httr")
### install.packages("ggplot2")
### install.packages("stargazer")

    library(XML)
    library(dplyr)
    library(tidyr)
    library(httr)

### ------------------
### 1. Retrieving data

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


### Asignamos el aÃ±o

    sal2010$year <- 2010
    sal2009$year <- 2009
    sal2008$year <- 2008
    sal2007$year <- 2007
    sal2006$year <- 2006
    sal2005$year <- 2005


### Now we can append the four data frames. We should drop the rank variable which was not read from the website.
    salaries <- bind_rows(sal2010,sal2009,sal2008,sal2007,sal2006,sal2005)
    salaries <- select(salaries, -rank)

    write.csv(salaries, "salaries.csv", row.names = FALSE)



### ------------------
### 2. Selecting observations and variables
    salaries <- read.csv("salaries.csv")

    salaries <- select(salaries, year, Salary, Name, Team)
    str(salaries)

### We also see that Salary is a character with dollar signs and commas. 
### Letâs strip all the punctuation from Salary, and turn it into a numerical variable.

    salaries$Salary <- as.numeric(gsub("[[:punct:]]","",salaries$Salary))
    summary(salaries$Salary)

### Los ceros son sospechosos

    salaries <- arrange(salaries, Salary)
    head(salaries, n=5)
    tail(salaries, n=5)


### ------------------
### Aggregating by groups

### Se acomodan por quintiles
    salaries <- salaries %>% group_by(year, Team ) %>% mutate(payroll=sum(Salary), pctile=ntile(Salary,5))
    salaries <- arrange(salaries, Salary)
    head(salaries, n=3)

### Nos quedamos con el quintil mÃ¡s alto
    salaries <- filter(salaries, pctile==5)
    salaries <- arrange(salaries, Salary)
    head(salaries, n=3)

### Since now we only have players in the top 20% we can aggregate/summarize the data by year and Team.
    salaries <- salaries %>% group_by(year, Team, payroll) %>% summarize(top20=sum(Salary))
    salaries$top20share <- salaries$top20/salaries$payroll*100 

### Letâs put payroll in millions rather than dollars. It will make the magnitude of our regression coefficients easier to read. 
### Letâs also check some descriptive statistics on top20share.
    salaries$payroll <- salaries$payroll/1000000
    summary(salaries)

    salaries <- arrange(salaries, top20share)
    head(salaries, n=3)
    tail(salaries, n=3)
### Convertimos la variable Team en string
    salaries$Team <- as.character(salaries$Team)


### ----------------------------------
### Get the data on team performance, data retrieval


    teamwins <- GET("http://www.baseball-reference.com/leagues/MLB/#teams_team_wins3000::none")
    teamwins <- readHTMLTable(rawToChar(teamwins$content), stringsAsFactors = FALSE)[[1]]

    write.csv(teamwins, "teamwins.csv", row.names = FALSE)
    teamwins <- read.csv("teamwins.csv",stringsAsFactors = FALSE)

### quedandonos sÃ³lo con lo que nos sirve
    teamwins$Year <- as.numeric(teamwins$Year)
    teamwins <- filter(teamwins, !is.na(teamwins$Year))

    #Nos quedaremos sÃ³lo con los datos de 2013 en adelante
    teamwins <- filter(teamwins, Year>2004 & Year<2011)


### ---------------------------------------------------
### Reacomodando los datos

### Primero generamos una variable year_games que colapsa aÃ±os y juegos
    teamwins <- unite(teamwins, year_games, Year, G)

### Usamos gather para colapsar columnas de wins por cada team

    teamwins2 <- gather(data=teamwins, value=wins, key=team, ARI,ATL,BLA,BAL,BOS,CHC,CHW,CIN,CLE,COL,DET,HOU,KCR,LAA,LAD,MIA,MIL,MIN,NYM,NYY,OAK,PHI,PIT,SDP,SFG,SEA,STL,TBR,TEX,TOR,WSN)
    head(teamwins2)

### Nuevamente separamos aÃ±os y juegos
    teamwins2 <- separate(teamwins2,year_games, c("year", "games"))
    head(teamwins2)

### Convertimos algunas a numÃ©ricas

    teamwins2$games <- as.numeric(teamwins2$games)
    teamwins2$wins <- as.numeric(teamwins2$wins)
    teamwins2$year <- as.numeric(teamwins2$year)

### Obtenemos el porcentaje de ganados
    teamwins2$pctwin <- teamwins2$wins/teamwins2$games*100
    teamwins2 <- arrange(teamwins2,pctwin)

### Vemos estadÃ­sticos, top y bottom 
    summary(teamwins2)
    head(teamwins2)
    tail(teamwins2)

### Tenemos algunos NA
### âBLAâ which is a code baseball-reference.com used for Baltimore Orioles in 1901 and 1902. The new code for the Orioles is âBALâ. 
### We will drop observations that have NA for winning percentage (i.e. we drop team âBLAâ).

    teamwins2 <- filter(teamwins2, !is.na(pctwin))
    tail(teamwins2)

### --------------------------------------------------------
### Merging data sets

### salaries y teamwins 2 serÃ¡n matcheadas por year y team.

### Primero tenemos que homologar los cÃ³digos
    salaries$Team[salaries$Team=="SF"] = "SFG"
    salaries$Team[salaries$Team=="KC"] = "KCR"
    salaries$Team[salaries$Team=="SD"] = "SDP"
    salaries$Team[salaries$Team=="TB"] = "TBR"

    salaries$Team[salaries$Team=="WSH"] = "WSN"
    salaries$Team[salaries$Team=="CWS"] = "CHW"

### Homologando el nombre de la columna a Team
    teamwins2$Team <- as.character(teamwins2$team)
    teamwins2 <- select(teamwins2, -team)

### Mergeamos por year y Team.
    merged <- inner_join(teamwins2, salaries, by=c("year","Team"))
    summary(merged)

    write.csv(merged, "database2010_2005.csv", row.names = FALSE)
### --------------------------------------
### 7. Graphing data

    library(ggplot2)
    ggplot(data=merged, aes(x=payroll,y=pctwin, label=Team, color=as.factor(year)))+ geom_text(size=3) +
      ggtitle("Payroll and performance of MLB teams, 2010-2005") + 
      xlab("Payroll in millions") + ylab("Percent of games won") +
      scale_color_discrete(name="year") + theme_minimal()

    ggplot(data=merged, aes(x=top20share,y=pctwin, label=Team, color=as.factor(year))) + geom_text(size=3) +
      ggtitle("Team inequality and performance of MLB teams, 2010-2005") + 
      xlab("Share of payroll earned by top 20%") + ylab("Percent of games won") +
      scale_color_discrete(name="year") + theme_minimal()

### ------------------------------------------
### 8. Regression Analysis

    library(stargazer)

### El paquete stargazer crea tablas para html, latex i ascii bien formateadas.
    m1 <- lm(pctwin ~ top20share, data=merged)
    m2 <- lm(pctwin ~ top20share + payroll, data=merged)
    m3 <- lm(pctwin ~ top20share + log(payroll) , data=merged)

    stargazer(m1,m2,m3, type="text")


# Análisis de la regresión realizada en el laboratorio

#### A continuación se presentan los resultados de la regresión de tres modelos distintos:

    =============================================================================
                                        Dependent variable:                        
                        ---------------------------------------------------------
                                              pctwin                               
                          (1)                   (2)                    (3)          
    -----------------------------------------------------------------------------
    top20share          0.157**               0.244***               0.232***    
                        (0.071)               (0.077)                (0.076)    

    payroll                                   0.032***                          
                                              (0.012)                        

    log(payroll)                                                      3.662**
                                                                     (1.517)

    Constant            40.176***             30.487***               17.861*
                        (4.377)               (5.662)                (10.203)    

    -----------------------------------------------------------------------------
    Observations          180                   180                    180       
    R2                   0.027                 0.064                  0.058      
    Adjusted R2          0.022                 0.053                  0.047     
    Std. Error     6.392 (df = 178)       6.288 (df = 177)       6.307 (df = 177)
    F Statistic  4.934**(df = 1; 178) 6.019***(df = 2; 177) 5.448***(df = 2; 177)
    =============================================================================
    Note:                                             *p<0.1; **p<0.05; ***p<0.01
    
Como se puede observar, el primer modelo de regresión, en el que se regresa el porcentaje de juegos ganados (pctwin) en función del gasto realizado en la nomina del último quintil respecto al gasto total de toda la liga (top20share), arroja un coeficiente, estadísticamente significativo al 5%, de 0.157. Esto quiere decir que un aumento porcentual de 1% en top20share incrementa el porcentaje de juegos ganados en aaproximadamente 0.157 puntos porcentuales.

Cuando se introduce la variable de gasto total en nomina de cada equipo (payroll), significativa al 1%, la variable top20share pasa a ser significativa al 1% y su tamaño incrementa a 0.244. De este segundo modelo se pueden concluir, entre otras cosas, dos aspectos: primero, un posible sesgo que se presenta en el primer modelo; y segundo, la interpretación de la variable payroll, es decir, que un incremento de una unidad en el gasto total en nomina de cada equipo incrementa en aproximadamente 0.032 puntos porcentuales el porcentaje de juegos ganados.

Finalmente, el tercer modelo involucra la variable log(payroll) en lugar de payroll. Su coeficiente es significativo al 5% y el de top20share lo sigue siendo al 1%. La interpretación de log(payroll) es la siguiente: un incremento porcentual de 1% en e gasto total en nomina de cada equipo incrementa en aproximadamente 0.03662% el porcentaje de juegos ganados.

