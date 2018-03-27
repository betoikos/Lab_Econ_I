Rogelio Daniel Gonzàlez Gonzàlez
Colegio de Mèxico
Centro de Estudios Econòmicos (**CEE**)
Laboratorio de Econometrìa #3
**Fecha**: 23 de marzo de 2018
Laboratorio de R #3

**summary**(NombreDeLaBase): principales estadìsticos de la base de datos
**head**(''): da los primeros renglones de la base de datos
**tail**(''): da las ùltimas lineas de la base de datos
**attach**(''): permite acceder a los elementos de un dataframe directamente
**detach**(''): para dejar la base de datos fuera del ambiente global
**sort**(''): acomoda la tabla de mayor a menor

*Creando gràficos*

**plot(x,y)**: gràfico tipo scatter
**rug(x) rug(y, side=2)**: añade barras para indicar distribuciones a manera de histogramas en los ejes.
*Desde el dataframe*: **plot(x ∼ y, data= *BaseDeDatos*)**

*Exportar gràficos en PDF (*Recomendado para Latex*)*

plot(x ~ y, data = *BaseDeDatos*)
pdf("testPDF.pdf", height = 5, width = 6)
plot(x ~ y, data = **)
dev.off()

*Exportar gràficos en JPG y NPG*

jpeg(filename = "testJPG.jpg",
     width = 1000, height = 1000, units = "px")
plot(x ~ y, data = *BaseDeDatos*)
dev.off()

*Histogramas*

hist(*BaseDeDatos*$*Variable*, freq=FALSE)
lines(density(*BaseDeDatos*$*Variable*, freq=FALSE), col=1)

hist(*BaseDeDatos*$*Variable*, 
     freq = FALSE,
     border = NULL,
     main = paste("Tìtulo"),
     xlab = "EjeX", 
     ylab = "EjeY")
lines(density(*BaseDeDatos*$*Variable*), col = 2) # Rojo

    summary(*BaseDeDatos*$*Variable*)
    tab=table(*BaseDeDatos*$*Variable*)
    prop.table(tab)
    barplot(tab)
    pie(tab)
    sortedtab = sort(tab, decreasing = TRUE)
    otros = sum(sortedtab[7:52])#crea nueva con el resto
    main = sortedtab[1:6]
    Editoriales = append(main,otros)
    barplot(Editoriales) #graficos entendibles
    pie(Editoriales, main="Mayores editoriales de Journals")
    