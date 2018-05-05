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

# Hipótesis nulas, para pruebas con Restricciones
alpha1 = 0.05 ;
alpha2 = 0.10;


R1 = matrix(c(1, 0, 0, 0, 1, 0, 0, 0, 1),3);
r1 = c(0, 0.5, 1);
q1 = 3;

R2 = matrix(c(1, 0, 1, 1, -1, 1),2) 
r2 = c(1, 0.5);
q2 = 2;

#Estadísticos para pruebas con restricciones
F1 = (t(R1%*%betagorro - r1)%*%solve(R1%*%solve(t(X)%*%X)%*%t(R1))%*%(R1%*%betagorro - r1))/(q1*varu)
F2 = (t(R2%*%betagorro - r2)%*%solve(R2%*%solve(t(X)%*%X)%*%t(R2))%*%(R2%*%betagorro - r2))/(q2*varu)

# Pruebas de hipótesis con restricciones

if(abs(F1) > qf(0.95,q1,gl)){sprintf("Se rechaza H0: Rb=r con %s de nivel de significancia", alpha1)} else {
  sprintf("Se acepta H0: Rb=r con %s de nivel de significancia", alpha1)
}

if(abs(F2) > qf(0.90,q1,gl)){sprintf("Se rechaza H0: Rb=r con %s de nivel de significancia", alpha2)} else {
  sprintf("Se acepta H0: Rb=r con %s de nivel de significancia", alpha2)
}
