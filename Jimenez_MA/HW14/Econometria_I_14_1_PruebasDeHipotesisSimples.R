library(MASS)

n = 100 # TamaÃ±o de la muestra
k = 3 # Rango de X
gl = n-k # Grados de libertad

m = c(1,0,2) # Vector de medias de X 
s = matrix(c(0.8, 0.4, -0.2, 0.4, 1, -0.8, -0.2, -0.8, 2),3) # Varianza de X
syx = matrix(c(s[1,2:3]),1)
Sx = s[2:3,2:3]
sy = s[1,1]
  
unos = matrix(1, nrow = n, ncol=1) # Vector de unos 
sample = mvrnorm(n,m, s) # Muestra aleatoria de x1 y x2

X = cbind(unos, sample[,2:3]) # Matriz X con unos en la primera columna
x = sample[,2:3]
Y = sample[,1]
reg = lm(Y ~ x) # RegersiÃ³n de Y sobre X

betagorro = matrix(c(reg$coefficients[1],reg$coefficients[2],reg$coefficients[3]),3) #Coeficientes estimados
varu = var(reg$residuals)


# Beta estimado
betagorroo = solve(t(X)%*%X)%*%t(X)%*%Y
b1= betagorroo[1]
b2= betagorroo[2]
b3= betagorroo[3]

betagorro

b1
b2
b3

# Hipótesis nulas, para pruebas simples
alpha1 = 0.01 ;
alpha2 = 0.05;
alpha3 = 0.10;


H0b1 = 0;
H0b2 = 0.5;
H0b3 = 1.2;


#Estadísticos para pruebas simples
t1 = (b1 - H0b1)/(sqrt(varu)*sqrt(solve(t(X)%*%X)[1,1]))
t2 = (b2 - H0b2)/(sqrt(varu)*sqrt(solve(t(X)%*%X)[2,2]))
t3 = (b3 - H0b3)/(sqrt(varu)*sqrt(solve(t(X)%*%X)[3,3]))

# Pruebas de hipótesis simples

if(abs(t1) > qt(0.995,gl)){sprintf("Se rechaza H0: b1=0 con %s de nivel de significancia", alpha1)} else {
  sprintf("Se acepta H0: b1=0 con %s de nivel de significancia", alpha1)
}


if(abs(t2) > qt(0.975,gl)){sprintf("Se rechaza H0: b2=0.5 con %s de nivel de significancia", alpha2)} else {
  sprintf("Se acepta H0: b2=0.5 con %s de nivel de significancia", alpha2)
}


if(abs(t3) > qt(0.95,gl)){sprintf("Se rechaza H0: b3=1.2 con %s de nivel de significancia", alpha3)} else {
  sprintf("Se acepta H0: b3=1.2 con %s de nivel de significancia", alpha3)
}

# Verdaderos valores de los beta
alpha = m[1] - syx%*%solve(Sx)%*%m[2:3];
beta = syx%*%solve(Sx);
B = matrix(c(alpha,beta))
B

# Verdadero valor de sigmaU
sigmaU = sy - syx%*%solve(Sx)%*%t(syx)
sigmaU
