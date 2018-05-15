#
#           Evelyn Magali Suárez Reyes
#
####################################################
##
##   Réplica del ejercicio de beisbol
##
####################################################
# Replica el ejercicio realizado en el laboratorio de econometría de la fecha 27 de abril,
#desigualdad del pago en salarios sobre porcentage de juegos ganados
#en las grandes ligas de baseball
#Es necesario instalar los siguiente paquetes y llamar la siguiente librerias
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

# Ahora desde la página de internet extraemos las bases de datos sobre los salarios de los jugadores
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


# Es necesario asignar el año correspondiente a cada variable
# juntar las bases homologar el rango y guardar la base de datos.

sal2010$year <- 2010
sal2009$year <- 2009
sal2008$year <- 2008
sal2007$year <- 2007
sal2006$year <- 2006
sal2005$year <- 2005

salaries <- bind_rows(sal2010,sal2009,sal2008,sal2007,sal2006,sal2005)
salaries <- select(salaries, -rank)

write.csv(salaries, "salaries.csv", row.names = FALSE)


#Ahora de la base de datos guardada, la leemos y nos quedamos con las variables necesarias, la función str nos permite ver una descripción d elas variabales.
salaries <- read.csv("salaries.csv")

salaries <- select(salaries, year, Salary, Name, Team)
str(salaries)

#Dado que Salary es una cadena de carácteres necesitamos convertirlo en numérico. Necesitamos el promedio de los salarios. Además vemos los 5 salarios más
#altos y los 5 más bajos

salaries$Salary <- as.numeric(gsub("[[:punct:]]","",salaries$Salary))
salaries <- arrange(salaries, Salary)
head(salaries, n=5)
tail(salaries, n=5)
#Según el salario los agregamos por quintiles de salary y nos quedamos con el quintil más alto, Después los agreagamos por equipo y por año  lo dividimos entre la nomina del equipo y lo ponemos por millones de dolares.
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
# Convertimos la variable Team en string
salaries$Team <- as.character(salaries$Team)

#Nosotros queremos hacer un análisis de la inversión en los equipos y la eficiencia, ya tenemos los salarios pero necesitamos la eficiencia. Por
#eso de la página electrónica siguiente extraemos los daos sobre partidos ganados de los equipos de besibol en EU.

teamwins <- GET("http://www.baseball-reference.com/leagues/MLB/#teams_team_wins3000::none")
teamwins <- readHTMLTable(rawToChar(teamwins$content), stringsAsFactors = FALSE)[[1]]

write.csv(teamwins, "teamwins.csv", row.names = FALSE)
teamwins <- read.csv("teamwins.csv",stringsAsFactors = FALSE)

# Guardamos la variables necesarias y con los datos necesarios.
teamwins$Year <- as.numeric(teamwins$Year)
teamwins <- filter(teamwins, !is.na(teamwins$Year))

teamwins <- filter(teamwins, Year>2004 & Year<2011)


# Primero generamos una variable year_games que colapsa years y games
teamwins <- unite(teamwins, year_games, Year, G)

# Usamos gather para colapsar columnas de wins por cada erquipo

teamwins2 <- gather(data=teamwins, value=wins, key=team, ARI,ATL,BLA,BAL,BOS,CHC,CHW,CIN,CLE,COL,DET,HOU,KCR,LAA,LAD,MIA,MIL,MIN,NYM,NYY,OAK,PHI,PIT,SDP,SFG,SEA,STL,TBR,TEX,TOR,WSN)
head(teamwins2)

# Necesitamos separa las variables year y games. Y convertir las variables necesasrias en numeéricas.
teamwins2 <- separate(teamwins2,year_games, c("year", "games"))

teamwins2$games <- as.numeric(teamwins2$games)
teamwins2$wins <- as.numeric(teamwins2$wins)
teamwins2$year <- as.numeric(teamwins2$year)

# Ahora obtengqos el porcentaje de juegos ganados que es la forma en que mediremos la eficiencia de los equipos.
teamwins2$pctwin <- teamwins2$wins/teamwins2$games*100
teamwins2 <- arrange(teamwins2,pctwin)

#Quitamos los missing de la base
teamwins2 <- filter(teamwins2, !is.na(pctwin))
tail(teamwins2)

# --------------------------------------------------------


#Ya que los nombrees de los equipo en las bases en algunos caso varian en las bases, es necesario homologarlos para un buen análisis,
#así como llamamos de la misma manera las columnas
salaries$Team[salaries$Team=="SF"] = "SFG"
salaries$Team[salaries$Team=="KC"] = "KCR"
salaries$Team[salaries$Team=="SD"] = "SDP"
salaries$Team[salaries$Team=="TB"] = "TBR"
salaries$Team[salaries$Team=="WSH"] = "WSN"
salaries$Team[salaries$Team=="CWS"] = "CHW"

teamwins2$Team <- as.character(teamwins2$team)
teamwins2 <- select(teamwins2, -team)

# Unimos las bases por año y equipo y guardamaos la base
merged <- inner_join(teamwins2, salaries, by=c("year","Team"))
summary(merged)

write.csv(merged, "database2010_2005.csv", row.names = FALSE)
# --------------------------------------
#Ahora graficaremos los datos, para esto es necesario llamar la libreria ggplot2
library(ggplot2)
ggplot(data=merged, aes(x=payroll,y=pctwin, label=Team, color=as.factor(year)))+ geom_text(size=3) +
  ggtitle("Payroll and performance of MLB teams, 2010-2005") + 
  xlab("Payroll in millions") + ylab("Percent of games won") +
  scale_color_discrete(name="year") + theme_minimal()

ggplot(data=merged, aes(x=top20share,y=pctwin, label=Team, color=as.factor(year))) + geom_text(size=3) +
  ggtitle("Team inequality and performance of MLB teams, 2010-2005") + 
  xlab("Share of payroll earned by top 20%") + ylab("Percent of games won") +
  scale_color_discrete(name="year") + theme_minimal()

# ------------------------------------------
## Regresión lineal
# Llamamos la libreria stargazer ya que esta crea tablas para html, latex, ascii xon un buen  formato.
library(stargazer)


m1 <- lm(pctwin ~ top20share, data=merged)
m2 <- lm(pctwin ~ top20share + payroll, data=merged)
m3 <- lm(pctwin ~ top20share + log(payroll) , data=merged)

stargazer(m1,m2,m3, type="text")
