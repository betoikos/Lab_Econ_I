# Ultima Clase R

## Con load cargamos la base de datos que descargamos del woolridge
    load("wage1.RData")



## El comando melt es de mucha utilidad ya que junta todas las variables en una misma columna
## Usamos ggplot para graficar, de golpe, cada una de las variables independientes con la variable dependiente
    require(ggplot2)
    require(reshape2)
    data2 = melt(data, id.vars='lwage')
    ggplot(data2) + geom_jitter(aes(value,lwage, colour=variable),) + geom_smooth(aes(value,lwage, colour=variable), method=lm, se=FALSE) + facet_wrap(~variable, scales="free_x")+labs(x = "Levels", y = "log(average hourly earnings)")

## Hacemos la regresión 
    reg0 = lm(lwage ~ educ + exper + tenure)
    reg0

### Coeficiente: Un cambio en una unidad (en niveles) aumenta en un punto porcentual a lwage (porcentual porque está en logaritmos)
### Educación: Un aumento de una unidad en educacion aumenta en 9.2 puntos porcentuales

## Hay que graficar los residuos para tener una idea de si son normales
    require(ggpl ot2)
    reg0res <- fortify(reg0)
    ggplot(reg0res, aes(x = .fitted, y = .resid)) + geom_point()


## Estas ya son pruebas más formales para ver si, en efecto, los errores son normales
    require(ggfortify)
    require(gvlma)
    autoplot(reg0)
    gvlma(reg0)


## En esta sección hacemos las pruebas de hipótesis

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

    H0b2 = 0;
    H0b2text = "b2=0"  # Texto de de la hipótesis nula 

    #Estadisticos para pruebas simples
    t2 = (b2 - H0b2)/(sqrt(varu)*sqrt(solve(t(X)%*%X)[3,3])) ##OJO [3,3]


## Aquí generamos los condicionales para que R nos imprima si sí se rechaza la hipótesis nula o no

    if(abs(t2) > qt(level1,gl)){sprintf("Se rechaza H0: %s con %s de nivel de significancia", H0b2text, alpha1)} else {
    sprintf("Se acepta H0: %s con %s de nivel de significancia", H0b2text, alpha1)
    }

### Sprint sirve mucho porque nos permite cambiar los "%s" por la variable que viene después de la coma

