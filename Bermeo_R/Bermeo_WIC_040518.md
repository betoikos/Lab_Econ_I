# Sesión 5 R
Durante esta seción se resolvieron algunso ejercicios del Woldridge sobre el análisis de regresión
Usando los datos en wage.xls y la información en WAGE1_description de Wooldridge, J.M.
Introductory Econometrics: A Modern Approach. 5th Edition. Se quiere saber si a más años de experiencia laboral corresponde un mejor salario.

Cargamos la siguiente base de datos

    load("wage1.RData")
    library("stats")
    
    Constrimos las siguientes variables
    
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

Necesitamos cargar las siguientes paqueterias para hacer un análisis gráfico

    require(ggplot2)
    require(reshape2)
    data2 = melt(data, id.vars='lwage')
    ggplot(data2) + geom_jitter(aes(value,lwage, colour=variable),) + geom_smooth(aes(value,lwage, colour=variable), method=lm, se=FALSE) + facet_wrap(~variable, scales="free_x")+labs(x = "Levels", y = "log(average hourly earnings)")
    
Corremos la siguiente regresión tal como lo establece el modelo

    reg0 = lm(lwage ~ educ + exper + tenure)
    reg0
    
Es importante recordar que la causalidad implica correlación pero el inverso es falso, si se cumplen los supestos no implica causalidad, aleotoridad no implica causalidad, 
### Análisis gráfico

    require(ggplot2)
    reg0res <- fortify(reg0)
    ggplot(reg0res, aes(x = .fitted, y = .resid)) + geom_point()
    
Ahora veremos el análisis de los residuos que deben de satisfacer la normalidad


    install.packages("ggfortify")
    install.packages("gvlma")
    require(ggfortify)
    require(gvlma)
    autoplot(reg0)
    gvlma(reg0)

    varu = var(reg0$residuals)

    betagorro = matrix(c(reg0$coefficients[1],reg0$coefficients[2],reg0$coefficients[3],reg0$coefficients[4]),4) #Coeficientes estimados

    b0 = betagorro[1]
    b1 = betagorro[2]
    b2 = betagorro[3]
    b3 = betagorro[4]

Se efectuan pruebas de hipótesis con el uso del siguiente algoritmo

    alpha1 = 0.05;
    alpha2 = 0.01;
    level1 = 1-(alpha1/2)
    level2 = 1-(alpha2/2)

    H0b2 = 0;
    H0b2text = "b2=0"  # Texto de de la hipótesis nula 
    
El paquete reshape2 nos permite visualizar relaciones entre variables de la siguiente manera
    require(reshape2)
    library(reshape2)
    summary(data2)
    data2 = melt(data, id.vars='lwage')
    
![](../../../../../Pictures/P1.png)    


Esto es importante ya que nos permite anticipar el tipo de relación que debemos de incorporar en la especificación del modelo

Durante el análisis de regresión se obtuvieron 

    reg0 = lm(lwage ~ educ + exper + tenure)
    Call:
    lm(formula = lwage ~ educ + exper + tenure)

    Residuals:
         Min       1Q   Median       3Q      Max 
    -2.05802 -0.29645 -0.03265  0.28788  1.42809 

    Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
    (Intercept) 0.284360   0.104190   2.729  0.00656 ** 
    educ        0.092029   0.007330  12.555  < 2e-16 ***
    exper       0.004121   0.001723   2.391  0.01714 *  
    tenure      0.022067   0.003094   7.133 3.29e-12 ***
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

    Residual standard error: 0.4409 on 522 degrees of freedom
    Multiple R-squared:  0.316,	Adjusted R-squared:  0.3121 
    F-statistic: 80.39 on 3 and 522 DF,  p-value: < 2.2e-16
    
Por último veremos la normalidad de los residuos con ayuda de la paqueteria ggfortify() y gvlma()
Esto nos permitirá conocer un análisis gráfico

    require(ggfortify)
    require(gvlma)
    autoplot(reg0)
    
![](../../../../../Pictures/P2.png)

