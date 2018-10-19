rm(list=ls())
library("wooldridge")
#install.packages("stargazer")
library("stargazer", lib.loc="~/R/win-library/3.5.1")

#Ejercicio 8

data(gpa1)
head(gpa1)
help(gpa1)

#Inciso i) 

#Regresion por MCO
reg1 <- lm(colGPA ~ hsGPA + ACT + skipped + PC, data = gpa1)
summary(reg1)

stargazer(reg1, type = "text")

#Inciso ii)

#Test de White

#Guardamos el R square, los residuales y los valores ajustados
R_sq <- summary(reg1)$r.squared

gpa1$resid = reg1$residuals
gpa1$resid_sq = (gpa1$resid)^2

gpa1$y_hat = reg1$fitted.values
gpa1$y_hat_sq = (gpa1$y_hat)^2

#Estimar por mco
reg2 <- lm(resid_sq ~ y_hat + y_hat_sq, data = gpa1)
summary(reg2)
stargazer(reg2, type = "text")

#Obtener hi_hat con los residuales 
gpa1$hi_hat=reg2$fitted.values

#Inciso iii)

summary(gpa$hi_hat)

#Haciendo la regresion por MCP

reg3 <- lm(colGPA ~ hsGPA + ACT + skipped + PC, weights = 1/hi_hat, data = gpa1)
summary(reg3)

stargazer(reg1, reg3, type = "text")

#Inciso iv)

summary(reg3,robust = T)

se_robust <-as.vector(summary(reg3,robust = T)$coefficients[,"Std. Error"])
se <-as.vector(summary(reg3)$coefficients[,"Std. Error"])

stargazer(se, se_robust, type = "text")

