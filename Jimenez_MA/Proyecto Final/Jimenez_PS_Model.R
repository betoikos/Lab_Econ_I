getwd()
setwd("C:/Users/office depot/Documents/GitHub/Lab_Econ_I/Jimenez_MA")

#----------Replicación modelo desempeño----------

library(XML)
library(dplyr)
library(tidyr)
library(httr)

#Creando base de datos

sal2007 <- GET("http://www.usatoday.com/sports/mlb/salaries/2007/player/all/#card_full_width_main")
sal2007 <- readHTMLTable(rawToChar(sal2007$content))[[1]]

sal2008 <- GET("http://www.usatoday.com/sports/mlb/salaries/2008/player/all/#card_full_width_main")
sal2008 <- readHTMLTable(rawToChar(sal2008$content))[[1]]

sal2009 <- GET("http://www.usatoday.com/sports/mlb/salaries/2009/player/all/#card_full_width_main")
sal2009 <- readHTMLTable(rawToChar(sal2009$content))[[1]]

sal2010 <- GET("http://www.usatoday.com/sports/mlb/salaries/201/player/all/#card_full_width_main")
sal2010 <- readHTMLTable(rawToChar(sal2010$content))[[1]]

sal2011 <- GET("http://www.usatoday.com/sports/mlb/salaries/2011/player/all/#card_full_width_main")
sal2011 <- readHTMLTable(rawToChar(sal2011$content))[[1]]

sal2012 <- GET("http://www.usatoday.com/sports/mlb/salaries/2012/player/all/#card_full_width_main")
sal2012 <- readHTMLTable(rawToChar(sal2012$content))[[1]]

sal2013 <- GET("http://www.usatoday.com/sports/mlb/salaries/2013/player/all/#card_full_width_main")
sal2013 <- readHTMLTable(rawToChar(sal2013$content))[[1]]sal2003 <- readHTMLTable(rawToChar(sal2003$content))[[1]]

# Asignamos el año

sal2007$year <- 2007
sal2008$year <- 2008
sal2009$year <- 2009
sal2010$year <- 2010
sal2011$year <- 2011
sal2012$year <- 2012
sal2013$year <- 2013

salaries <- bind_rows(sal2013,sal2012,sal2011,sal2010,sal2009,sal2008,sal2007,sal2006)
salaries <- select(salaries, -rank)

write.csv(salaries, "salaries.csv", row.names = FALSE)

# Procesando base de datos.
salaries <- read.csv("salaries.csv")

salaries <- select(salaries, year, Salary, Name, Team)
str(salaries)
salaries$Salary <- as.numeric(gsub("[[:punct:]]","",salaries$Salary))
summary(salaries$Salary)

# Eliminando ceros

salaries <- arrange(salaries, Salary)
head(salaries, n=5)
tail(salaries, n=5)

salaries <- filter(salaries, Salary != 0)
salaries <- arrange(salaries, Salary)
head(salaries, n=5)

# Agrupando datos

# Se acomodan por quintiles
salaries <- salaries %>% group_by(year, Team ) %>% mutate(payroll=sum(Salary), pctile=ntile(Salary,5))
salaries <- arrange(salaries, Salary)
head(salaries, n=3)

# Quintil más alto
salaries <- filter(salaries, pctile==5)
salaries <- arrange(salaries, Salary)
head(salaries, n=3)

# Procesando datos agregados.
salaries <- salaries %>% group_by(year, Team, payroll) %>% summarize(top20=sum(Salary))
salaries$top20share <- salaries$top20/salaries$payroll*100 

# Pasando unidades a millones de dólares.
salaries$payroll <- salaries$payroll/1000000
summary(salaries)

salaries <- arrange(salaries, top20share)
head(salaries, n=3)
tail(salaries, n=3)

# Variable Team en string
salaries$Team <- as.character(salaries$Team)

# Get the data on team performance, data retrieval

teamwins <- GET("http://www.baseball-reference.com/leagues/MLB/#teams_team_wins3000::none")
teamwins <- readHTMLTable(rawToChar(teamwins$content), stringsAsFactors = FALSE)[[1]]

write.csv(teamwins, "teamwins.csv", row.names = FALSE)
teamwins <- read.csv("teamwins.csv",stringsAsFactors = FALSE)

# Filtrando segunda base de datos.
teamwins$Year <- as.numeric(teamwins$Year)
teamwins <- filter(teamwins, !is.na(teamwins$Year))

#Datos entre 2005 y 2010
teamwins <- filter(teamwins, Year>2006 & Year<2014)

# Reacomodando los datos

# Primero generamos una variable year_games que colapsa años y juegos
teamwins <- unite(teamwins, year_games, Year, G)

# Usamos gather para colapsar columnas de wins por cada team

teamwins2 <- gather(data=teamwins, value=wins, key=team, ARI,ATL,BLA,BAL,BOS,CHC,CHW,CIN,CLE,COL,DET,HOU,KCR,LAA,LAD,MIA,MIL,MIN,NYM,NYY,OAK,PHI,PIT,SDP,SFG,SEA,STL,TBR,TEX,TOR,WSN)
head(teamwins2)

# Nuevamente separamos años y juegos
teamwins2 <- separate(teamwins2,year_games, c("year", "games"))
head(teamwins2)

# Convertir algunas variables a numéricas
teamwins2$games <- as.numeric(teamwins2$games)
teamwins2$wins <- as.numeric(teamwins2$wins)
teamwins2$year <- as.numeric(teamwins2$year)

# Obtenemos el porcentaje de ganados
teamwins2$pctwin <- teamwins2$wins/teamwins2$games*100
teamwins2 <- arrange(teamwins2,pctwin)

# Estadísticos y clasificación
summary(teamwins2)
head(teamwins2)
tail(teamwins2)

#Eliminando NA
teamwins2 <- filter(teamwins2, !is.na(pctwin))
tail(teamwins2)

# Uniendo base de datos

#Homologación de códigos
salaries$Team[salaries$Team=="SF"] = "SFG"
salaries$Team[salaries$Team=="KC"] = "KCR"
salaries$Team[salaries$Team=="SD"] = "SDP"
salaries$Team[salaries$Team=="TB"] = "TBR"
salaries$Team[salaries$Team=="WSH"] = "WSN"
salaries$Team[salaries$Team=="CWS"] = "CHW"

# Homologar nombre de la columna a Team
teamwins2$Team <- as.character(teamwins2$team)
teamwins2 <- select(teamwins2, -team)

# Uniendo por year y Team.
merged <- inner_join(teamwins2, salaries,by=c("year", "Team"))
summary(merged)

write.csv(merged, "database2005_2010.csv", row.names = FALSE)

# Algunas Gráficas

library(ggplot2)
ggplot(data=merged, aes(x=payroll,y=pctwin, label=Team, color=as.factor(year)))+ geom_text(size=3) +
  ggtitle("Payroll and performance of MLB teams, 2007-2013") + 
  xlab("Payroll in millions") + ylab("Percent of games won") +
  scale_color_discrete(name="year") + theme_minimal()

ggplot(data=merged, aes(x=top20share,y=pctwin, label=Team, color=as.factor(year))) + geom_text(size=3) +
  ggtitle("Team inequality and performance of MLB teams, 2007-2013") + 
  xlab("Share of payroll earned by top 20%") + ylab("Percent of games won") +
  scale_color_discrete(name="year") + theme_minimal()

# Regresión

library(stargazer)

model1 <- lm(pctwin ~ top20share, data=merged)
model2 <- lm(pctwin ~ top20share + payroll, data=merged)
model3 <- lm(pctwin ~ top20share + log(payroll) , data=merged)

stargazer(model1,model2,model3, type="text")