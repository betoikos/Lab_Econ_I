# Ejercicio de b??isbol en R con datos de 2008-2013
# Susana Almeida Mart??nez
# Utilic?? exactamente el mismo c??digo de la clase solo modificando los datos
getwd()

# Para fijar el directorio de trabajo deben usar el codigo de abajo. 
# Utilicen el directorio de la carpeta con su nombre

setwd("/Users/Almeida/Documents/GitHub/Lab_Econ_I/Almeida_AS")

# Verificar que el directorio se fijo correctamente
getwd()

install.packages("dplyr")
install.packages("tidyr")
#install.packages("RCurl")
#install.packages("httr")
# install.packages("ggplot2")
# install.packages("stargazer")

library(XML)
library(dplyr)
library(tidyr)
library(httr)

# ------------------
# 1. Retrieving data

sal2013 <- GET("https://www.usatoday.com/sports/mlb/salaries/2013/player/all/#card_full_width_main")
sal2013 <- readHTMLTable(rawToChar(sal2013$content))[[1]]

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


# Asignamos el anio

sal2013$year <- 2013
sal2012$year <- 2012
sal2011$year <- 2011
sal2010$year <- 2010
sal2009$year <- 2009
sal2008$year <- 2008


# Now we can append the four data frames. We should drop the rank variable which was not read from the website.
salaries <- bind_rows(sal2013,sal2012,sal2011,sal2010,sal2009,sal2008)
salaries <- select(salaries, -rank)

write.csv(salaries, "salaries.csv", row.names = FALSE)



# ------------------
# 2. Selecting observations and variables
salaries <- read.csv("salaries.csv")

salaries <- select(salaries, year, Salary, Name, Team)
str(salaries)

# We also see that Salary is a character with dollar signs and commas. 
#Let???s strip all the punctuation from Salary, and turn it into a numerical variable.

salaries$Salary <- as.numeric(gsub("[[:punct:]]","",salaries$Salary))
summary(salaries$Salary)

# Los ceros son sospechosos

salaries <- arrange(salaries, Salary)
head(salaries, n=5)
tail(salaries, n=5)


# ------------------
# Aggregating by groups

# Se acomodan por quintiles
salaries <- salaries %>% group_by(year, Team ) %>% mutate(payroll=sum(Salary), pctile=ntile(Salary,5))
salaries <- arrange(salaries, Salary)
head(salaries, n=3)

# Nos quedamos con el quintil m??s alto
salaries <- filter(salaries, pctile==5)
salaries <- arrange(salaries, Salary)
head(salaries, n=3)

# Since now we only have players in the top 20% we can aggregate/summarize the data by year and Team.
salaries <- salaries %>% group_by(year, Team, payroll) %>% summarize(top20=sum(Salary))
salaries$top20share <- salaries$top20/salaries$payroll*100 

# Let???s put payroll in millions rather than dollars. It will make the magnitude of our regression coefficients easier to read. 
# Let???s also check some descriptive statistics on top20share.
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

# quedandonos solo con lo que nos sirve
teamwins$Year <- as.numeric(teamwins$Year)
teamwins <- filter(teamwins, !is.na(teamwins$Year))

#Nos quedaremos solo con los datos de 2008-2013
teamwins <- filter(teamwins, Year>2008 & Year<2013)


# ---------------------------------------------------
# Reacomodando los datos

# Primero generamos una variable year_games que colapsa a??os y juegos
teamwins <- unite(teamwins, year_games, Year, G)

# Usamos gather para colapsar columnas de wins por cada team

teamwins2 <- gather(data=teamwins, value=wins, key=team, ARI,ATL,BLA,BAL,BOS,CHC,CHW,CIN,CLE,COL,DET,HOU,KCR,LAA,LAD,MIA,MIL,MIN,NYM,NYY,OAK,PHI,PIT,SDP,SFG,SEA,STL,TBR,TEX,TOR,WSN)
head(teamwins2)

# Nuevamente separamos a??os y juegos
teamwins2 <- separate(teamwins2,year_games, c("year", "games"))
head(teamwins2)

# Convertimos algunas a num??ricas

teamwins2$games <- as.numeric(teamwins2$games)
teamwins2$wins <- as.numeric(teamwins2$wins)
teamwins2$year <- as.numeric(teamwins2$year)

# Obtenemos el porcentaje de ganados
teamwins2$pctwin <- teamwins2$wins/teamwins2$games*100
teamwins2 <- arrange(teamwins2,pctwin)

# Vemos estad??sticos, top y bottom 
summary(teamwins2)
head(teamwins2)
tail(teamwins2)

# Tenemos algunos NA
# ???BLA??? which is a code baseball-reference.com used for Baltimore Orioles in 1901 and 1902. The new code for the Orioles is ???BAL???. 
# We will drop observations that have NA for winning percentage (i.e. we drop team ???BLA???).

teamwins2 <- filter(teamwins2, !is.na(pctwin))
tail(teamwins2)

# --------------------------------------------------------
# Merging data sets

# salaries y teamwins 2 ser??n matcheadas por year y team.

#Primero tenemos que homologar los c??digos
salaries$Team[salaries$Team=="SF"] = "SFG"
salaries$Team[salaries$Team=="KC"] = "KCR"
salaries$Team[salaries$Team=="SD"] = "SDP"
salaries$Team[salaries$Team=="TB"] = "TBR"

salaries$Team[salaries$Team=="WSH"] = "WSN"
salaries$Team[salaries$Team=="CWS"] = "CHW"

# Homologando el nombre de la columna a Team
teamwins2$Team <- as.character(teamwins2$team)
teamwins2 <- select(teamwins2, -team)

# Mergeamos por year y Team.
merged <- inner_join(teamwins2, salaries, by=c("year","Team"))
summary(merged)

write.csv(merged, "database2010_2005.csv", row.names = FALSE)
# --------------------------------------
# 7. Graphing data

library(ggplot2)
ggplot(data=merged, aes(x=payroll,y=pctwin, label=Team, color=as.factor(year)))+ geom_text(size=3) +
  ggtitle("Payroll and performance of MLB teams, 2008-2013") + 
  xlab("Payroll in millions") + ylab("Percent of games won") +
  scale_color_discrete(name="year") + theme_minimal()

ggplot(data=merged, aes(x=top20share,y=pctwin, label=Team, color=as.factor(year))) + geom_text(size=3) +
  ggtitle("Team inequality and performance of MLB teams, 2013-2008") + 
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
