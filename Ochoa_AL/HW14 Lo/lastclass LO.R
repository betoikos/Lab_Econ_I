# Lorena Ochoa
# 
# Licence Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)

getwd()

# Para fijar el directorio de trabajo deben usar el cÃ³digo de abajo. 
# Utilicen el directorio de la carpeta con su nombre

setwd("C://Users/sony/Documents/GitHub/Lab_Econ_I/Ochoa_AL/HW14 Lo")




# Verificar que el directorio se fijÃ³ correctamente
getwd()

#install.packages("dplyr")
#install.packages("tidyr")
#install.packages("R")

# -------------------------------------------------------------------------------------
# Ejercicio 14.4
# Usando los datos en wage.xls y la información en WAGE1_description de Wooldridge, J.M.
# Introductory Econometrics: A Modern Approach. 5th Edition. Se quiere saber si a más años de
# experiencia laboral corresponde un mejor salario.
load("wage1.RData")
library("stats")

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

## Para graficar y ver las variables
require(ggplot2)
require(reshape2)
data2 = melt(data, id.vars='lwage') #requiere reshape
#melt repite columna lwage, sus valores, genera la columna identificador y pega el resto de lso valores
ggplot(data2) + geom_jitter(aes(value,lwage, colour=variable),) + geom_smooth(aes(value,lwage, colour=variable), method=lm, se=FALSE) + facet_wrap(~variable, scales="free_x")+labs(x = "Levels", y = "log(average hourly earnings)")
##
###Verificar observacion de datos para ver si hay significado de la regresion
#Evitar espuria


#Hacer regresion solicitada
reg0 = lm(lwage ~ educ + exper + tenure)
reg0

#Si aumenta una unidad educ, b=0.092029, increment 9percent el salario en promedio (porciento porque es logwage)

#diferencia entre causalidad y correlaci�n
#Validez interna, los datos de la regresion son v�lidos para esos datos
#

# Ploting the residuals
require(ggplot2)
reg0res <- fortify(reg0)
ggplot(reg0res, aes(x = .fitted, y = .resid)) + geom_point()
#
#Importante ver que los residuales se comportan normal
# Checking if residuals are normal
require(ggfortify)
require(gvlma)
autoplot(reg0)
gvlma(reg0)
#
#kutosis_sesgo
#residuales normales pero con problema en las colas
#no cumple con homocedasticidad, tienen diferente varianza, por tanto no es causal

#varianza de residuales de U

varu = var(reg0$residuals)

#crear matriz de coeficientes
#Pruebas de hipotesis
betagorro = matrix(c(reg0$coefficients[1],reg0$coefficients[2],reg0$coefficients[3],reg0$coefficients[4]),4) #Coeficientes estimados

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

#region de rechazo m�s peque�a
#intervalo de confianza m�s grande
#m�s posibilidades de caer en cero

# -------------------------------------------------------------------------------------
# Ejercicio 14.5.1
# Usando los datos en meap93.xls y la información en MEAP93_description de Wooldridge, J.M.
# Introductory Econometrics: A Modern Approach. 5th Edition. Se quiere saber si el tamaño de una
# escuela afecta negativamente al desempeño escolar.

load("meap93.RData")

library("stats")

math10 = matrix(data$math10)
totcomp = matrix(data$totcomp)
staff = matrix(data$staff)
enroll = matrix(data$enroll)


n = nrow(math10)

unos = matrix(1, nrow = n, ncol=1) # Vector de unos 

X = matrix(c(unos, totcomp, staff, enroll),n)


k = ncol(X)

gl = n-k

reg1 = lm(math10 ~ totcomp + staff + enroll)
reg1

##
require(ggplot2)
require(reshape2)
data2 = melt(data, id.vars='math10')
ggplot(data2) + geom_jitter(aes(value,math10, colour=variable),) + geom_smooth(aes(value,math10, colour=variable), method=lm, se=FALSE) + facet_wrap(~variable, scales="free_x")+labs(x = "Levels", y = "perc studs passing MEAP math")
##

summary(reg1)


# Ploting the residuals
require(ggplot2)
reg1res <- fortify(reg1)
ggplot(reg1res, aes(x = .fitted, y = .resid)) + geom_point()
#

# Checking if residuals are normal #Hace prueba a los errores y ver si son normales, entonces los valores de los parametros est� sesgado
#globastat ->shapiro

require(ggfortify)
require(gvlma)
autoplot(reg1)
gvlma(reg1)
#

#interpretacion
#kurtosis curtosis
#skewness Asimetria
#hte




varu = var(reg1$residuals)

betagorro = matrix(c(reg1$coefficients[1],reg1$coefficients[2],reg1$coefficients[3],reg1$coefficients[4]),4) #Coeficientes estimados

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

# Pruebas de hipótesis simples

if(abs(t2) > qt(level2,gl)){sprintf("Se rechaza H0: %s con %s de nivel de significancia", H0b2text, alpha2)} else {
  sprintf("Se acepta H0: %s con %s de nivel de significancia", H0b2text, alpha2)
}


if(abs(t3) > qt(level3,gl)){sprintf("Se rechaza H0: %s con %s de nivel de significancia", H0b3text, alpha3)} else {
  sprintf("Se acepta H0: %s con %s de nivel de significancia", H0b3text, alpha3)
}

# ---------------------------------------------------------------------------------------
# Ejercicio 14.5.6

load("meap93.RData")

library("stats")

math10 = matrix(data$math10)

ltotcomp = matrix(data$ltotcomp)
lstaff = matrix(data$lstaff)
lenroll = matrix(data$lenroll)

n = nrow(math10)

unos = matrix(1, nrow = n, ncol=1) # Vector de unos 

X = matrix(c(unos, ltotcomp, lstaff, lenroll),n)
k = ncol(X)
gl = n-k

## Ahora veremos las variables en logaritmos
require(ggplot2)
require(reshape2)
data2 = melt(data, id.vars='math10')
ggplot(data2) + geom_jitter(aes(value,math10, colour=variable),) + geom_smooth(aes(value,math10, colour=variable), method=lm, se=FALSE) + facet_wrap(~variable, scales="free_x")+labs(x = "Levels", y = "perc studs passing MEAP math")
##

reg3 = lm(math10 ~ ltotcomp + lstaff + lenroll)


# Ploting the residuals
require(ggplot2)
reg3res <- fortify(reg3)
ggplot(reg3res, aes(x = .fitted, y = .resid)) + geom_point()
#

reg3

# Checking if residuals are normal
require(ggfortify)
require(gvlma)
autoplot(reg3)
gvlma(reg3)
#


varu = var(reg3$residuals)

betagorro = matrix(c(reg3$coefficients[1],reg3$coefficients[2],reg3$coefficients[3],reg3$coefficients[4]),4) #Coeficientes estimados

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

