rm(list=ls())
library("wooldridge")
library("stargazer", lib.loc="~/R/win-library/3.5.1")

#Ejercicio 9

data("smoke")
head(smoke)
help("smoke")

#Inciso i)
 
#Regresion por MCO
reg1 <- lm(cigs ~ lincome + lcigpric + educ + age + agesq + restaurn ,data=smoke)
summary(reg1)
stargazer(reg1, type = "text")

#Inciso ii) 

#Obtener hi por MPG factibles

#Guardamos residuales
smoke$resid = reg1$residuals
smoke$resid_sq = (smoke$resid)^2

#Estimar por mco
reg2 <- lm(log(resid_sq) ~ lincome + lcigpric + educ + age + agesq + restaurn, data=smoke)
summary(reg2)

#obtener gi_hat y hi_hat

smoke$gi_hat = reg2$fitted.values
smoke$hi_hat = exp(smoke$gi_hat)


#Comprobar que es la h correcta
reg3 <- lm(cigs ~ lincome + lcigpric + educ + age + agesq + restaurn, weights=1/hi_hat, data=smoke)
summary(reg3)

stargazer(reg1, reg3, type = "text")

#Obtener valores ajustados y residuales
smoke$y_i_hat = reg3$fitted.values
smoke$u_i_hat = reg3$residuals
  
#Inciso iii)

smoke$u_bar=smoke$u_i_hat/sqrt(smoke$hi_hat)
smoke$y_bar=smoke$y_i_hat/sqrt(smoke$hi_hat)

smoke$u_bar_sq = (smoke$u_bar)^2
smoke$y_bar_sq = (smoke$y_bar)^2

#Test de White
reg4 <- lm(u_bar_sq ~ y_bar + y_bar_sq, data = smoke)
summary(reg4)


#iv)
#v)