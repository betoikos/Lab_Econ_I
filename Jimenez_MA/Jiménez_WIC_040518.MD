# Miguel Ángel Jiménez Abraham 
    
## Apuntes de clases 04-mayo-2018
Hoy se realizó una clase acerca de pruebas de hipótesis y residuales:

Un primer punto para la realización de los ejercicios del día de hoy fue la instalación de algunos paquetes. Los comandos y los paquetes furon los siguientes 

*install.packages("dplyr").*

*install.packages("tidyr").*

*install.packages("R").*

A continuación se procedieron a cargar las bases de datos con el siguiente comando: *load("Nombre_base.data")*. A continuación se hicieron algunos ajustes en la base de datos con la finalidad de facilitar la realización de los ejercicios. A continuación se realizaron algunas gráficas con la finalidad de observar el comportamiento de las variables independientes con respecto a la variable dependiente. Un ejemplo de eso se da en el siguiente código elaborado por el laboratorista:

    require(ggplot2)
    require(reshape2)
    data2 = melt(data, id.vars='lwage')
    ggplot(data2) + geom_jitter(aes(value,lwage, colour=variable),) + geom_smooth(aes(value,lwage, colour=variable), method=lm, se=FALSE) + facet_wrap(~variable, scales="free_x")+labs(x = "Levels", y = "log(average hourly earnings)")

Después se procedió a elaborar el modelo de regresión lineal con el comando *lm*. Ejemplo:

    reg0 = lm(lwage ~ educ + exper + tenure)

Como siguiente paso se procedió a analizar el comportamiento de los residuales. Con esto, se buscaba que los residuales cumplieran con el supuesto de normalidad. Los comandos usados para analizar los residuales en el primer ejemplo (salarios) fueron los siguientes:

    require(ggplot2)
    reg0res <- fortify(reg0)
    ggplot(reg0res, aes(x = .fitted, y = .resid)) + geom_point()

    library(ggfortify)
    library(gvlma)
    autoplot(reg0)
    gvlma(reg0)

Una observación hecha es que cuando los residuales no cumplen con los supuestos de normalidad, los parámetros están sesgados. Otra aclaración que se hizo es cómo interpretar un modelo de regresión lineal. Se hizo hincápie en que un modelo MCO no se puede interpretar como relación causal ya que éste solamente expresa correlaciones. 

Una vez hecho esto, se procedió con la elaboración de prueba de hipótesis. En este caso, se elaboraron ejemplos de pruebas de hipótesis de dos colas. En un primer, paso se calculó el pivote (estadístico) a utilizar. Ejemplo:

    H0b2 = 0;
    H0b2text = "b2=0"  # Texto de de la hipótesis nula 

    #Estadisticos para pruebas simples
    t2 = (b2 - H0b2)/(sqrt(varu)*sqrt(solve(t(X)%*%X)[3,3]))
    
Además se fijaron los niveles de significancia:

    alpha1 = 0.05;
    alpha2 = 0.01;
    level1 = 1-(alpha1/2)
    level2 = 1-(alpha2/2)

Como paso siguiente, se pasó a elaborar el código para la prueba de hipótesis como tal. Ejemplo:

    if(abs(t2) > qt(level1,gl)){sprintf("Se rechaza H0: %s con %s de nivel de significancia", H0b2text, alpha1)} else {
      sprintf("Se acepta H0: %s con %s de nivel de significancia", H0b2text, alpha1)
    }

    if(abs(t2) > qt(level2,gl)){sprintf("Se rechaza H0: %s con %s de nivel de significancia", H0b2text, alpha2)} else {
      sprintf("Se acepta H0: %s con %s de nivel de significancia", H0b2text, alpha2)
    }

El resultado de todo esto fue lo siguiente:

    > if(abs(t2) > qt(level1,gl)){sprintf("Se rechaza H0: %s con %s de nivel de significancia", H0b2text, alpha1)} else {
    +   sprintf("Se acepta H0: %s con %s de nivel de significancia", H0b2text, alpha1)
    + }
    [1] "Se rechaza H0: b2=0 con 0.05 de nivel de significancia"
    > 
    > 
    > if(abs(t2) > qt(level2,gl)){sprintf("Se rechaza H0: %s con %s de nivel de significancia", H0b2text, alpha2)} else {
    +   sprintf("Se acepta H0: %s con %s de nivel de significancia", H0b2text, alpha2)
    + }
    [1] "Se acepta H0: b2=0 con 0.01 de nivel de significancia"

Por último, se generó otro ejemplo de prueba de hipótesis de dos colas. Este ejercicio se realizó de manera análoga al ejercicio anterior.

Con esto se concluyó el laboratorio sobre el programa R.