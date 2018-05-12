# Sesión 4 Laboratorio de R

### Prueba de hipótesis

En esta sesión de R se realizarón las herramientas necesarias para un análsis cuantitativo
La causalidad depende de una relación teórica y no de los datos con los que se realiza el modelo

Antes de iniciar con el análisis debemos de cargar algunas paqueterias necesarias para el análisis

    install.packages("dplyr")
    install.packages("tidyr")
    install.packages("R")
    library("stats")
    require(ggplot2)
    require(reshape2)
    
Para realizar un gráfico con las nuevas herramientas utilizaremos el siguiente código

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
    
El análisis grafico es importante para el análisis de regresión esto nos da una intuición del análisis 

El comando melt() nos permite gráficar de manera sencilla

    require(ggplot2)
    require(reshape2)
    data2 = melt(data, id.vars='lwage') #requiere reshape

    ggplot(data2) + geom_jitter(aes(value,lwage, colour=variable),) + geom_smooth(aes(value,lwage, colour=variable), method=lm, se=FALSE) + facet_wrap(~variable, scales="free_x")+labs(x = "Levels", y = "log(average hourly earnings)")
    
melt repite columna lwage, sus valores, genera la columna identificador y pega el resto de los valores

Existen observaciones (outlyers), que en muchas ocasiones no aportan nada al análisis de regresión

Para realizar una regresión utilizamos:

    reg = lm(lwage ~ educ + exper + tenure)
    reg
    
No necesariamente lo que arroje el análisis de regresión es una verdad absoluta, es necesario el uso de la teoria para una mejor validación

Para realizar pruebas de hipotesis utilizamos el siguiente algoritmo

    varu = var(reg0$residuals)
    
    La siguiente linea describe la prueba de hipótesis
    
    betagorro = matrix(c(reg0$coefficients[1],reg0$coefficients[2],reg0$coefficients[3],reg0$coefficients[4]),4) #Coeficientes estimados

    b0 = betagorro[1]
    b1 = betagorro[2]
    b2 = betagorro[3]
    b3 = betagorro[4]

    Para el nivel de significancia se utiliza
    alpha1 = 0.05;
    alpha2 = 0.01;
    level1 = 1-(alpha1/2)
    level2 = 1-(alpha2/2)

    H0b2 = 0;
    H0b2text = "b2=0"   

    Por último se realiza el contraste
    t2 = (b2 - H0b2)/(sqrt(varu)*sqrt(solve(t(X)%*%X)[3,3])) 
    
Para realizar la prueba se usa

    if(abs(t2) > qt(level1,gl)){sprintf("Se rechaza H0: %s con %s de nivel de significancia", H0b2text, alpha1)} else {
      sprintf("Se acepta H0: %s con %s de nivel de significancia", H0b2text, alpha1)
    }


    if(abs(t2) > qt(level2,gl)){sprintf("Se rechaza H0: %s con %s de nivel de significancia", H0b2text, alpha2)} else {
      sprintf("Se acepta H0: %s con %s de nivel de significancia", H0b2text, alpha2)
    }
    
    Es necesario recordar que a medida que la significancia sea mayor el intervalo de confianza se reducirá
    
###  Residuales

El análisis de residuales es elemental para saber si se satisface una de las hipótesis la cual consiste en la normalidad de los errores

Primero los graficamos

    require(ggplot2)
    reg0res <- fortify(reg0)
    ggplot(reg0res, aes(x = .fitted, y = .resid)) + geom_point()
    
Con el uso de las paqueterias podemos realizar las siguientes pruebas de hipótesis

    require(ggfortify)
    require(gvlma)
    autoplot(reg1)
    gvlma(reg1)
    
Esto nos dara información sobre el sesgo, curtosis y la normalidad de los errores
Otras pruebas más formales son:

    ASSESSMENT OF THE LINEAR MODEL ASSUMPTIONS
    USING THE GLOBAL TEST ON 4 DEGREES-OF-FREEDOM:
    Level of Significance =  0.05 

    Call:
     gvlma(x = reg1) 

                          Value   p-value                   Decision
    Global Stat        45.55544 3.047e-09 Assumptions NOT satisfied!
    Skewness           25.72251 3.942e-07 Assumptions NOT satisfied!
    Kurtosis           14.90501 1.131e-04 Assumptions NOT satisfied!
    Link Function       4.86669 2.738e-02 Assumptions NOT satisfied!
    Heteroscedasticity  0.06123 8.046e-01    Assumptions acceptable.

La tabla índica que los errores no son normales, sin embargo la varianza es contaste
