##### Proyecto en R #####
##### Laboratorio de econometría I #####
#### Luis Enrique Ramos Alvarez #####

install.packages("dplyr")
install.packages("tidyr")
install.packages("RCurl")
install.packages("httr")
install.packages("ggplot2")
install.packages("stargazer")

library(XML)
library(dplyr)
library(tidyr)
library(httr)

# Tarea 1

## Ejercicio 4

# Definiciones

Ex1 <- 0
Ex2 <- -4
Ex3 <- 1
Ey1 <- -1
Ey2 <- 4

varx1 <- 1
varx2 <- 4
varx3 <- 2
vary1 <- 1
vary2 <- 9

covx1x2 <- -1
covx1x3 <- 0
covx1y1 <- 0
covx1y2 <- 1

covx2x3 <- 2
covx2y1 <- -1
covx2y2 <- -3

covx3y1 <- 0
covx2y2 <- 3
covy1y2 <- -2

# Inciso i)

# E[X]

Ex <- t(t(c(Ex1, Ex2,Ex3)))

Ex

Ex <- matrix(c(Ex1,Ex2,Ex3),3)
Ex

# var(X)

varX <- matrix(c(varx1,covx1x2,covx1x3,
                 covx1x2,varx2,covx2x3,
                 covx1x3,covx2x3,varx3),3)
varX

# var(Y)

varY <- matrix(c(vary1,covy1y2,
                 covy1y2,vary2),2)
varY

## Ejercicio 6.

Ez <- matrix(c(1,0,2),nrow=3,ncol=1)
varz <- matrix(c(0.8,0.4,-0.2,
                 0.4,1.0,-0.8,
                 -0.2,-0.8,2.0),3)
?matrix
## Inciso i).

# var(Y)
vary <- varz[1,1] 
vary

# var(X)
varx <- varz[2:3,2:3]
varx

# cov(Y,X)
covyx <- t(c(varz[1,2],varz[1,3]))
covyx

# cov(X,Y)
covxy <- c(varz[1,2],varz[1,3])
covxy

## Inciso ii).

# E(Y^2), Se sabe que: var(Y) = E(Y^2) - (E(Y))^2, entonces:

Ey2 <- vary + (Ez[1,1])^2
Ey2

# E(XX')

Ex12 <- varz[2,2] + (Ez[2,1])^2
Ex12
Ex1x2 <- varx[2,1] + Ez[2,1]*Ez[3,1]
Ex1x2
Ex22 <- varx[2,2] + (Ez[3,1])^2
Ex22

Exx <- matrix(c(Ex12,Ex1x2,Ex1x2,Ex22),2)
Exx

# E(X'X)

Exx1 <- Ex12 + Ex22
Exx1

# E(YX')

Eyx1 <- varz[1,2] + Ez[1,1]*Ez[2,1]
Eyx1
Eyx2 <- varz[1,3] + Ez[1,1]*Ez[3,1]
Eyx2

Eyx <- t(c(Eyx1,Eyx2))
Eyx

# E(XY)

Exy <- c(Eyx1,Eyx2)
Exy

# Tarea 2

## Ejercicio 5

## Inciso i).

# Función para bmco

bmco <- function(X,Y){
  bmco <- solve(t(X)%*%X)%*%t(X)%*%Y
  return(bmco)
}

# Función para bmcr

bmcr <- function(bmco,X,R,r){
  bmcr <- bmco - solve(t(X)%*%X)%*%t(R)%*%(solve(R%*%solve(t(X)%*%X)%*%t(R)))%*%(R%*%bmco - r)
  return(bmcr)
}

# Función para U

U <- function(Y,X,b){
  U <- Y - X%*%b
  return(U)
}

# Función para Y

Y <- function(X,b,U){
  Y <- X%*%b + U
  return(Y)
}


# Tarea 3

## Ejercicio 5.

# Generar una muestra para X, n=100
n <- 100
mu <- c(0,-1)
sigma <- matrix(c(1,-1/4,-1/4,1/2),2)

muestra <- mvrnorm(n,mu,sigma)

mu2 <- c(-2,0,2)
sigma2 <- matrix(c(1,1/3,-1/2,1/3,1/4,0,-1/2,0,1),3)

muestra2 <- mvrnorm(n,mu2,sigma2)

## Ejercicio 6.

# Generar una muestra para X, n=200

n2 <- 200
mu3 <- c(0,0,1,1)
sigma3 <- matrix(c(1,0,1,0,0,9,0,1,1,0,4,0,0,1,0,9),4)
muestra3 <- mvrnorm(n2,mu3,sigma3)

# Tarea 4

## Ejercicio 5.

U1 <- function(n,mu,sigmau){
  U <- mvrnorm(n,mu,sigmau)
  return(U)
}

X <- function(n,mu,sigmau){
  X <- mvrnorm(n,mu,sigmau)
  return(X)
}



# Práctica replicar base.

sal2012 <- GET("http://www.usatoday.com/sports/mlb/salaries/2012/player/all/#card_full_width_main")
sal2012 <- readHTMLTable(rawToChar(sal2012$content))[[1]]

sal2011 <- GET("http://www.usatoday.com/sports/mlb/salaries/2011/player/all/#card_full_width_main")
sal2011 <- readHTMLTable(rawToChar(sal2011$content))[[1]]

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

# Asignamos el aC1o

sal2012$year <- 2012
sal2011$year <- 2011
sal2010$year <- 2010
sal2009$year <- 2009
sal2008$year <- 2008
sal2007$year <- 2007
sal2006$year <- 2006
sal2005$year <- 2005


salaries <- bind_rows(sal2012,sal2011,sal2010,sal2009,sal2008,sal2007,sal2006,sal2005)
salaries <- select(salaries, -rank)

write.csv(salaries, "salaries.csv", row.names = FALSE)

# ------------------
# 2. Selecting observations and variables
salaries <- read.csv("salaries.csv")

salaries <- select(salaries, year, Salary, Name, Team)
str(salaries)


salaries$Salary <- as.numeric(gsub("[[:punct:]]","",salaries$Salary))
summary(salaries$Salary)

# Los ceros son sospechosos

salaries <- arrange(salaries, Salary)
head(salaries, n=5)
tail(salaries, n=5)

salaries <- filter(salaries, Salary != 0)
salaries <- arrange(salaries, Salary)
head(salaries, n=5)

# ------------------
# Agregando por grupos

# Se acomodan por quintiles
salaries <- salaries %>% group_by(year, Team ) %>% mutate(payroll=sum(Salary), pctile=ntile(Salary,5))
salaries <- arrange(salaries, Salary)
head(salaries, n=3)

# Nos quedamos con el quintil mC!s alto
salaries <- filter(salaries, pctile==5)
salaries <- arrange(salaries, Salary)
head(salaries, n=3)

# Como ahora sólo tenemos jugadores en el top 20% podemos resumir los datos por años y equipo.
salaries <- salaries %>% group_by(year, Team, payroll) %>% summarize(top20=sum(Salary))
salaries$top20share <- salaries$top20/salaries$payroll*100 

salaries$payroll <- salaries$payroll/1000000
summary(salaries)

salaries <- arrange(salaries, top20share)
head(salaries, n=3)
tail(salaries, n=3)
# Convertimos la variable Team en string
salaries$Team <- as.character(salaries$Team)


# ----------------------------------
# Get the data on team performance, data retrieval


teamwins <- GET("http://www.baseball-reference.com/leagues/MLB/#teams_team_wins3000::none")
teamwins <- readHTMLTable(rawToChar(teamwins$content), stringsAsFactors = FALSE)[[1]]

write.csv(teamwins, "teamwins.csv", row.names = FALSE)
teamwins <- read.csv("teamwins.csv",stringsAsFactors = FALSE)

# quedandonos sólo con lo que nos sirve
teamwins$Year <- as.numeric(teamwins$Year)
teamwins <- filter(teamwins, !is.na(teamwins$Year))

#Nos quedaremos sólo con los datos de 2013 en adelante
teamwins <- filter(teamwins, Year>2012)


# ---------------------------------------------------
# Reacomodando los datos

# Primero generamos una variable year_games que colapsa aC1os y juegos
teamwins <- unite(teamwins, year_games, Year, G)

# Usamos gather para colapsar columnas de wins por cada team

teamwins2 <- gather(data=teamwins, value=wins, key=team, ARI,ATL,BLA,BAL,BOS,CHC,CHW,CIN,CLE,COL,DET,HOU,KCR,LAA,LAD,MIA,MIL,MIN,NYM,NYY,OAK,PHI,PIT,SDP,SFG,SEA,STL,TBR,TEX,TOR,WSN)
head(teamwins2)

# Nuevamente separamos años y juegos
teamwins2 <- separate(teamwins2,year_games, c("year", "games"))
head(teamwins2)

# Convertimos algunas a numéricas

teamwins2$games <- as.numeric(teamwins2$games)
teamwins2$wins <- as.numeric(teamwins2$wins)
teamwins2$year <- as.numeric(teamwins2$year)

# Obtenemos el porcentaje de ganados
teamwins2$pctwin <- teamwins2$wins/teamwins2$games*100
teamwins2 <- arrange(teamwins2,pctwin)

# Vemos estadC-sticos, top y bottom 
summary(teamwins2)
head(teamwins2)
tail(teamwins2)

# Tenemos algunos NA

teamwins2 <- filter(teamwins2, !is.na(pctwin))
tail(teamwins2)

# --------------------------------------------------------
# Uniendo conjuntos de datos

# salaries y teamwins 2 serán matcheadas por año y equipo.

#Primero tenemos que homologar los códigos
salaries$Team[salaries$Team=="SF"] = "SFG"
salaries$Team[salaries$Team=="KC"] = "KCR"
salaries$Team[salaries$Team=="SD"] = "SDP"
salaries$Team[salaries$Team=="TB"] = "TBR"

salaries$Team[salaries$Team=="WSH"] = "WSN"
salaries$Team[salaries$Team=="CWS"] = "CHW"

# Homologando el nombre de la columna a Team
teamwins2$Team <- as.character(teamwins2$team)
teamwins2 <- select(teamwins2, -team)

# Unimos por año y equipo.
merged <- inner_join(teamwins2, salaries,by=c("year", "Team"))
summary(merged)

write.csv(merged, "database2013_2018.csv", row.names = FALSE)
# --------------------------------------
# 7. Gráficas de los datos

library(ggplot2)
ggplot(data=merged, aes(x=payroll,y=pctwin, label=Team, color=as.factor(year)))+ geom_text(size=3) +
  ggtitle("Payroll and performance of MLB teams, 2013-2018") + 
  xlab("Payroll in millions") + ylab("Percent of games won") +
  scale_color_discrete(name="year") + theme_minimal()

ggplot(data=merged, aes(x=top20share,y=pctwin, label=Team, color=as.factor(year))) + geom_text(size=3) +
  ggtitle("Team inequality and performance of MLB teams, 2013-2018") + 
  xlab("Share of payroll earned by top 20%") + ylab("Percent of games won") +
  scale_color_discrete(name="year") + theme_minimal()

# ------------------------------------------
# 8. Regression Analysis

library(stargazer)

# El paquete stargazer crea tablas para html, latex i ascii bien formateadas.
m1 <- lm(pctwin ~ top20share, data=merged)
m2 <- lm(pctwin ~ top20share + payroll, data=merged)
m3 <- lm(pctwin ~ top20share + log(payroll) , data=merged)

stargazer(m1,m2,m3, type="text")
