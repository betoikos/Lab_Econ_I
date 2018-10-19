#####################################################
################### ejercicio 8.5 ###################
############## Constantino Carreto ##################
#####################################################

# limpiamos espacio de trabajo
rm(list=ls())

#paquete para hacer inferencia robusta:
# load necessary packages for importing the function
library(RCurl)
# import the function
url_robust <- "https://raw.githubusercontent.com/IsidoreBeautrelet/economictheoryblog/master/robust_summary.R"
eval(parse(text = getURL(url_robust, ssl.verifypeer = FALSE)),
     envir=.GlobalEnv)

# Cargamos la libreria y la base de datos
library("wooldridge")

#otras librerias
library(tidyverse)
library("stargazer")
library(car)

################## EJERCICIO 8.5
data("pntsprd")
help(pntsprd)
glimpse(pntsprd)


#i)
#utilizamos el hint
reg1<-lm(formula=sprdcvr~1, data = pntsprd )
summary(reg1)

#hacemos la prueba t de forma manual
#El estadistico t asintótico bajo Ho es:
(0.51537 - 0.5)/0.02127 
# lo comparamos con t en tablas
#se nos dice nivel de signficancia= 10% y gl=552
paste0("Zona de rechazo", " : ", qt(0.05, 552)," & ", qt(0.05, 552))
# por lo tanto, rechazamos Ho al nivel de signficancia = 0.10

#ii)
glimpse(pntsprd)
sum(pntsprd$neutral)


#iii)
reg2<-lm(sprdcvr ~ favhome+neutral+fav25+und25 ,data = pntsprd)
sum1<-summary(reg2)
sum2<-summary(reg2, robust = T)
sum1$coefficients[,1:4]
sum2$coefficients[,1:4]

#iv)

#v)
Hnull <- c("favhome=0", "neutral=0", "fav25=0", "und25=0")
linearHypothesis(reg2,Hnull)
#no podemos rechazar Ho: hipótesis nula
summary(reg2) 

#vi)
