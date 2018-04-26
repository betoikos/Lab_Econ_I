# Humberto Martínez García
# hmartinez@colmex.mx
# Licence Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)

# ----------------------------------
# Segunda sesión de laboratorio en R
# ----------------------------------


##En este lab aprendemos a manejar bases de datos y realizar algunas gráficas de utilidad



# Obtener la ruta de trabajo actual
getwd()

# Para fijar el directorio de trabajo deben usar el código de abajo. 
# Utilicen el directorio de la carpeta con su nombre

##setwd("C://Users/Humberto Martínez/Documents/GitHub/Lab_Econ_I/H/R_drafts")

# Verificar que el directorio se fijó correctamente
getwd()

# Para guardar el script sólo es: ctrl+s

# -------------------------------------------------------------------------

# En esta sesión


# Data frames
# Plots


# -----------------------
# Operadores relacionales

#Instalando los paquetes que usaremos

install.packages("AER") 



# Cargamos la librería y la base de datos
library("AER")

data("Journals")

summary(Journals)

JOURNAL= matrix(1:100) #crear una matriz

# Head() regresa los primeros elementos de un dataframe
head(Journals)

# Tail regresa los últimos elementos de un dataframe
tail(Journals)


#Creamos una variable que diga el precio por cada cita
Journals$citeprice <- Journals$price/Journals$citations #sale en la base de datos

# attach() permite acceder a los elementos de un dataframe "directamente"
attach(Journals)

pages 

# Scatter plot
# plot() es la función básica para gráficos en R
plot(log(subs), log(citeprice))

# rug() añade barras para indicar sobre los ejes en donde se encuentra una observación
rug(log(subs))
rug(log(citeprice), side = 2)

# detach() cierra el "fácil acceso" al dataframe
detach(Journals)

# Es recomendable NO usar attach y detach. Se pueden confundir las variables que ya tenemos.

# Para plotear lo mismo sin tener que "attachear" el dataframe:
plot(log(subs) ~ log(citeprice), data = Journals)

# Veamos la diferencia de plotear en niveles
plot(subs ~ citeprice, data = Journals)


# Exportando un gráfico a PDF
pdf("testPDF.pdf", height = 5, width = 6)
plot(subs ~ citeprice, data = Journals)
dev.off()  #cierra y lo manda al directorio de trabajo

## ?Devices para JPG y para PNG

jpeg(filename = "testJPG.jpg",  #no guarda transparencias
     width = 1000, height = 1000, units = "px")
plot(subs ~ citeprice, data = Journals)
dev.off()

png(filename = "testPNG.png",
    width = 1000, height = 1000, units = "px")
plot(subs ~ citeprice, data = Journals)
dev.off()

################################### Histogramas
# Densidad
hist(Journals$citeprice, freq = FALSE)
# Lines es un gráfico de línea, en este caso añade la apariencia de la densidad
lines(density(Journals$citeprice), col = 1)
# col indica el color, veamos otros
lines(density(Journals$citeprice), col = 2) # Rojo
lines(density(Journals$citeprice), col = 3) # Verde
lines(density(Journals$citeprice), col = 4) # Azúl
lines(density(Journals$citeprice), col = 5) # Verde agua
lines(density(Journals$citeprice), col = 6) # Rosa mexicano
lines(density(Journals$citeprice), col = 7) # Amarillo 
lines(density(Journals$citeprice), col = 8) # Gris

# Exportando el histograma a PDF

pdf("histoPDF.pdf", height = 5, width = 6)
hist(Journals$citeprice, freq = FALSE)
lines(density(Journals$citeprice), col = 2) # Rojo
dev.off()

# Embelleciendo el histograma
hist(Journals$citeprice, 
     freq = FALSE,
     border = NULL,
     main = paste("Distribución del costo por cita"),
     xlab = "USD por cita", 
     ylab = "Densidad")
lines(density(Journals$citeprice), col = 2) # Rojo

# Exportando nuevamente
pdf("histoPDFv2.pdf", height = 5, width = 6)
hist(Journals$citeprice, 
     freq = FALSE,
     border = NULL,
     main = paste("Distribución del costo por cita"),
     xlab = "USD por cita", 
     ylab = "Densidad")
lines(density(Journals$citeprice), col = 2) # Rojo
dev.off()

# Distribución de frecuencias
hist(Journals$citeprice)

# Resumen de la variable
summary(Journals$publisher)

tab <- table(Journals$publisher)
prop.table(tab)
barplot(tab)
pie(tab)

sortedtab = sort(tab, decreasing = TRUE)
otros = sum(sortedtab[7:52])
main = sortedtab[1:6]

Editoriales = append(main,otros)
Editoriales

# Eso hace a nuestros plots mucho más entendibles

barplot(Editoriales)

pie(Editoriales, main="Mayores editoriales de Journals")

# Exportando los plots
pdf("piePDF.pdf", height = 5, width = 6)
pie(Editoriales, main="Mayores editoriales de Journals")
dev.off()

# Generate a dataset from scratch


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

lbls <- c("US", "UK", "Australia", "Germany", "France") #vector de nombres
colnames(Xsample)=lbls
Xsample

index = matrix(1:30) #es para poder graficar despues
index

datos = cbind(index,Xsample) #unir dos matrices por colmnas
datos
datosF = as.data.frame(datos)

plot_colors <- c("blue","red","forestgreen")


# specify them ourself
plot(datosF$US, type="o", col=plot_colors[1], ylim=c(-2,13), ylab = "Crecimiento", xlab = "Periodos")
# Graph trucks with red dashed line and square points
lines(datosF$UK, type="o", pch=22, lty=2, col=plot_colors[2])

# Graph suvs with green dotted line and diamond points
lines(datosF$Australia, type="o", pch=23, lty=3, col=plot_colors[3])

# Create a title with a red, bold/italic font
title(main="Países", col.main="blue", font.main=4)

legend(25, 13, c("UK","Australia", "US"), c("blue","red","forestgreen"),cex=0.5) #25 13 en donde lo quieres



#################################
################# Graficos de distribuciones frecuentes
# Ploting a normal graph
curve(dnorm, from = -5, to = 5, col = "slategray", lwd = 3,
      main = "Density of the standard normal distribution")
text(-5, 0.3, expression(f(x) == frac(1, sigma ~~ sqrt(2*pi)) ~~ e^{-frac((x - mu)^2, 2*sigma^2)}), adj = 0)