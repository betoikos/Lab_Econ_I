# 3ra sesión de R: 23 marzo 2018

##### Recordando los pasos inciales: 
    >getwd()
    ("/Users/Almeida/Documents/Colmex/2º\ semestre")
    getwd()

##### Instalamos la paquetería que se utilizará, al igual que la librería y la base de datos 

    >install.packages("AER")
    library("AER")
    data("Journals")
    summary(Journals)


##### *La función Head regresa los primeros elementos de un dataframe*
    >head(Journals)

##### *La función Tail regresa los ultimos elementos de un dataframe*
    >tail(Journals)
    Journals

    Journals$publisher

##### Definimos una variable que indique el precio por cada cita:
    >Journals$citeprice <- Journals$price/Journals$citations     
  
###### Nota: Es importante mantener intacta la base de datos original

##### *La función attach nos permite acceder a los elementos de un dataframe "directamente"*
    >attach(Journals)   #mantener los datos como variables.

#### ¿Cómo hacer un gráfico? 
        >plot(log(subs), log(citeprice))
        rug(log(subs))
        rug(log(citeprice), side = 2) 

##### *La función detach() cierra el "fácil acceso" al dataframe*
        >detach(Journals)  
        
###### Nota: Es recomendable NO usar attach y detach.

#### ¿Cómo hacer gráficos sin usar attach?
        
        >plot(log(subs) ~ log(citeprice), data = Journals)
        plot(log(citeprice) ~ log(subs), data = Journals)


#### ¿Cómo exportar un gráfico a PDF?
        >pdf("testPDF.pdf", height = 5, width = 6)
        plot(subs ~ citeprice, data = Journals)
        dev.off()                    
        
#### ¿Cómo exportar un gráfico a PNG y JPG?

        >jpeg(filename = "testJPG.jpg",
        width = 1000, height = 1000, units = "px")     #"px": pixeles
        plot(subs ~ citeprice, data = Journals)
        dev.off()

        png(filename = "testPNG.png",
        width = 1000, height = 1000, units = "px")
        plot(subs ~ citeprice, data = Journals)
        dev.off()

#### ¿Cómo hacer un histograma? 

        >hist(Journals$citeprice, freq = FALSE)     # Gr?fico base.
        lines(density(Journals$citeprice), col = 6)


#### ¿Cómo obtener el resumen de una variable? 
        >summary(Journals$publisher)

        tab <- table(Journals$publisher)    
        prop.table(tab)
        barplot(tab)
        pie(tab)
        
        
 #### Para organizar mejor el resumen, podemos deshacernos de los publicadores menos importantes y juntarlos en una categoría que se llame "otros". 
   
        >sortedtab = sort(tab, decreasing = TRUE)   # Acomoda los datos del vector.
        otros = sum(sortedtab[7:52])
        main = sortedtab[1:6]

        Editoriales = append(main,otros)
        Editoriales

        barplot(Editoriales)

        pie(Editoriales, main="Mayores editoriales de Journals")

#### ¿Cómo exportar los plots? 
    
        pdf("piePDF.pdf", height = 5, width = 6)
        pie(Editoriales, main="Mayores editoriales de Journals")
        dev.off()

#### ¿Cómo generar un data set desde cero? 


##### *Muestras aleatorias normales*
###### En general utilizamos la librería MASS, definimos el tamaño de la muestra, su media y su varianza:

        library(MASS)

        n = 30
        mu = 0
        varu = 0.2 

###### Creamos el vector de medias de X y el vector de varianzas de X:


        mx = c(4,2,0,0,2) 
        sx = matrix(c(4,-1,0,0,0,
              -1,1,0,0,0,
              0,0,1,0,0,
              0,0,0,9,2,
              0,0,0,2,4),5) # Varianza de X

###### Ahora sí, creamos la muestra aleatoria de U y de x1 y x2: 
    
            Usample = rnorm(n,mu,su) 
            Xsample = mvrnorm(n,mx,sx) 

###### Los corremos: 
            Usample
            Xsample

###### Generamos una variable con los nombres de las variables: 
        
        lbls <- c("US", "UK", "Australia", "Germany", "France")       
        colnames(Xsample) <- lbls
        Xsample

        index = matrix(1:30)
        index

        datos = cbind(index,Xsample)

        datosF = as.data.frame(datos)

##### Podemos graficar la muestra: 

        plot_colors <- c("blue","red","forestgreen")

###  Algunas formas de poner bonitas las gráficas


###### *Podemos especificarlos nosotros mismos:*
    
        plot(datosF$US, type = "o", col=plot_colors[1], ylim=c(-2,13), ylab = "Crecimiento", xlab = "Periodos")
###### *Si queremos un gráfico de barras con linea punteada roja y puntos cuadrados:* 
        
        lines(datosF$UK, type="o", pch=200, lty=5, col=plot_colors[2])

###### *Si queremos un gráfico con lineas verdes punteadas y puntitos en forma de diamante:*
        
        lines(datosF$Australia, type="o", pch=126, lty=8, col=plot_colors[3])

###### *Si queremos un título con fuente colo rojo, negrita e itálica:* 
    
        title(main="Pa?ses", col.main="blue", font.main=4)
        legend(25, 13, c("UK","Australia", "US"), 
        c("blue","red","forestgreen"),cex=0.5)

###### *Hacer el gráfico de una distribución normal especificando su dimensión, color, título):*

    curve(dnorm, from = -5, to = 5, col = "slategray", lwd = 3,
      main = "Density of the standard normal distribution")
      text(-5, 0.3, expression(f(x) == frac(1, sigma ~~ sqrt(2*pi)) ~~ e^{-frac((x - mu)^2, 2*sigma^2)}), adj = 0)

