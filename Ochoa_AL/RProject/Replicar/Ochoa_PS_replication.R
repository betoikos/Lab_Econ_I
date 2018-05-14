# Ochoa Morales A. Lorena

# Este código fue modificado, el original lo proporcionó nuestro laboratorista, Humberto Martinez.
#Hacer la regresion para el mismo numero de años 2007 - 2013
#Y hacer interpretación en una cuartilla

# Licence Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)

# Heavily based on http://rpubs.com/dvorakt/183866 but updated. Results are more robust here.


getwd()

# Para fijar el directorio de trabajo deben usar el cÃƒÂ³digo de abajo. 
# Utilicen el directorio de la carpeta con su nombre

setwd("C://Users/sony/Documents/03 sem2/06 Econom/02 LabH/Replicar")

# Verificar que el directorio se fijÃƒÂ³ correctamente
getwd()

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

# ------------------
# 1. Retrieving data 2007 - 2013

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



# Asignamos el aÃ±o

sal2007$year <- 2007
sal2008$year <- 2008
sal2009$year <- 2009
sal2010$year <- 2010
sal2011$year <- 2011
sal2012$year <- 2012
sal2013$year <- 2013

#Notar que las bases tienen el mismo número de observaciones, las podemos unir en una sola base

# Now we can append the four data frames. We should drop the rank variable which was not read from the website.
salaries <- bind_rows(sal2013,sal2013,sal2012,sal2011,sal2010,sal2009,sal2008,sal2007)
salaries <- select(salaries, -rank) #quitamos rank

#Select quita variable rango

write.csv(salaries, "salaries1.csv", row.names = FALSE)   #genera csv

# Hasta aquí hemos escrito nuestra nueva base de datos



# ------------------
# 2. Selecting observations and variables
salaries <- read.csv("salaries1.csv")

salaries <- select(salaries, year, Salary, Name, Team)
str(salaries) #Ahora todos son strings

# Se observa que el salario tiene el signo de dolares y comas, eliminemos esos caracteres
# We also see that Salary is a character with dollar signs and commas. 
#Letâ€™s strip all the punctuation from Salary, and turn it into a numerical variable.

salaries$Salary <- as.numeric(gsub("[[:punct:]]","",salaries$Salary)) #punct quita signo $, se vuelve numero
summary(salaries$Salary)

# Los ceros son sospechosos

salaries <- arrange(salaries, Salary) #ordena la base de datos por la var salarios, de menor a mayor
head(salaries, n=5) #tomamos primeeros 5
tail(salaries, n=5)

salaries <- filter(salaries, Salary != 0) #Filtramos los que no son ceros
salaries <- arrange(salaries, Salary)
head(salaries, n=5)

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

# Letâ€™s put payroll in millions rather than dollars. It will make the magnitude of our regression coefficients easier to read. 
# Letâ€™s also check some descriptive statistics on top20share.
salaries$payroll <- salaries$payroll/1000000  #el salario lo ponemos en $ en millones USD
summary(salaries)

salaries <- arrange(salaries, top20share) #ordenar de menor a mayor el top20 por salario
head(salaries, n=3)
tail(salaries, n=3)
# Convertimos la variable Team en string
salaries$Team <- as.character(salaries$Team) #se vuelve caracter
#This is because the performance data may have different set of teams which means that factor levels may not match.


# ----------------------------------
# Get the data on team performance, data retrieval


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

# Vemos estadÃ­sticos, top y bottom 
summary(teamwins2)
head(teamwins2)
tail(teamwins2)

# Tenemos algunos NA
# â€œBLAâ€ which is a code baseball-reference.com used for Baltimore Orioles in 1901 and 1902. The new code for the Orioles is â€œBALâ€. 
# We will drop observations that have NA for winning percentage (i.e. we drop team â€œBLAâ€).

teamwins2 <- filter(teamwins2, !is.na(pctwin)) #filtrar nas
tail(teamwins2)

# --------------------------------------------------------
# Merging data sets

# salaries y teamwins 2 serÃ¡n matcheadas por year y team.

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

# Combinamos/Mergeamos las 2 bases por year y Team usando comando "inner_joint"
merged <- inner_join(teamwins2, salaries,by=c("year", "Team")) #Unen por año y por equipo, nos quedamos con 8 variables que son las que se traslapan
summary(merged)


# --------------------------------------

#Grafiquemos los datos antes de hacer la regresión para observar dispersión

# 7. Graphing data

library(ggplot2)
ggplot(data=merged, aes(x=payroll,y=pctwin, label=Team, color=as.factor(year)))+ geom_text(size=3) +
  ggtitle("Payroll and performance of MLB teams, 2007-2013") + 
  xlab("Payroll in millions") + ylab("Percent of games won") +
  scale_color_discrete(name="year") + theme_minimal()



ggplot(data=merged, aes(x=top20share,y=pctwin, label=Team, color=as.factor(year))) + geom_text(size=3) +
  ggtitle("Team inequality and performance of MLB teams, 2007-2013") + 
  xlab("Share of payroll earned by top 20%") + ylab("Percent of games won") +
  scale_color_discrete(name="year") + theme_minimal()

# ------------------------------------------
# 8. Regression Analysis

library(stargazer)

# El paquete stargazer crea tablas para html, latex i ascii bien formateadas.
m1 <- lm(pctwin ~ top20share, data=merged) #Regresion (Y-X, Database)
m2 <- lm(pctwin ~ top20share + payroll, data=merged)
m3 <- lm(pctwin ~ top20share + log(payroll) , data=merged)

stargazer(m1,m2,m3, type="text")

#Hacer la regresion para el mismo numero de años 2007 - 2012 Y hacer interpretación en una cuartilla
