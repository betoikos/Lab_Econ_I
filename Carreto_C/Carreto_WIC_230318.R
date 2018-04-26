##############laboratorio 3

# Data frames
# Plots

#
install.packages("AER")
library("AER")

data("Journals")
summary(Journals)
JOURNAL = matrix(1:100)
head(Journals)
tail(Journals)

#Creamos una variable que diga el precio por cada cita
Journals$citeprice <- Journals$price/Journals$citations

# attach() 
attach(Journals)

# Scatter plot
plot(log(subs), log(citeprice))

# rug() 
rug(log(subs))
rug(log(citeprice), side = 2)

# detach() 
detach(Journals)

# Para plotear lo mismo sin tener que "attachear" el dataframe, 
#usamos el signo "~"
plot(log(subs) ~ log(citeprice), data = Journals)

# 
plot(subs ~ citeprice, data = Journals)


# Exportando un gráfico a PDF
pdf("testPDF.pdf", height = 5, width = 6)
plot(subs ~ citeprice, data = Journals)
dev.off()

#Devices para JPG y para PNG

jpeg(filename = "testJPG.jpg",
     width = 1000, height = 1000, units = "px")
plot(subs ~ citeprice, data = Journals)
dev.off()

png(filename = "testPNG.png",
    width = 1000, height = 1000, units = "px")
plot(subs ~ citeprice, data = Journals)
dev.off()

# Histogramas usamos
# Densidad
hist(Journals$citeprice, freq = FALSE)
lines(density(Journals$citeprice), col = 1)

# Exportando el histograma a PDF

pdf("histoPDF.pdf", height = 5, width = 6)
hist(Journals$citeprice, freq = FALSE)
lines(density(Journals$citeprice), col = 2) # Rojo
dev.off()

# Detalles del histograma
hist(Journals$citeprice, 
     freq = FALSE,
     border = NULL,
     main = paste("Distribución de el costo por cita"),
     xlab = "USD por cita", 
     ylab = "Densidad")
lines(density(Journals$citeprice), col = 2) # Rojo


#Hacer un dataframe desde cero

library(MASS)

n = 30 # Tamaño de la muestra

mx = c(4,2,0,0,2) # Vector de medias de X 
sx = matrix(c(4,-1,0,0,0,
              -1,1,0,0,0,
              0,0,1,0,0,
              0,0,0,9,2,
              0,0,0,2,4),5) # Varianza de X

Xsample = mvrnorm(n,mx,sx) # Muestra aleatoria de x1 y x2
Xsample

#etiquetas
lbls <- c("US", "UK", "Australia", "Germany", "France")

# Aplicamos las etiquetas 
colnames(Xsample) = lbls


# Creamos un vector de colores 
plot_colors <- c("blue","red","forestgreen")

# Creamos el gráfico base
plot(datosF$US, type="o", col=plot_colors[1], ylim=c(-2,13), ylab = "Crecimiento", xlab = "Periodos")


# Asignamos el título al gráfico
title(main="Países", col.main="blue", font.main=4)


