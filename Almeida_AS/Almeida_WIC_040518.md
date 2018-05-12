# Sesión 4 de R: 7 mayo 2018 

#### Pasos iniciales de rutina:
        getwd()
        setwd("/Users/Almeida/Documents/Colmex/2º\ semestre")
        getwd()

#### Instalamos los paquetes que se requieren durante la sesión: 

        install.packages("dplyr")
        install.packages("tidyr")
        install.packages("R")
        install.packages("ggplot2")
        install.packages("reshape2")


### Realizaremos el ejercicio 4 de la tarea: 
##### *Usando los datos en wage.xls y la informacion en WAGE1_description de Wooldridge, J.M. Introductory Econometrics: A Modern Approach. 5th Edition. Se quiere saber si a mas anos de experiencia laboral corresponde un mejor salario.*

#### Recuperando el archivo con la base de datos: 
        load("wage1.RData")
        library("stats")

#### Tomamos las variables que nos interesan:

        wage = matrix(data$wage)
        educ = matrix(data$educ)
        exper = matrix(data$exper)
        tenure = matrix(data$tenure)
        lwage = matrix(data$lwage)

#### Creando la matriz del salario quien es la variable dependiente. Hacemos también un vecto de unos y la matriz X de las variables independientes:      
        n = nrow(wage)

        unos = matrix(1, nrow = n, ncol=1) # Vector de unos 

        X = matrix(c(unos, educ, exper, tenure),n)

        k = ncol(X)
        gl = n-k

#### Para trazar las graficas de las posibles regresiones instalamos ggplot2 y reshape2

        require(ggplot2)
        require(reshape2)

#### Reacomodamos los datos acorde a lo que nos interesa

        data2 = melt(data, id.vars='lwage')
    
#### Ploteando las regresiones:

        ggplot(data2) + geom_jitter(aes(value,lwage, colour=variable),) + geom_smooth(aes(value,lwage, colour=variable), method=lm, se=FALSE) + facet_wrap(~variable, scales="free_x")+labs(x = "Levels", y = "log(average hourly earnings)")


#### Llevamos a cabo la regresion solicitada
    
        reg0 = lm(lwage ~ educ + exper + tenure)
        reg0

### Interpretando los resultados 

##### Ploteamos los residuos para ver qué distribución tienen y ver si los betas obtenidos están o no sesgados.  

        require(ggplot2)
        reg0res <- fortify(reg0)
        ggplot(reg0res, aes(x = .fitted, y = .resid)) + geom_point()


        require(ggfortify)
        require(gvlma)
##### Para verlos gráficamente: 
        
        autoplot(reg0)

##### Podemos utilizar este código que nos indica si los residuos tienen las características de una distribución normal: 

        gvlma(reg0)

##### Aunque la función anterior nos da la varianza, podemos calcularla con: 
        
        varu = var(reg0$residuals)

##### Creamos la matriz de coeficientes:
        betagorro = matrix(c(reg0$coefficients[1],reg0$coefficients[2],reg0$coefficients[3],reg0$coefficients[4]),4) #Coeficientes estimados

##### Extraemos cada coeficiente
        b0 = betagorro[1]
        b1 = betagorro[2]
        b2 = betagorro[3]
        b3 = betagorro[4]

#### Hipotesis nulas, para pruebas simples
##### Definimos el nivel de significancia y el intervalo de confianza requerido en el problema:       
        alpha1 = 0.05;
        alpha2 = 0.01;
        level1 = 1-(alpha1/2)
        level2 = 1-(alpha2/2)

        H0b2 = 0;
        
##### El texto de la hipótesis nula se define: 
        H0b2text = "b2=0"  

##### Estadisticos para pruebas simples:

        t2 = (b2 - H0b2)/(sqrt(varu)*sqrt(solve(t(X)%*%X)[3,3])) ##OJO [3,3]


#### Pruebas de hipotesis simples

        if(abs(t2) > qt(level1,gl)){sprintf("Se rechaza H0: %s con %s de nivel de significancia", H0b2text, alpha1)} else {
        sprintf("Se acepta H0: %s con %s de nivel de significancia", H0b2text, alpha1)
        }


        if(abs(t2) > qt(level2,gl)){sprintf("Se rechaza H0: %s con %s de nivel de significancia", H0b2text, alpha2)} else {
        sprintf("Se acepta H0: %s con %s de nivel de significancia", H0b2text, alpha2)
        }


_____
### El procedimiento del ejercicio 5 de la tarea 14 es exactamente el mismo 



