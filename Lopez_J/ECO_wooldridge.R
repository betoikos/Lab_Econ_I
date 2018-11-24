#################################### Ejercicios Wooldridge ################################

#install.packages("wooldridge")
#install.packages("stargazer")
#install.packages("doBy")
library(wooldridge)
library(stargazer)
library(doBy)

#############################################################################################################################################################
##############################--------Ejercicio C6----------###################################################################
#################################################################################################################################################################
data("murder")
head(murder)
############################################################################  Punto i)  

# Estados que ejecutaron al menos a un prisionero
coll_base<-summaryBy(exec ~ state, FUN = sum, data= murder )
coll_base2<-coll_base[coll_base$exec.sum>0,]
paste(paste("Son",nrow(coll_base2),sep=" "),"estados con al menos un ejecutado",sep=" ")

# Estado con más ejecuciones
edo<-coll_base[coll_base$exec.sum==max(coll_base$exec.sum),]
paste("El estado con más ejecuciones fue",edo$state,sep=" ")
barplot(coll_base2$exec.sum, main="Número de ejecutados", horiz=TRUE,
        names.arg = coll_base2$state,las=1)

rm(edo,coll_base2,coll_base)

###########################################################################  Punto ii)  
# Regresión

murder_3=murder[murder$d90==1 | murder$d93==1,]
fit1<-lm(mrdrte ~ d93 + exec + unem, data = murder_3)
summary(fit1)
#stargazer(fit1)

# Coeficiente de exec: por cada prisionero ejecutado en el año en curso y 
#los últimos dos años,
#la tasa de homicidios, es decir, el número de homicidios por cada 100,000 personas, 
#se incrementa en aproximadamente 0.1277 puntos porcentuales

##############################################################################  Punto iii)  

murder_4=murder[murder$d93==1,]
fit2<-lm( cmrdrte ~ cexec + cunem, data = murder_4)
#stargazer(fit2)
summary(fit2)
# Efectivamente, parece tener un efecto disuasivo

###############################################################################  Punto iv)  

fit5<-lm( cexec ~ cexec_1, data = murder_4)
#stargazer(fit5)
summary(fit5)

# Estas dos variables parecen estar fuertemente relacionadas. 
#La variable cexec_1 es significativa al 1%
# Si el cambio en las ejecuciones entre 1987 y 1990 se incrementan en 1 unidad, 
#entonces el cambio en la tasa de homicidios se reduce en 1.0824 puntos porcentuales

#############################################################################  Punto iv)
#install.packages("AER")
library(AER)

fitIV<- ivreg( cmrdrte ~ cexec + cunem | cexec_1+cunem, data = murder_4)
#stargazer(fitIV)
summary(fitIV)
# El esfecto se vuelve no significativo.
rm(list=ls())

#################################################################################################################################################################
##################################--------Ejercicio C7----------###################################################################
#################################################################################################################################################################

#############################################################################  Punto iii)

data("phillips")
head(phillips)

fit1<-lm(unem ~ unem_1, data = phillips)
#stargazer(fit1)
summary(fit1)

############################################################################### Punto iv)

#phillips$Yhat<-predict(fit1)
fitbook<-lm(cinf~unem,data=phillips)
fitIV<-ivreg(cinf~unem|unem_1,data=phillips)
summary(fitbook)
summary(fitIV)

#stargazer(fitbook,fitIV)
rm(list=ls())

#################################################################################################################################################################
####################################--------Ejercicio C8----------###################################################################
#################################################################################################################################################################

################################################################################  Punto i)  

data("k401ksubs")
head(k401ksubs)

fit1<-lm( pira ~ p401k + inc + incsq + age + agesq, data = k401ksubs)
summary(fit1)
#stargazer(fit1)

# El participar en un plan de pensión 401(k) incrementa la probabilidad 
# de tener una cuenta individual de retiro en aprox. 0.0588 puntos porc.

##############################################################################  Punto iv)  

library(RCurl)
url_robust <- "https://raw.githubusercontent.com/IsidoreBeautrelet/economictheoryblog/master/robust_summary.R"
eval(parse(text = getURL(url_robust, ssl.verifypeer = FALSE)),
     envir=.GlobalEnv)

fit3<-lm( p401k ~ e401k + inc + incsq + age + agesq, data = k401ksubs)
fit3_sum<-summary(fit3,robust = T)
se_rob<-as.vector(fit3_sum$coefficients[,"Std. Error"])
#stargazer(fit3, fit3, se =list(se_rob),column.labels=c("SE habituales", "SE robustos"))

# Sí hay una correlación positiva. e401 es positiva y significativa al 1%

#############################################################################  Punto v)  

fitIV<-ivreg( pira ~ p401k + inc + incsq + age + agesq|e401k + inc + incsq + age + 
                agesq, data = k401ksubs)
fitIV_sum<-summary(fitIV,robust=T)
se_rob<-as.vector(fitIV_sum$coefficients[,"Std. Error"])
stargazer(fitIV, fitIV, se =list(se_rob),column.labels=c("SE habituales", "SE robustos"))

stargazer(fitIV,fitIV,type = "text",se = list(se_rob))
stargazer(fit1, type="text", title = "Resultados", align = TRUE)

# La variable p401k sigue siendo positiva aunque económicamente inferior. 
# Adicionalmente, ahora es significativa al 5%.

#############################################################################  Punto vi)

k401ksubs$U1<- fit3$residuals
fit5<- lm( pira ~ p401k + inc + incsq + age + agesq + U1, data = k401ksubs)
summary(fit5, robust= T)
se_rob6 <- as.vector(summary(fit5,robust = T)$coefficients[,"Std. Error"])

stargazer(fit5, fit5,se = list(se_rob6))
# Teniendo en cuenta que la variable que aglomera los residuales de la regresión 
# en su forma reducida no es estadísticamente significativa, entonces se concluye 
# que la variable p401k es exógena.

###########################################################################################