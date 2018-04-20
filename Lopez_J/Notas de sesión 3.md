# **Notas de tercera sesión de R.**

## **_Sobre la lectura de bases de datos._**

Para llevar a cabo un primer acercamiento a la lectura de información dentro de un data frame en R se utilizaron los comandos summary(), head() y tail(), los cuales otorgan la información de cuartiles de la información, las primeras seis observaciones y las ultimas seis, respectivamente. Además se hizo uso del paquete "AER", el cual contenia dentro de sí la base de datos "Journals"; en ella como primer metodo para utilizar la información se vio el uso de "Nombre de base de datos"$"Variable".

    library("AER")
    data("Journals")
    Journals$citeprice <- Journals$price/Journals$citations

Como alternativa, se vio el uso del comando attach() para obtener información de un dataframe; pero esto no se considero recomendable en especial cuando pueden existir variables similares guardadas en la memoria y cuando la base se piensa manipular.

    attach(Journals)
    citeprice=price/citations

## **_Realizar graficos en R._**

De forma general un grafico de dispersión se hace utilizando la función plot.
en el caso de tener las variables:

    plot(log(subs), log(citeprice))

En el caso de que las variables esten en un dataframe.

    plot(log(subs) ~ log(citeprice), data = Journals)

En el caso de los histogramas se utiliza la función hist() y para marcar la linea de tendencia de la densidad se pone adicionalmente lines()

    hist(Journals$citeprice, freq = FALSE)
    lines(density(Journals$citeprice), col = 1)

En donde el número final en la función lines se refiere a el color que tomara la linea de densidad y poner en la función de hist freq=FALSE garantiza la visibilidad grafica de dicha linea.
Si se quiere generar un grafico más atractivo visualmente, se utiliza el argumento main="titulo", xlab="titulo de eje x" y ylab="titulo eje y".

Para hacer un gráfico de distribuciones frecuentes, es especifico para la normal de utilizó la función curve() y la funciíon text() para agregar la formula de densidad.


    curve(dnorm, from = -5, to = 5, col = "slategray", lwd = 3,

          main = "Density of the standard normal distribution")

    text(-5, 0.3, expression(f(x) == frac(1, sigma ~~ sqrt(2*pi)) ~~ e^{-frac((x - mu)^2, 2*sigma^2)}), adj = 0)


## _Exportar grafico._

Para ello utilizamos el siguiente procedimiento:

    pdf("testPDF.pdf", height = 5, width = 6)

    plot(subs ~ citeprice, data = Journals)

    dev.off()

Además si se quiere hacer en otros formatos:


    jpeg(filename = "testJPG.jpg",

         width = 1000, height = 1000, units = "px")

    plot(subs ~ citeprice, data = Journals)

    dev.off()



    png(filename = "testPNG.png",

        width = 1000, height = 1000, units = "px")

    plot(subs ~ citeprice, data = Journals)

    dev.off()



### _Manipulación de datos para graficos más atractivos._

A modo de ejemplo se consideró la información de publiser de la base Journals, con ella se hizo un tabla de la información y si crearon un grafico de pastel y de barras.

    tab <- table(Journals$publisher)

    prop.table(tab)

    barplot(tab)

    ![alt text](Documents/1.png "Gráfico de pastel de publisher.")

De modo que esta información estaba muy concentrada se opto por dividir la base en una con los principales actores y otra con el resto; lo que se hizo con la función sort() y sum().

    sortedtab = sort(tab, decreasing = TRUE)

    otros = sum(sortedtab[7:52])

    main = sortedtab[1:6]

Posteriormente, se agruparon con la función append() y graficaron de modo más practico.

    sortedtab = sort(tab, decreasing = TRUE)

    otros = sum(sortedtab[7:52])

    main = sortedtab[1:6]



    Editoriales = append(main,otros)

    Editoriales

Para generar un dataframe; se hizo una muestra aleatoria multivariada con las funciones rnorm() y mvrnorm()

    n = 30 # Tamaño de la muestra
    mu = 0 # Media de U
    su = 0.2 # Varianza de U
    mx = c(4,2,0,0,2) # Vector de medias de X 
    sx = matrix(c(4,-1,0,0,0,

                  -1,1,0,0,0,

                  0,0,1,0,0,

                  0,0,0,9,2,

                  0,0,0,2,4),5) # Varianza de X

    Usample = rnorm(n,mu,su) # Muestra aleatoria de U
    Xsample = mvrnorm(n,mx,sx) # Muestra aleatoria de x1 y x2
    lbls <- c("US", "UK", "Australia", "Germany", "France")
    colnames(Xsample)
    index = matrix(1:30)
    datos = cbind(index,Xsample)
    datosF = as.data.frame(datos)
    
Para hacer un grafico multiple de la información se definio un vector de colores y se aplico la función plot().

    plot_colors <- c("blue","red","forestgreen")
    plot(datosF$US, type="o", col=plot_colors[1], ylim=c(-2,13), ylab = "Crecimiento", xlab = "Periodos")
    lines(datosF$UK, type="o", pch=22, lty=2, col=plot_colors[2])
    lines(datosF$Australia, type="o", pch=23, lty=3, col=plot_colors[3])
