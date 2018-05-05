load("~/Wooldridge datasets/R data sets for 5e/wage1.RData")
library("stats", lib.loc="C:/Program Files/R/R-3.0.1/library")

wage = matrix(data$wage)
educ = matrix(data$educ)
exper = matrix(data$exper)
tenure = matrix(data$tenure)

lwage = log(wage)

n = nrow(wage)

unos = matrix(1, nrow = n, ncol=1) # Vector de unos 

X = matrix(c(unos, educ, exper, tenure),n)


k = ncol(X)

gl = n-k

reg = lm(lwage ~ educ + exper + tenure)

varu = var(reg$residuals)

betagorro = matrix(c(reg$coefficients[1],reg$coefficients[2],reg$coefficients[3],reg$coefficients[4]),4) #Coeficientes estimados

b0 = betagorro[1]
b1 = betagorro[2]
b2 = betagorro[3]
b3 = betagorro[4]

# Hipotesis nulas, para pruebas simples
alpha1 = 0.05;
alpha2 = 0.01;
level1 = 1-(alpha1/2)
level2 = 1-(alpha2/2)

H0b2 = 0;
H0b2text = "b2=0"  # Texto de de la hipótesis nula 

#Estadisticos para pruebas simples
t2 = (b2 - H0b2)/(sqrt(varu)*sqrt(solve(t(X)%*%X)[3,3])) ##OJO [3,3]


# Pruebas de hipÃ³tesis simples

if(abs(t2) > qt(level1,gl)){sprintf("Se rechaza H0: %s con %s de nivel de significancia", H0b2text, alpha1)} else {
  sprintf("Se acepta H0: %s con %s de nivel de significancia", H0b2text, alpha1)
}


if(abs(t2) > qt(level2,gl)){sprintf("Se rechaza H0: %s con %s de nivel de significancia", H0b2text, alpha2)} else {
  sprintf("Se acepta H0: %s con %s de nivel de significancia", H0b2text, alpha2)
}


