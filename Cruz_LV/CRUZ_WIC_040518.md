# Notas de clase 04 de Mayo 2018

Una vez que hemos descargado los documentos que vamos a utilizar fijamos el directorio: 

    setwd("C://Users/Luis Valentin Cruz/Documents/GitHub/Lab_Econ_I/Cruz_LV/HW14")
En esta sesión vamos a realizar algunas pruebas de hipótesis.

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
Graficamos las diferentes variables para ver la relación que tienen con respecto a la variable independiente.
    
    require(ggplot2)
    require(reshape2)
    data2 = melt(data, id.vars='lwage')
    ggplot(data2) + geom_jitter(aes(value,lwage, colour=variable),) + geom_smooth(aes(value,lwage, colour=variable), method=lm, se=FALSE) + facet_wrap(~variable, scales="free_x")+labs(x = "Levels", y = "log(average hourly earnings)")
Ahora hacemos la regresión lineal

    reg0 = lm(lwage ~ educ + exper + tenure)
Revisamos que el supuesto de normalidad de los residuos se cumple

    require(ggplot2)
    reg0res <- fortify(reg0)
    ggplot(reg0res, aes(x = .fitted, y = .resid)) + geom_point()

    require(ggfortify)
    require(gvlma)
    autoplot(reg0)
    gvlma(reg0)
Ahora vamos a probar la hipótesis referente al ejercicio 4 de la tarea 14

    varu = var(reg0$residuals)

    betagorro = matrix(c(reg0$coefficients[1],reg0$coefficients[2],reg0$coefficients[3],reg0$coefficients[4]),4) #Coeficientes estimados

    b0 = betagorro[1]
    b1 = betagorro[2]
    b2 = betagorro[3]
    b3 = betagorro[4]

    alpha1 = 0.05;
    alpha2 = 0.01;
    level1 = 1-(alpha1/2)
    level2 = 1-(alpha2/2)

    H0b2 = 0
    H0b2text = "b2=0"  # Texto de de la hipótesis nula 

    Estadisticos para pruebas simples
    t2 = (b2 - H0b2)/(sqrt(varu)*sqrt(solve(t(X)%*%X)[3,3])) ##OJO [3,3]

    Pruebas de hipótesis simple

    if(abs(t2) > qt(level1,gl)){sprintf("Se rechaza H0: %s con %s de nivel de significancia", H0b2text, alpha1)} else {
    sprintf("Se acepta H0: %s con %s de nivel de significancia", H0b2text, alpha1)}

    if(abs(t2) > qt(level2,gl)){sprintf("Se rechaza H0: %s con %s de nivel de significancia", H0b2text, alpha2)} else {
    sprintf("Se acepta H0: %s con %s de nivel de significancia", H0b2text, alpha2)}
Podemos replicar el mismo código para los demás ejercicios de la tarea.

Observación: El código se obtuvo del repositorio de clase disponible en el [siguiente link](https://github.com/betoikos/Lab_Econ_I/blob/master/H/HW14/lastclass.R).