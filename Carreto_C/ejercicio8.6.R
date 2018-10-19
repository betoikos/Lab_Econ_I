#####################################################
################### ejercicio 8.6 ###################
#####################################################

# limpiamos espacio de trabajo
rm(list=ls())

# load necessary packages for importing the function
library(RCurl)

# import the function
url_robust <- "https://raw.githubusercontent.com/IsidoreBeautrelet/economictheoryblog/master/robust_summary.R"
eval(parse(text = getURL(url_robust, ssl.verifypeer = FALSE)),
     envir=.GlobalEnv)

# Cargamos la librerÃ�a y la base de datos
library("wooldridge")

#otras librerias
library(tidyverse)
library(car)

################## EJERCICIO 8.6
data("crime1")
glimpse(crime1)
help(crime1)

# i) estimamos modelo de probabilidad lineal
#creamos varible: fue arrestado?
crime1$arr86[crime1$narr86>0]=1
crime1$arr86[crime1$narr86==0]=0
reg_mco<-lm(formula= arr86 ~ pcnv+avgsen+tottime+ptime86+qemp86, data = crime1 )
y_hat<-reg_mco$fitted.values
head(y_hat)
summary(y_hat)
#todos los valores estan en (0,1)

#ii)
h<-(y_hat)*(1- y_hat)
reg_mcp<-lm(formula= arr86 ~ pcnv+avgsen+tottime+ptime86+qemp86, data = crime1,
         weights=1/h) 

sum_mcp<-summary(reg_mcp)
sum_mco<-summary(reg_mco) 
sum_mcp$coefficients
sum_mco$coefficients
#la mayoria de los es de mcp son menores
#implica menor tasa de rechazo

#iii) 
Hnull <- c("avgsen=0", "tottime=0")
linearHypothesis(reg_mcp,Hnull)
#calculamos valor critico al 0.05 de significancia
qf(0.95, 2,2725-2 ) 
#caemos en zona de rechazo
