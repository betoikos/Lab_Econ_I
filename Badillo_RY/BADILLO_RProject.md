# Ejercicio 1.4
#Raquel Badillo 

#### Valores esperados de las variables aleatorias
```
E.x1=0
E.x2=-4
E.x3=1

E.y1=-1
E.y2=4
```
#### varianzas y covarianzas de las variables aleatorias
```
var.x1=1
var.x2=4
var.x3=2
var.y1=1
var.y2=9

cov.x1x2=-1
cov.x1x3=0
cov.x1y1=0
cov.x1y2=1
cov.x2x3=2
cov.x2y1=-1
cov.x2y2=-3
cov.x3y1=0
cov.x3y2=3
cov.y1y2=-2
```
### I.

##### Matriz de valores esperados de X
```
E.X=matrix(c(Ex1,Ex2,Ex3),3)
E.X
```
##### Matriz de varianzas y covarianzas de X
```
var.X=matrix(c(var.x1,cov.x1x2,cov.x1x3,cov.x1x2,var.x2,cov.x2x3,cov.x1x3,cov.x2x3,var.x3),nrow=3, byrow=T)
varX
```
###### Matriz de valores esperados de Y
```
E.Y=matrix(c(E.y1,E.y2),2)
E.Y
```
###### Matriz de varianzas y covarianzas de Y
```
var.Y=matrix(c(var.y1,covy1y2,covy1y2,var.y2),byrow=T,nrow=2)
var.Y
```
##### Matriz de covarianzas de X,Y
```
cov.XY=matrix(c(cov.x1y1,cov.x1y2,cov.x2y1,cov.x2y2,cov.x3y1,cov.x3y2),nrow=3, byrow=T)
covXY
covYX=t(covXY)
covYX
```
### II

##### Vector de constantes
```
a=matrix(c(-1, 3/2,-4),nrow=3)
a
```

##### E(aX)
```
EaX=a*E.X
EaX

var.aX= t(a)%*%var.X%*%a
var.aX
```
### III
```
A=matrix(c(-2,0,1,1,4,-2),byrow=T,nrow=2)
A

b=matrix(c(1,1),nrow=2)
b
```

#### Sea Z=AX+b
```
EZ=(A%*%EX)+b
EZ

var.Z=A%*%var.X%*%t(A)
var.Z
```
### IV
```
u.1=matrix(c(1,0,-3,0,1,0,0,2,3),nrow=3, byrow=T)
u.1

u=matrix(c(2,0,5),nrow=3)
u

V1=matrix(c(1,-1,1,-1,4,-1),byrow=T,nrow=2)
V1

v=matrix(c(1,0),nrow=2)
v
# E(U)

EU=(u.1%*%EX)+u
EU

# E(V)

EV=(V1%*%EX)+v
Ev
```
###### var.(U)
```
var.u=u.1%*%var.X%*%t(u.1)
var.u
```
###### var.(V)
```
var.V=V1%*%var.X%*%t(V1)
var.V
```
###### cov(U,V)
```
cov.UV=u.1%*%var.X%*%t(V1)
cov.UV
```
###### cov(V,U)
```
cov.VU=t(cov.UV)
cov.VU
```
###### V
```
C=matrix(c(-2,1,5),nrow=3)
C

d=8
d
```
##### Sea cov(AX+b,Cx+d)=covW
```
cov.W=A%*%var.X%*%C
cov.W
```
##### VI
``````
D=matrix(c(1,0,2,-2,4,3),nrow=3, byrow=T)
D

e=matrix(c(1,0,-1),nrow=3)
e
``````
#####Sea cov(AX+b,Dy+e)=covP
```
cov.P=A%*%covXY%*%t(D)
cov.P
```
##### VII
```
M1=matrix(c(-1,0,-4,1,2,-1),byrow=T,nrow=2)
M1

var..N1X=M1%*%var.X%*%t(M1)
var..N1X
```
##### VIII
```
W1=matrix(c(-1,0,-4,1,2,-1),byrow=T,nrow=2)
W1

Z1=matrix(c(1,1,0,1,1,-1),nrow=3, byrow=T)
Z1

cov.WZ=W1%*%cov.XY%*%t(Z1)
cov.WZ

cov.ZW=t(cov.WZ)
cov.ZW
```
###### Ejercicio 1.6

```
EZ=matrix(c(1,0,2),nrow=3)
EZ

var.Z= matrix(c(0.8,0.4,-0.2,0.4,1,-0.8,-0.2,-0.8,2),byrow=T, nrow=3)
var.Z
```
### I

###### var.Y
```
var.Y=var.Z[1,1]
var.Y
```
###### var.X
```
var.X=matrix(c(var.Z[2,2],var.Z[2,3],var.Z[3,2],var.Z[3,3]),byrow=T,nrow=2)
var.X
```
###### Cov(Y,X)
```
cov.YX=matrix(c(var.Z[1,2],var.Z[1,3]),byrow=T,nrow=1)
cov.YX
```
###### Cov(X,Y)
```
CovXY=t(cov.YX)
CovXY
```
### II

#### E(Y^2)
```
EY2=var.Y+(EZ[1,1]^2)
EY2
```
##### E(Xt(X))
```
E.XXt=var.X+c(0,2)%*%t(c(0,2))
E.XXt

# E(t(X)X)

E.XtX=var.X[1,1]+var.X[2,2]+1
E.XtX

# E(Yt(X))

E.YXt=cov.YX+c(0,2)
E.YXt

# E(XY)

EXY=t(E.YXt)
EXY
```

##ejercicio 2.5
>funciones para bmco bmcr y y para u // no se puede calcular para y y para u, necesimos a fuerzas la matriz x
>hacemos simulaciones para comprobar que el resullatado está bien
```
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

```

#ejercicio 3.5
>genera una muestra para x=100 
```
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
```
#ejercicio 3.6
```
library(MASS)

N      = 200
m.yx1   = c(0,0,1,1)

a=1
b=0
c=4
d=9
cov.yx1 = matrix(c(1,0,1,0,0,9,0,1,1,0,4,0,0,1,0,9), 4,4 )
x1     = mvrnorm(N, m.yx1, cov.yx1)
```

#ejercicio 4.5
>genera una muestra para x=200 
```
library(MASS)
N      = 200
m.yx1   = c(0,0,1,1)

a=1
b=0
c=4
d=9
cov.yx1 = matrix(c(1,0,1,0,0,9,0,1,1,0,4,0,0,1,0,9), 4,4 )
x1     = mvrnorm(N, m.yx1, cov.yx1)

#ejercicio 3.5
#genera una muestra para x=100 
library(MASS)
u= function(sigma, n){
  j=dim(sigma)
  zero=matrix(0, j[2], 1)
  w   = mvrnorm(n, zero, sigma)
return(w)
}

S=matrix(c(1,0,4,1),2,2)
u(S,800)
```
#ejercicio beisbol
>replica del script de Humberto Martínez visto en clase
```
getwd()
setwd("C:/Users/Yunoen Badillo Salas/Documents/GitHub/Lab_Econ_I_1/Lab_Econ_I/Badillo_RY/laboratorio5")
getwd() #revisamos directorio
library(XML)
library(dplyr)
library(tidyr)
library(httr)
```
>descargando datos
```
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
```

>poniendo year
```
sal2010$year <- 2010
sal2009$year <- 2009
sal2008$year <- 2008
sal2007$year <- 2007
sal2006$year <- 2006
sal2005$year <- 2005
```
>   juntando base de datos
```
salaries <- bind_rows(sal2010,sal2009,sal2008,sal2007,sal2006,sal2005)
salaries <- select(salaries, -rank)
write.csv(salaries, "salaries.csv", row.names = FALSE)
```


# ------------------
> seleccionando datos
```
salaries <- read.csv("salaries.csv")

salaries <- select(salaries, year, Salary, Name, Team)
str(salaries)
```
>limpiando base de datos
```
salaries$Salary <- as.numeric(gsub("[[:punct:]]","",salaries$Salary))
summary(salaries$Salary)
```
>Los ceros son sospechosos
```
salaries <- arrange(salaries, Salary)
head(salaries, n=5)
tail(salaries, n=5)
```

# ------------------
####agrupando 
>Se acomodan por quintiles
```
salaries <- salaries %>% group_by(year, Team ) %>% mutate(payroll=sum(Salary), pctile=ntile(Salary,5))
salaries <- arrange(salaries, Salary)
head(salaries, n=3)
```
>Nos quedamos con el quintil primero
```
salaries <- filter(salaries, pctile==5)
salaries <- arrange(salaries, Salary)
head(salaries, n=3)
```
>resumiendo salario año
```
salaries <- salaries %>% group_by(year, Team, payroll) %>% summarize(top20=sum(Salary))
salaries$top20share <- salaries$top20/salaries$payroll*100 
```
>generando nómina
```
salaries$payroll <- salaries$payroll/1000000
summary(salaries)
salaries <- arrange(salaries, top20share)
head(salaries, n=3)
tail(salaries, n=3)
```
>Convertimos la variable Team en string
```
salaries$Team <- as.character(salaries$Team)
```

# ----------------------------------
>descargando performance
```
teamwins <- GET("http://www.baseball-reference.com/leagues/MLB/#teams_team_wins3000::none")
teamwins <- readHTMLTable(rawToChar(teamwins$content), stringsAsFactors = FALSE)[[1]]
write.csv(teamwins, "teamwins.csv", row.names = FALSE)
teamwins <- read.csv("teamwins.csv",stringsAsFactors = FALSE)
```
> limpiando más
```
teamwins$Year <- as.numeric(teamwins$Year)
teamwins <- filter(teamwins, !is.na(teamwins$Year))
```
>nos quedamos de 2004 a 2001
```
teamwins <- filter(teamwins, Year>2004 & Year<2011)
```

# ---------------------------------------------------
>Reacomodando los datos

> Primero generamos una variable year_games que colapsa aÃ±os y juegos
```
teamwins <- unite(teamwins, year_games, Year, G)
```
```
Usamos gather para colapsar columnas de wins por cada team
teamwins2 <- gather(data=teamwins, value=wins, key=team, ARI,ATL,BLA,BAL,BOS,CHC,CHW,CIN,CLE,COL,DET,HOU,KCR,LAA,LAD,MIA,MIL,MIN,NYM,NYY,OAK,PHI,PIT,SDP,SFG,SEA,STL,TBR,TEX,TOR,WSN)
head(teamwins2)
```
>Nuevamente separamos aÃ±os y juegos
```
teamwins2 <- separate(teamwins2,year_games, c("year", "games"))
head(teamwins2)
```
>convertimos algunas a numÃ©ricas
```
teamwins2$games <- as.numeric(teamwins2$games)
teamwins2$wins <- as.numeric(teamwins2$wins)
teamwins2$year <- as.numeric(teamwins2$year)
```
> Obtenemos el porcentaje de ganados
```
teamwins2$pctwin <- teamwins2$wins/teamwins2$games*100
teamwins2 <- arrange(teamwins2,pctwin)
```
> Vemos estadÃ­sticos, top y bottom 
```
summary(teamwins2)
head(teamwins2)
tail(teamwins2)
```
>Tenemos algunos NA
> bye observaciones NA
```
teamwins2 <- filter(teamwins2, !is.na(pctwin))
tail(teamwins2)
```
# --------------------------------------------------------
>Merging data sets

>Primero tenemos que homologar los cÃ³digos
```
salaries$Team[salaries$Team=="SF"] = "SFG"
salaries$Team[salaries$Team=="KC"] = "KCR"
salaries$Team[salaries$Team=="SD"] = "SDP"
salaries$Team[salaries$Team=="TB"] = "TBR"

salaries$Team[salaries$Team=="WSH"] = "WSN"
salaries$Team[salaries$Team=="CWS"] = "CHW"
```
> Homologando el nombre de la columna a Team
```
teamwins2$Team <- as.character(teamwins2$team)
teamwins2 <- select(teamwins2, -team)
```
> Mergeamos por year y Team.
```
merged <- inner_join(teamwins2, salaries, by=c("year","Team"))
summary(merged)

write.csv(merged, "database2010_2005.csv", row.names = FALSE)
```
# --------------------------------------
> 7. Graphing data
```
library(ggplot2)
ggplot(data=merged, aes(x=payroll,y=pctwin, label=Team, color=as.factor(year)))+ geom_text(size=3) +
  ggtitle("Payroll and performance of MLB teams, 2010-2005") + 
  xlab("Payroll in millions") + ylab("Percent of games won") +
  scale_color_discrete(name="year") + theme_minimal()

ggplot(data=merged, aes(x=top20share,y=pctwin, label=Team, color=as.factor(year))) + geom_text(size=3) +
  ggtitle("Team inequality and performance of MLB teams, 2010-2005") + 
  xlab("Share of payroll earned by top 20%") + ylab("Percent of games won") +
  scale_color_discrete(name="year") + theme_minimal()
```
# ------------------------------------------
> 8. Regression Analysis
```
library(stargazer)

# El paquete stargazer crea tablas para html, latex i ascii bien formateadas.
m1 <- lm(pctwin ~ top20share, data=merged)
m2 <- lm(pctwin ~ top20share + payroll, data=merged)
m3 <- lm(pctwin ~ top20share + log(payroll) , data=merged)

stargazer(m1,m2,m3, type="text")
```


