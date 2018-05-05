load("~/Wooldridge datasets/R data sets for 5e/meap93.RData")

library("stats", lib.loc="C:/Program Files/R/R-3.0.1/library")

math10 = matrix(data$math10)

ltotcomp = matrix(data$ltotcomp)
lstaff = matrix(data$lstaff)
lenroll = matrix(data$lenroll)

n = nrow(math10)

unos = matrix(1, nrow = n, ncol=1) # Vector de unos 

X = matrix(c(unos, ltotcomp, lstaff, lenroll),n)


k = ncol(X)

gl = n-k

reg = lm(math10 ~ ltotcomp + lstaff + lenroll)

varu = var(reg$residuals)

betagorro = matrix(c(reg$coefficients[1],reg$coefficients[2],reg$coefficients[3],reg$coefficients[4]),4) #Coeficientes estimados

b0 = betagorro[1]
b1 = betagorro[2]
b2 = betagorro[3]
b3 = betagorro[4]

# Hipotesis nulas, para pruebas simples
alpha2 = 0.01;
alpha3 = 0.05;
level2 = 1- alpha2
level3 = 1- alpha3

H0b2 = 0;
H0b3 = 0;
H0b2text = "b2=0"  # Texto de de la hipótesis nula 
H0b3text = "b3=0"  # Texto de de la hipótesis nula 

#Estadisticos para pruebas simples
# t1 = (b1 - H0b1)/(sqrt(varu)*sqrt(solve(t(X)%*%X)[1,1]))
t2 = (b2 - H0b2)/(sqrt(varu)*sqrt(solve(t(X)%*%X)[3,3])) #OJO 3,3 
t3 = (b3 - H0b3)/(sqrt(varu)*sqrt(solve(t(X)%*%X)[4,4])) #OJO 4,4

# Pruebas de hipÃ³tesis simples

if(abs(t2) > qt(level2,gl)){sprintf("Se rechaza H0: %s con %s de nivel de significancia", H0b2text, alpha2)} else {
  sprintf("Se acepta H0: %s con %s de nivel de significancia", H0b2text, alpha2)
}


if(abs(t3) > qt(level3,gl)){sprintf("Se rechaza H0: %s con %s de nivel de significancia", H0b3text, alpha3)} else {
  sprintf("Se acepta H0: %s con %s de nivel de significancia", H0b3text, alpha3)
}



# # Evaluates bounded region.
# library("visualize", lib.loc="~/R/win-library/3.0")
# 
# visualize.t(stat = c(-3,3), df = 8, section = "bounded")
# 
# # Evaluates upper tail.
# visualize.t(stat = 1, df = 4, section = "upper")
# 
# # Tails
# 
# visualize.t(stat = c(-3,3), df = 5, section = "tails")
