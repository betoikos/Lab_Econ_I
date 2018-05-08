# Sesión 4
## Índice
### Extracción de bases de datos de una página web
### Trabajando con bases de datos
### Unión de bases de datos
### Gráficas de bases de datos 
### Analisis de regresión 

Se necesita instalar los siguientes paquetes y llamar las siguientes librerias

    #install.packages("dplyr")
    #install.packages("tidyr")
    #install.packages("RCurl")
    #install.packages("httr")
    # install.packages("ggplot2")
    # install.packages("stargazer")

    library(XML)
    library(dplyr)
    library(tidyr)
    library(httr)

# Extracción de bases de datos  de una página web
 Extraemos las bases de datos que están en una página electrónica

    sal2018 <- GET("http://www.usatoday.com/sports/mlb/salaries/2018/player/all/#card_full_width_main")
    sal2018 <- readHTMLTable(rawToChar(sal2018$content))[[1]]

    sal2017 <- GET("http://www.usatoday.com/sports/mlb/salaries/2017/player/all/#card_full_width_main")
    sal2017 <- readHTMLTable(rawToChar(sal2017$content))[[1]]

    sal2016 <- GET("http://www.usatoday.com/sports/mlb/salaries/2016/player/all/#card_full_width_main")
    sal2016 <- readHTMLTable(rawToChar(sal2016$content))[[1]]

    # problema con este año
    # sal2015 <- GET("/MLBSalaries2015.html")
    sal2015 <- readHTMLTable("MLBSalaries2015.html")[[1]]

    sal2014 <- GET("http://www.usatoday.com/sports/mlb/salaries/2014/player/all/#card_full_width_main")
    sal2014 <- readHTMLTable(rawToChar(sal2014$content))[[1]]

    sal2013 <- GET("http://www.usatoday.com/sports/mlb/salaries/2013/player/all/#card_full_width_main")
    sal2013 <- readHTMLTable(rawToChar(sal2013$content))[[1]]

    sal2012 <- GET("http://www.usatoday.com/sports/mlb/salaries/2012/player/all/#card_full_width_main")
    sal2012 <- readHTMLTable(rawToChar(sal2012$content))[[1]]

    sal2011 <- GET("http://www.usatoday.com/sports/mlb/salaries/2011/player/all/#card_full_width_main")
    sal2011 <- readHTMLTable(rawToChar(sal2011$content))[[1]]

# Trabajando con las bases de datos
Asignamos el año

     sal2018$year <- 2018
     sal2017$year <- 2017
     sal2016$year <- 2016
     sal2015$year <- 2015
     sal2014$year <- 2014
     sal2013$year <- 2013
     sal2012$year <- 2012
     sal2011$year <- 2011


Now we can append the four data frames. We should drop the rank variable which was not read from the website.
 
    salaries <- bind_rows(sal2018,sal2017,sal2016,sal2015,sal2014,sal2013,sal2012,sal2011)
     salaries <- select(salaries, -rank)

     write.csv(salaries, "salaries.csv", row.names = FALSE
     
Selecting observations and variables

    salaries <- read.csv("salaries.csv")

    salaries <- select(salaries, year, Salary, Name, Team)
    str(salaries)

 We also see that Salary is a character with dollar signs and commas. 
Let’s strip all the punctuation from Salary, and turn it into a numerical variable.

    salaries$Salary <- as.numeric(gsub("[[:punct:]]","",salaries$Salary))
    summary(salaries$Salary)

Los ceros son sospechosos

    salaries <- arrange(salaries, Salary)
    head(salaries, n=5)
    tail(salaries, n=5)

    salaries <- filter(salaries, Salary != 0)
    salaries <- arrange(salaries, Salary)
    head(salaries, n=5)

### Agregación por grupos

Se acomodan por quintiles

    salaries <- salaries %>% group_by(year, Team ) %>% mutate(payroll=sum(Salary), pctile=ntile(Salary,5))
    salaries <- arrange(salaries, Salary)
    head(salaries, n=3)

 Nos quedamos con el quintil más alto
 
    salaries <- filter(salaries, pctile==5)
    salaries <- arrange(salaries, Salary)
    head(salaries, n=3)

 Since now we only have players in the top 20% we can aggregate/summarize the data by year and Team.

salaries <- salaries %>% group_by(year, Team, payroll) %>% summarize(top20=sum(Salary))
salaries$top20share <- salaries$top20/salaries$payroll*100 

 Let’s put payroll in millions rather than dollars. It will make the magnitude of our regression coefficients easier to read. 
 Let’s also check some descriptive statistics on top20share.

    salaries$payroll <- salaries$payroll/1000000
    summary(salaries)

    salaries <- arrange(salaries, top20share)
    head(salaries, n=3)
    tail(salaries, n=3)


 Convertimos la variable Team en string

    salaries$Team <- as.character(salaries$Team)


 Get the data on team performance, data retrieval


    teamwins <- GET("http://www.baseball-reference.com/leagues/MLB/#teams_team_wins3000::none")
    teamwins <- readHTMLTable(rawToChar(teamwins$content), stringsAsFactors = FALSE)[[1]]

    write.csv(teamwins, "teamwins.csv", row.names = FALSE)
    teamwins <- read.csv("teamwins.csv",stringsAsFactors = FALSE)

quedandonos sólo con lo que nos sirve

         teamwins$Year <- as.numeric(teamwins$Year)
         teamwins <- filter(teamwins, !is.na(teamwins$Year))

Nos quedaremos sólo con los datos de 2013 en adelante

     teamwins <- filter(teamwins, Year>2012)


 ### Reacomodando los datos

Primero generamos una variable year_games que colapsa años y juegos

     teamwins <- unite(teamwins, year_games, Year, G)

Usamos gather para colapsar columnas de wins por cada team

     teamwins2 <- gather(data=teamwins, value=wins, key=team, ARI,ATL,BLA,BAL,BOS,CHC,CHW,CIN,CLE,COL,DET,HOU,KCR,LAA,LAD,MIA,MIL,MIN,NYM,NYY,OAK,PHI,PIT,SDP,SFG,SEA,STL,TBR,TEX,TOR,WSN)
     head(teamwins2)

Nuevamente separamos años y juegos

     teamwins2 <- separate(teamwins2,year_games, c("year", "games"))
     head(teamwins2)

 Convertimos algunas a numéricas

     teamwins2$games <- as.numeric(teamwins2$games)
     teamwins2$wins <- as.numeric(teamwins2$wins)
     teamwins2$year <- as.numeric(teamwins2$year)

Obtenemos el porcentaje de ganados

    teamwins2$pctwin <- teamwins2$wins/teamwins2$games*100
    teamwins2 <- arrange(teamwins2,pctwin)

Vemos estadísticos, top y bottom 

    summary(teamwins2)
    head(teamwins2)
    tail(teamwins2)

Tenemos algunos NA (“BLA” which is a code baseball-reference.com used for Baltimore Orioles in 1901 and 1902. The new code for the Orioles is “BAL”. We will drop observations that have NA for winning percentage (i.e. we drop team “BLA”).)

    teamwins2 <- filter(teamwins2, !is.na(pctwin))
    tail(teamwins2)


# Uniendo bases de datos 

### salaries y teamwins 2 serán matcheadas por year y team.

Primero tenemos que homologar los códigos

    salaries$Team[salaries$Team=="SF"] = "SFG"
    salaries$Team[salaries$Team=="KC"] = "KCR"
    salaries$Team[salaries$Team=="SD"] = "SDP"
    salaries$Team[salaries$Team=="TB"] = "TBR"

    salaries$Team[salaries$Team=="WSH"] = "WSN"
    salaries$Team[salaries$Team=="CWS"] = "CHW"

Homologando el nombre de la columna a Team

    teamwins2$Team <- as.character(teamwins2$team)
    teamwins2 <- select(teamwins2, -team)

Mergeamos por year y Team.

    merged <- inner_join(teamwins2, salaries,by=c("year", "Team"))
    summary(merged)

    write.csv(merged, "database2013_2018.csv", row.names = FALSE)

#  Gráficas de la base de datos

    library(ggplot2)
    ggplot(data=merged, aes(x=payroll,y=pctwin, label=Team, color=as.factor(year)))+ geom_text(size=3) +
      ggtitle("Payroll and performance of MLB teams, 2013-2018") + 
      xlab("Payroll in millions") + ylab("Percent of games won") +
      scale_color_discrete(name="year") + theme_minimal()

    ggplot(data=merged, aes(x=top20share,y=pctwin, label=Team, color=as.factor(year))) + geom_text(size=3) +
      ggtitle("Team inequality and performance of MLB teams, 2013-2018") + 
      xlab("Share of payroll earned by top 20%") + ylab("Percent of games won") +
      scale_color_discrete(name="year") + theme_minimal()


# Análisis de regresión

    library(stargazer)

 El paquete stargazer crea tablas para html, latex i ascii bien formateadas.
      
      m1 <- lm(pctwin ~ top20share, data=merged)
      m2 <- lm(pctwin ~ top20share + payroll, data=merged)
      m3 <- lm(pctwin ~ top20share + log(payroll) , data=merged)

     stargazer(m1,m2,m3, type="text")
