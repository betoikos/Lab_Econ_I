
install.packages("wooldridge")
library("wooldridge")
install.packages("AER")
library(AER)
install.packages("stargazer")
library(stargazer)
install.packages("car")
library(car)


#ejercicio 1####
ej1<-wooldridge::wage2
fs<-lm(educ~ sibs, data=ej1)
stargazer(fs)
stargazer(fs,  type = "text" )
ivss<-ivreg(formula = lwage ~ educ | sibs , data = ej1)
stargazer(ivss,  type = "text" )
stargazer(ivss)


#inciso 1
mcos<-lm(lwage~ sibs, data=ej1)
stargazer(mcos,  type = "text" )
stargazer(mcos)

#inciso 2
mcobo<-lm(educ~ brthord, data=ej1)
stargazer(mcobo,  type = "text" )
stargazer(mcobo)

#inciso 3
ivbo<-ivreg(formula = lwage ~ educ | brthord , data = ej1)
stargazer(ivbo,  type = "text" )
stargazer(ivbo)

#inciso 4
mco_sb<-lm(educ~ sibs +brthord, data=ej1)
stargazer(mco_sb,  type = "text" )
stargazer(mco_sb)

#inciso 5
ivbos<-ivreg(formula = lwage ~ educ + sibs | brthord + sibs, data = ej1)
stargazer(ivbos,  type = "text" )
stargazer(ivbos)

#inciso 6
length(mco_sb$fitted.values)
length(ej1$sibs) # nos damos cuenta que no son del mismo tamaÃ±o

library(dplyr)
com_cases=ej1 %>%
  select(lwage, educ, brthord, sibs)


com_cases=com_cases[complete.cases(com_cases), ]
length(com_cases$sibs)

cor(mco_sb$fitted.values, com_cases$sibs )


#ejercicio 2####

ej2<-wooldridge::fertil2

#inciso 1
ej2$age2=ej2$age^2
mcoch<-lm(children~ educ+age+age2,  data=ej2)
stargazer(mcoch,  type = "text" )
stargazer(mcoch)

#inciso 2
mcoeduc_first<-lm(educ~ frsthalf,  data=ej2)
stargazer(mcoeduc_first,  type = "text" )
stargazer(mcoeduc_first)

#inciso 3
iv_chil<-ivreg(formula = children ~ educ+age+age2 | frsthalf+age+age2, data = ej2)
stargazer(iv_chil,  type = "text" )
stargazer(iv_chil)

#inciso 4
mluz<-lm(children~ educ+age+age2+electric+tv+bicycle,  data=ej2)
iv_luz<-ivreg(formula = children ~ educ+age+age2+electric+tv+bicycle | frsthalf+age+age2+electric+tv+bicycle, data = ej2)
stargazer(mluz, iv_luz ,  type = "text" )
stargazer(mluz, iv_luz  )


#ejercicio 3 ####

ej3<-wooldridge::card

#inciso 1
## sí podrían estar correlacionadas. (trampa de pobreza)

#inciso 2
mcoiqnc4<-lm(IQ~ nearc4,  data=ej3)
stargazer(mcoiqnc4,  type = "text" )
stargazer(mcoiqnc4)

#inciso 3
mcoiqnc4p<-lm(IQ~ nearc4+smsa66+reg662+reg663+reg664+reg665+reg666+reg667+reg668+reg669,  data=ej3)
stargazer(mcoiqnc4p,  type = "text" )
stargazer(mcoiqnc4p)

#inciso 4 
## sí. 

#ejercicio 4 ####

ej4<-wooldridge::intdef

#inciso 1
mcoinf3<-lm(i3~inf, data=data.frame(ej4[-1,]))
stargazer(mcoinf3,  type = "text" )
stargazer(mcoinf3)

#inciso 2
mcoinf3r<-ivreg(i3~inf | inf_1 , data=ej4)
stargazer(mcoinf3r,  type = "text" )
stargazer(mcoinf3r)

#inciso 3
ej4$diffi3<-ej4$i3-ej4$i3_1
ej4$diffinf<-ej4$inf-ej4$inf_1
mcoinf3d<-lm(diffi3~diffinf, data=ej4)
stargazer(mcoinf3d,  type = "text" )
stargazer(mcoinf3d)

#inciso 4
ej4ts<-ts(ej4, start=c(1948), end=c(2003))
mcoinfdif<-lm(diff(inf)~diff(inf_1), data=ej4ts)
stargazer(mcoinfdif,  type = "text" )
stargazer(mcoinfdif)