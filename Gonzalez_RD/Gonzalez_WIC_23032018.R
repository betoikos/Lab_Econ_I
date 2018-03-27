#Rogelio Daniel Gonzàlez Gonzàlez
#Colegio de Mèxico
#Centro de Estudios Econòmicos
#Laboratorio de Econometria #3

#ruta de trabajo actual
getwd()

# Fijar el directorio 

setwd("C://Users/sony/Documents/GitHub/Lab_Econ_I/Gonzalez_RD")

#guardar el script sólo es: ctrl+s

#Instalar paquetes

install.packages("AER")
library("AER")
data("Journals")
summary(Journals)
JOURNAL = matrix(1:100)

#Head(): regresa los primeros elementos de un dataframe #primeros 6 elementos
head(Journals)

#Tail(): regresa los últimos elementos de un dataframe #ultimos 6 elementos
tail(Journals)

#variables dentro de dataframe
Journals$pages


#Creamos una variable que diga el precio por cada cita
#Crea una variable dentro de la base de datos , modifica la base de datos
Journals$citeprice= Journals$price/Journals$citations


#attach() permite acceder a los elementos de un dataframe "directamente"
attach(Journals)


#plot() es la función básica para gráficos en R
plot(log(subs), log(citeprice))


#rug() añade barras para indicar sobre los ejes en donde se encuentra una observación
rug(log(subs))
rug(log(citeprice), side = 2)

#detach() cierra el "fácil acceso" al dataframe
detach(Journals)

#aqui se usa plot sin attach, por eso es necesario especificar el dataframe
plot(log(subs) ~ log(citeprice), data = Journals)
plot(log(subs), log(citeprice), data = Journals)

#Veamos la diferencia de plotear en niveles
plot(subs ~ citeprice, data = Journals)

#Exportando un gráfico a PDF #recomendado para latex
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

#Histogramas
hist(Journals$citeprice, freq = FALSE)
lines(density(Journals$citeprice), col = 1)
lines(density(Journals$citeprice), col = 2) # Rojo
lines(density(Journals$citeprice), col = 3) # Verde
lines(density(Journals$citeprice), col = 4) # Azúl
lines(density(Journals$citeprice), col = 5) # Verde agua
lines(density(Journals$citeprice), col = 6) # Rosa mexicano
lines(density(Journals$citeprice), col = 7) # Amarillo 
lines(density(Journals$citeprice), col = 8) # Gris

#Exportando el histograma de densidad a PDF
pdf("histoPDF.pdf", height = 5, width = 6)
hist(Journals$citeprice, freq = FALSE)
lines(density(Journals$citeprice), col = 2) # Rojo
dev.off()

#Haciendolo màs vergas
hist(Journals$citeprice, 
     freq = FALSE,
     border = NULL,
     main = paste("Distribución de el costo por cita"),
     xlab = "USD por cita", 
     ylab = "Densidad")
lines(density(Journals$citeprice), col = 2) # Rojo

#Exportando nuevamente
pdf("histoPDFv2.pdf", height = 5, width = 6)
hist(Journals$citeprice, 
     freq = FALSE,
     border = NULL,
     main = paste("Distribución del costo por cita"),
     xlab = "USD por cita", 
     ylab = "Densidad")
lines(density(Journals$citeprice), col = 2) # Rojo
dev.off()

#Distribución de frecuencias
hist(Journals$citeprice)

#Resumen de la variable
summary(Journals$publisher)

tab <- table(Journals$publisher)
prop.table(tab) #proporcion de la tabla
barplot(tab)#grafico de barras
pie(tab)


#Acomoda datos 
sortedtab = sort(tab, decreasing = TRUE)
otros = sum(sortedtab[7:52])#crea nueva con el resto
main = sortedtab[1:6]

Editoriales = append(main,otros)

barplot(Editoriales)

pie(Editoriales, main="Mayores editoriales de Journals")#pone titulo main

# Exportando los plots
pdf("piePDF.pdf", height = 5, width = 6)
pie(Editoriales, main="Mayores editoriales de Journals")
dev.off()

## Muestras aleatorias normales

library(MASS)

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


#Nombres de las columnas
lbls <- c("US", "UK", "Australia", "Germany", "France")#labels

colnames(Xsample)=lbls#pone nombres a matrix
Xsample

index = matrix(1:30) #para nombres en X
index

datos = cbind(index,Xsample)#une horizontalmente
datos

datosF = as.data.frame(datos) #hacer dataframe
datosF #coloca nombre a 1era columna hasta hacer dataframe

#graficar
#matriz de colores
plot_colors <- c("blue","red","forestgreen")


# specify them ourself
plot(datosF$US, type="o", col=plot_colors[1], ylim=c(-2,13), ylab = "Crecimiento", xlab = "Periodos")
#type = o para lineas, sin type solo scatter

# Graph trucks with red dashed line and square points
lines(datosF$UK, type="o", pch=22, lty=2, col=plot_colors[2])

# Graph suvs with green dotted line and diamond points
lines(datosF$Australia, type="o", pch=23, lty=3, col=plot_colors[3])
#pch tipo de simbolo lty tipo de linea 

# Create a title with a red, bold/italic font
title(main="Países", col.main="blue", font.main=4)

legend(25, 13, c("UK","Australia", "US"), c("blue","red","forestgreen"),cex=0.5)

#legend (X,y,)x donde empiexo en eje X, y donde termino en eje Y, cex proporcion del cuadrito
