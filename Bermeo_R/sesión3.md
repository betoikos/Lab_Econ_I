# Sesión 3 Laboratorio de R
_________________

Para llevar a cabo una lectura de datos se utilizan los siguientes comandos

    Instalación del paquete
    lybrary("AER")
    Abrimos la siguiente base de datos
    data("journals")
    Journals$citeprice <- Journals$price/Journals$citations

El comando attach() se usa para obtener iformación de un data frame, esto no es recomendabe porque puede alterar la base de datos

    attach(Journals)
    citeprice=price/citations
    
Para realizar gráficos se usa el comando plot()

    plot(log(subs), log(citeprice))
    En el primer espacio se mete variable dependiente y en el segundo variable independiente
    
Si las variables se encuentran dentro de una base de data frame se usa

    hist(Journals$citeprice, freq = FALSE)
    lines(density(Journals$citeprice), col = 5)
    
    lines indica el tipo de gráfico, este puede ser cambiado, y la última parte índica el color asociado al gráfico
    Si se quiere generar un gráfico con mejores características se utilizan las modalidades de:
    main="titulo"
    xlab="etiqueta del eje de las x"
    ylab="etiqueta eje de las y"
    
Para realizar un gráfico de distribuciones de frecuencias se utliza el siguiente algoritmo

    curve(dnorm, from = -5, to = 5, col = "slategray", lwd = 3,

      main = "Density of the standard normal distribution")

    text(-5, 0.3, expression(f(x) == frac(1, sigma ~~ sqrt(2*pi)) ~~ e^{-frac((x - mu)^2, 2*sigma^2)}), adj = 0)
    
_____________________________________________________

Para la exportación de un gráfico es util el siguiente comando

    pdf("testPDF.pdf", height = 5, width = 6)

    plot(subs ~ citeprice, data = Journals)

    dev.off()
    
Estos se pueden hacer más atractivos para realizar mejores categorias y no realicen un gráfico que no aporten mucha información

    tab <- table(Journals$publisher)

    prop.table(tab)

    barplot(tab)

    ![alt text](Documents/1.png "Gráfico de pastel de publisher.")
    
    Esto es para la división de datos
    
    sortedtab = sort(tab, decreasing = TRUE)

    otros = sum(sortedtab[7:52])

    main = sortedtab[1:6]
    
    sortedtab = sort(tab, decreasing = TRUE)

    otros = sum(sortedtab[7:52])

    main = sortedtab[1:6]

    Editoriales = append(main,otros)

    Editoriales
    

![](../../../../Pictures/graf9.png)


### Generación de un data frame

Estos son de utilidad ya que se han aprendido diferentes técnicas para trabajar con una base de datos parecida 

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