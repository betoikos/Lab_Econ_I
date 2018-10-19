#####################################################
################### ejercicio 8.7 ###################
#####################################################

# limpiamos espacio de trabajo
rm(list=ls())

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


################## EJERCICIO 8.7
data("loanapp")
glimpse(loanapp)
help(loanapp)


#i) calculamos regresion de approve sobre white y otros controles, por MCO
reg_mco<- lm( approve ~ white+hrat+obrat+loanprc+unem+male+married+
             dep+sch+cosign+chist+pubrec+mortlat1+mortlat2+vr, data=loanapp)
summary(reg_mco)
#intervalo de confianza para MCO no robusto
IC_mco<-confint(reg_mco, "white",level = 0.95)

# calculamos regresión robusta 
reg_robust <- summary(reg_mco, robust=TRUE) 

#comparamos coeficientes y errores estandar para white para mco y robustos
summary(reg_mco)$coefficients[1:2,]
reg_robust$coefficients[1:2,]

#intervalo de confianza robusto
#obtenemos valores de distribucion t con 1989-15 gl y 0.05 de nivel 
#de significancia (distribuimos 0.025 en cada cola) y usamos pivote visto en clase
ic.li <- reg_robust$coefficients[2,1] - 1.96 * reg_robust$coefficients[2,2]
ic.ls <- reg_robust$coefficients[2,1] + 1.96 * reg_robust$coefficients[2,2]
IC_robust<-cbind(ic.li, ic.ls)

#intervalos de confianza
IC_mco
IC_robust
#intervalo robusto es mas amplio
#el intervalo no toca al zero

#ii)
summary(reg_mco$fitted.values) 
#no hay menores a cero pero si hay mayores a uno
summary(reg_mco$fitted.values>1)

