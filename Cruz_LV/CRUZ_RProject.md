## Proyecto final ##

> #### Luis Valentín Cruz

Véase los ejercicios en el *problem set* correspondiente a cada uno de los ejercicios.

**Ejercicio 1.4** 

>Inciso i: De los datos del problema podemos obtener los resultados siguientes:

    MEANX = c(0,-4,1)
    MEANY = c(-1,4)
    VARX = matrix(c(1,-1,0,-1,4,2,0,2,2),3,3)
    VARY = matrix(c(1,-2,-2,9),2,2)
    COVXY = matrix(c(0,-1,0,1,-3,3),3,2)
    COVYX = t(COVXY)

    > MEANX
    [1]  0 -4  1
    > MEANY
    [1] -1  4
    > VARY
            [,1] [,2]
     [1,]    1   -2
     [2,]   -2    9
     > VARX
            [,1] [,2] [,3]
     [1,]    1   -1    0
     [2,]   -1    4    2
     [3,]    0    2    2
     > COVXY
            [,1] [,2]
     [1,]    0    1
     [2,]   -1   -3
     [3,]    0    3
     > COVYX
            [,1] [,2] [,3]
     [1,]    0   -1    0
     [2,]    1   -3    3

>Inciso ii: Con los datos de inciso i podemos observar que se pide calcular la esperanza y la varianza de transformaciones lineales del vector X, entonces:

    E21 = c(-1,3/2,-4)%*%MEANX
    E22 = c(-1,3/2,-4)%*%VARX%*%c(-1,3/2,-4)
    > E21
          [,1]
     [1,]  -10
    > E22
          [,1]
     [1,]   21
Nota: Cada uno de los ejercicios se denotan con la letra E seguido del número de ejercicio y de número de inciso.

> Inciso iii: 
    
    A = matrix(c(-2,1,0,4,1,-2),2,3)
    b = c(1,1)

    E31 = A%*%MEANX + b
    E32 = A%*%VARX%*%t(A)
    > E31
           [,1]
     [1,]    2
     [2,]  -17
     > E32
           [,1] [,2]
     [1,]    6   10
     [2,]   10   33

>Inciso iv: Reescribiendo U = GX + g y V = HX + h como transformaciones lineales del vector X y resolviendo:

    G = matrix(c(1,0,0,0,1,2,-3,0,3),3,3)
    g = c(2,0,5)
    H = matrix(c(1,-1,-1,4,1,-1),2,3)
    h = c(1,0)
    
    E41 = G%*%MEANX + g
    E42 = H%*%MEANX + h
    E43 = G%*%VARX%*%t(G)
    E44 = H%*%VARX%*%t(H)
    E45 = G%*%VARX%*%t(H)
    E46 = t(E45)

     > E41
            [,1]
     [1,]   -1
     [2,]   -4
     [3,]    0
     > E42
            [,1]
     [1,]    6
     [2,]  -17
     > E43
            [,1] [,2] [,3]
     [1,]   19   -7  -32
     [2,]   -7    4   14
     [3,]  -32   14   58
     > E44
            [,1] [,2]
     [1,]    5  -14
     [2,]  -14   59
     > E45
            [,1] [,2]
     [1,]    2  -23
     [2,]   -3   15
     [3,]   -6   48
     > E46
            [,1] [,2] [,3]
     [1,]    2   -3   -6
     [2,]  -23   15   48

>Inciso v: 

    C = c(-2,1,5)
    d = 8

    E51 = A%*%VARX%*%C

    > E51
            [,1]
     [1,]   18
     [2,]   37

>Inciso vi: 

    D = matrix(c(1,2,4,0,-2,3),3,2)
    e = c(1,0,-1)

    E61 = A%*%COVXY%*%t(D) 
    
    > E61
            [,1] [,2] [,3]
     [1,]    0   -2    3
     [2,]   -4   26  -67


>Inciso vii: Notemos que nos piden calcular la varianza de una transformación lineal de X, Var(JX)

    J = matrix(c(-1,1,0,2,-4,0),2,3)

    E71 = J%*%VARX%*%t(J)

    > E71
          [,1] [,2]
    [1,]   33  -15
    [2,]  -15   13

>Ejercicio viii: Podemos reescribir W y Z como W = KX + k y Z = LX

    K = matrix(c(-1,1,0,2,-4,0),2,3)
    k = c(0,-1)
    L = matrix(c(1,0,1,1,1,-1),3,2)

    E81 = K%*%COVXY%*%t(L)
    E82 = L%*%COVYX%*%t(K)

    > E81
           [,1] [,2] [,3]
     [1,]  -13  -13   13
     [2,]   -7   -5    3
     > E82
          [,1] [,2]
    [1,]  -13   -7
    [2,]  -13   -5
    [3,]   13    3

**Ejercicio 1.6**

    MEANZ = matrix(c(1,0,2),3,1)
    VARZ = matrix(c(0.8,0.4,-0.2,0.4,1,-0.8,-0.2,-0.8,2),3,3)
    MEANX = matrix(c(0,2),2,1)

>Inciso i 

    VARY = VARZ[1,1]
    VARX = matrix(c(1,-0.8,-0.8,2),2,2)
    COVYX = matrix(c(0.4,-0.2),1,2)
    COVXY = t(COVYX)
    
    > VARY
    [1] 0.8
    > VARX
          [,1] [,2]
     [1,]  1.0 -0.8
     [2,] -0.8  2.0
     > COVYX
          [,1] [,2]
     [1,]  0.4 -0.2
     > COVXY
           [,1]
     [1,]  0.4
     [2,] -0.2
     
>Inciso ii: Notar que para resolver algunos ejercicios hemos utilizado la definición de VAR(X) y COV(X,Y)

    EY2 = VARZ[1,1] + MEANZ[1,1]
    EXXT = MEANX%*%t(MEANX) + VARX
    EXTX = EXXT[1,1] + EXXT[2,2]
    EYXT = MEANZ[1,1]%*%t(MEANX) + COVYX
    EXY = t(EYXT)
    
    > EY2
    [1] 1.8
    > EXXT
         [,1] [,2]
     [1,]  1.0 -0.8
     [2,] -0.8  6.0
     > EXTX
     [1] 7
     > EYXT
           [,1] [,2]
     [1,]  0.4  1.8
     > EXY
           [,1]   
     [1,]  0.4
     [2,]  1.8
     
**Ejercicio 2.5**

    library(MASS)

    Función para mínimos cuadrados ordinarios:
    
    Inputs:
    b: vector de constantes de kx1
    X: matriz de constantes nxk
    U: vector aleatorio de nx1 con distribución normal multivariada N(0,sigmasquare*I)
    Y = Xb + U

    En función de U:
    
    f1bmco = function(b,X,U){
    bmco = b + solve(t(X)%*%X)%*%t(X)%*%U
    return(bmco) }
    
    En función de Y:

    f2bmco = function(X,Y){
    bmco = solve(t(X)%*%X)%*%t(X)%*%Y
    return(bmco)}

    Función para mínimos cuadrados reestringidos

    Inputs:
    b: vector de constantes de kx1
    X: matriz de constantes nxk
    U: vector aleatorio de nx1 con distribución normal multivariada N(0,sigmasquare*I)
    Y = Xb + U 
    R: matriz de constantes kxk

    fbmcr = function(b,R,X,U){
    bmco = b + solve(t(X)%*%X)%*%t(X)%*%U
    r = R%*%b
    bmcr = bmco - solve(t(X)%*%X)%*%t(R)%*%solve(R%*%solve(t(X)%*%X)%*%t(R))%*%(R%*%bmco - r)
    }
**Ejercicio 3.5**

Con los datos de este ejercicio podemos generar una muestra aleatoria normal utilizando el siguiente código:

    library(MASS)
    n = 100
    MEAN = c(0,-1,-2,0,2)
    VAR = matrix(c(1,-1/4,0,0,0,-1/4,1/2,0,0,0,0,0,1,1/3,-1/2,0,0,1/3,1/4,0,0,0,-1/2,0,1),5,5)
    
    sample = mvrnorm(n,MEAN,VAR)
    sample 
**Ejercicio 3.6**

Con los datos de este ejercicio podemos generar otra muestra aleatoria normal con el siguiente código:

    library(MASS)
    n = 200
    MEAN = c(0,0,1,1)
    VAR = matrix(c(1,0,1,0,0,9,0,1,1,0,4,0,0,1,0,9),4,4)
    sample = mvrnorm(n,MEAN,VAR)

**Réplica de ejercicio de laboratorio**
> Reproducir el siguiente código

    #Réplica de resultados de "Does pay inequality within a team affect performance?"
    #Basado en el procedimiento de Humberto Martínez García

    getwd()
    setwd("C://Users/Luis Valentin Cruz/Documents/GitHub/Lab_Econ_I/Cruz_LV/HW14")

    # Verificar que el directorio se fijó correctamente
    getwd()

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

    # ------------------
    #Se obtuvieron los datos para antes del 2011

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


    # Asignamos el año

    sal2010$year <- 2010
    sal2009$year <- 2009
    sal2008$year <- 2008
    sal2007$year <- 2007
    sal2006$year <- 2006
    sal2005$year <- 2005


    # Now we can append the four data frames. We should drop the rank variable which was not read from the website.
    salaries <- bind_rows(sal2010,sal2009,sal2008,sal2007,sal2006,sal2005)
    salaries <- select(salaries, -rank)

    write.csv(salaries, "salaries.csv", row.names = FALSE)



    # ------------------
    # 2. Selecting observations and variables
    salaries <- read.csv("salaries.csv")

    salaries <- select(salaries, year, Salary, Name, Team)
    str(salaries)

    # We also see that Salary is a character with dollar signs and commas. 
    #Let años strip all the punctuation from Salary, and turn it into a numerical variable.

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

    # Nos quedamos con el quintil más alto
    salaries <- filter(salaries, pctile==5)
    salaries <- arrange(salaries, Salary)
    head(salaries, n=3)

    # Since now we only have players in the top 20% we can aggregate/summarize the data by year and Team.
    salaries <- salaries %>% group_by(year, Team, payroll) %>% summarize(top20=sum(Salary))
    salaries$top20share <- salaries$top20/salaries$payroll*100 

    # Letâs put payroll in millions rather than dollars. It will make the magnitude of our regression coefficients easier to read. 
    # Letâs also check some descriptive statistics on top20share.
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

    #Nos quedaremos solo con los datos de 2013 en adelante
    teamwins <- filter(teamwins, Year>2004 & Year<2011)


    # ---------------------------------------------------
    # Reacomodando los datos

    # Primero generamos una variable year_games que colapsa años y juegos
    teamwins <- unite(teamwins, year_games, Year, G)

    # Usamos gather para colapsar columnas de wins por cada team

    teamwins2 <- gather(data=teamwins, value=wins, key=team, ARI,ATL,BLA,BAL,BOS,CHC,CHW,CIN,CLE,COL,DET,HOU,KCR,LAA,LAD,MIA,MIL,MIN,NYM,NYY,OAK,PHI,PIT,SDP,SFG,SEA,STL,TBR,TEX,TOR,WSN)
    head(teamwins2)

    # Nuevamente separamos años y juegos
    teamwins2 <- separate(teamwins2,year_games, c("year", "games"))
    head(teamwins2)

    # Convertimos algunas a numericas

    teamwins2$games <- as.numeric(teamwins2$games)
    teamwins2$wins <- as.numeric(teamwins2$wins)
    teamwins2$year <- as.numeric(teamwins2$year)

    # Obtenemos el porcentaje de ganados
    teamwins2$pctwin <- teamwins2$wins/teamwins2$games*100
    teamwins2 <- arrange(teamwins2,pctwin)

    # Vemos estadísticos, top y bottom 
    summary(teamwins2)
    head(teamwins2)
    tail(teamwins2)

    # Tenemos algunos NA
    # âBLAâ which is a code baseball-reference.com used for Baltimore Orioles in 1901 and 1902. The new code for the Orioles is âBALâ. 
    # We will drop observations that have NA for winning percentage (i.e. we drop team âBLAâ).

    teamwins2 <- filter(teamwins2, !is.na(pctwin))
    tail(teamwins2)

    # --------------------------------------------------------
    # Merging data sets

    # salaries y teamwins 2 serán matcheadas por year y team.

    #Primero tenemos que homologar los cÃ³digos
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
    ggtitle("Payroll and performance of MLB teams, 2010-2005") + 
    xlab("Payroll in millions") + ylab("Percent of games won") +
    scale_color_discrete(name="year") + theme_minimal()

    ggplot(data=merged, aes(x=top20share,y=pctwin, label=Team, color=as.factor(year))) + geom_text(size=3) +
    ggtitle("Team inequality and performance of MLB teams, 2010-2005") + 
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

> Resultados

    =============================================================================
                                            Dependent variable:                        
                    -------------------------------------------------------------
                                                  pctwin                               
                            (1)                   (2)                     (3)          
     ----------------------------------------------------------------------------

    top20share                -0.111                 0.002              -0.036         
                              (0.072)               (0.070)             (0.068)        
                                                                                       
     payroll                                        0.083***                                
                                                    (0.015)                                
                                                                                       
    log(payroll)                                                        6.054***        
                                                                        (1.108)        
                                                                                       
    Constant                 56.351***             42.905***            25.748***       
                            (4.269)                (4.585)              (6.860)        
                                                                                       
    -----------------------------------------------------------------------------
    Observations                180                   180                  180          
    R2                         0.013                 0.167                0.155         
    Adjusted R2                0.008                 0.157                0.146         
    Residual Std. Error  6.438 (df = 178)      5.933 (df = 177)  5.972 (df = 177)    
    F Statistic 2.356 (df = 1;178) 17.689*** (df = 2;177) 16.293*** (df = 2;177)

    =============================================================================
    Note:                                            *p<0.1; **p<0.05; ***p<0.01

*Del modelo 1:* un aumento de un millón de dólares más que se paga al quintil de los mejor pagados, el porcentaje de juegos ganados disminuye 0.11, este coeficiente no estadísticamente significativo.

*Del modelo 2:* un aumento de un millón de dólares en la nómina del equipo incrementa 0.083% la cantidad de juegos ganados, el coeficiente es significativo al 0.01%, por otra parte, a diferencia del modelo anterior, cuando los jugadores mejor pagados ganan más también incrementa la cantidad de juegos ganados en 0.002% aunque en este caso el coeficiente no estadísticamente significativo.

*Del modelo 3:* un aumento de un millón de dólares más que se paga al quintil de los mejor pagados, el porcentaje de juegos ganados disminuye 0.036 este coeficiente no es significativo, el que es significativo es cuando se aumenta uno por ciento la nómina de los jugadores, la cantidad de juegos ganados aumenta 6%. 

El modelo que presenta un mayor coeficiente de determinación es el modelo dos, seguido del modelo tres. Sin embargo, este coeficiente es muy pequeño en ambos casos.
