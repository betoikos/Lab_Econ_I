# ------------------
# 

library(MASS)

n = 100 # TamaÃÂ±o de la muestra
k = 3 # Rango de X
gl = n-k # Grados de libertad

m = c(1,0,2) # Vector de medias de X 
s = matrix(c(0.8, 0.4, -0.2, 0.4, 1, -0.8, -0.2, -0.8, 2),3) # Varianza de X
syx = s[1,2:3]
Sx = s[2:3,2:3]
  
unos = matrix(1, nrow = n, ncol=1) # Vector de unos 
sample = mvrnorm(n,m, s) # Muestra aleatoria de x1 y x2

X = cbind(unos, sample[,2:3]) # Matriz X con unos en la primera columna
x = sample[,2:3]
Y = sample[,1]
reg = lm(Y ~ x) # RegersiÃÂ³n de Y sobre X

betagorro = matrix(c(reg$coefficients[1],reg$coefficients[2],reg$coefficients[3]),3) #Coeficientes estimados
varu = var(reg$residuals)


# Beta estimado

# HipÃ³tesis nulas, para pruebas simples
alphab1b3 = 0.10;
C = c(1, 0, 1)
H0b1b3 = 1;


#EstadÃ?sticos para pruebas simples
t1 = (C%*%betagorro - H0b1b3)/(sqrt(varu)*sqrt(t(C)%*%solve(t(X)%*%X)%*%C))

# Pruebas de hipÃ³tesis simples

if(abs(t1) > qt(0.95,gl)){sprintf("Se rechaza H0: b1+b3 = 1 con %s de nivel de significancia", alphab1b3)} else {
  sprintf("Se acepta H0: b1+b3 = 1 con %s de nivel de significancia", alphab1b3)
}

