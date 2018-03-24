# Notas de Clase 23 de Marzo 2018

## Clase de RStudio

Fijamos el directorio 

    setwd("C://Users/Luis Valentin Cruz/Documents/GitHub/Lab_Econ_I/Cruz_LV/R")
   
Cargamos la libreria y la base datos

    library("AER")
    data("Journals")
Utilizamos '$' para acceder a una variable dentro de la base de datos, por ejemplo:

    Journals$publisher

Otro modo de acceder diractemente a las variables del dataframe con el comando:
    
    attach(Journals)
Sin embargo, no es recomendable pues podemos confundir a las variables que esten dentro y fuera del data frame, para desactivar el comando usamos:
    
    detach(Journals)
    
#### Gráficos en R
La función básica para gráficos en R es la función:

    plot()
Así podemos crear por ejemplo gráficos de dispersión con:

    plot(log(subs) ~ log(citeprice), data = Journals)
O podemos crear un histograma con el comando:

    hist(), ejemplo: hist(Journals$citeprice, freq = FALSE)
Además podemos agregar nuevas series en los gráficos a través del comando:

    lines(), ejemplo: lines(density(Journals$citeprice), col = 1)
Usamos este comando después de haber creado el gráfico, en el ejemplo, le indicamos que nos agregue la función de densidad con el color asignado al número uno (negro).

Otro tipo de gráfica que se utiliza comunmente es la gráfica de pastel, para crear una usamos el comando:

    pie(), ejemplo: pie(Editoriales, main="Mayores editoriales de Journals")
También es posible estructurar cada uno de los gráficos para que sean más entendibles, podemos colocar el nombre de los ejes, así como el titulo principal del gráfico, el color, si deseamos bordes, el tamaño, etc.

Finalmente, también es posible guardar los gráficos creados en archivos pdf, jpg o png. Veamos los siguientes ejemplos:

    pdf("testPDF.pdf", height = 5, width = 6)
    plot(subs ~ citeprice, data = Journals)
    dev.off()

    jpeg(filename = "testJPG.jpg",
    width = 1000, height = 1000, units = "px")
    plot(subs ~ citeprice, data = Journals)
    dev.off()

    png(filename = "testPNG.png",
    width = 1000, height = 1000, units = "px")
    plot(subs ~ citeprice, data = Journals)
    dev.off()
    
En el ejemplo visto en laboratorio tenemos que:
        
    library(MASS) #Vamos a crear una muestra aleatoria normal

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


    Usample
    Xsample

    lbls <- c("US", "UK", "Australia", "Germany", "France") #El encabezado que queremos para cada columna
    colnames(Xsample)=lbls
    Xsample

    index = matrix(1:30)
    index

    datos = cbind(index,Xsample) #Unimos los datos

    datosF = as.data.frame(datos) #Creamos el data frame de la matriz

    plot_colors <- c("blue","red","forestgreen")
    datosF


    # Creamos un gráfico de la serie US con puntos tipo círculo, línea recta color azul.
    plot(datosF$US, type="o", col=plot_colors[1], ylim=c(-2,13), ylab = "Crecimiento", xlab = "Periodos")
    
    # Graficamos la serie UK con puntos tipo cuadrado, línea con guiones color rojo.
    lines(datosF$UK, type="o", pch=22, lty=2, col=plot_colors[2])

    # Graficamos la serie Australia con puntos tipo diamante, línea punteada color verde.
    lines(datosF$Australia, type="o", pch=23, lty=3, col=plot_colors[3])

    # Creamos el título en color azul en itálicas
    title(main="Países", col.main="blue", font.main=4)
    
    #Creamos una leyenda
    legend(25, 13, c("UK","Australia", "US"), c("blue","red","forestgreen"),cex=0.5)
El resultado final es el gráfico siguiente:
![](R/test2PNG.png)
