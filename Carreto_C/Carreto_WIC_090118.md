
# ########### SESIÓN 1 DE R #################

# DIRECTORIO DE TRABAJO
    getwd()
    setwd("C:/Users/tino_/OneDrive/Documentos/GitHub/Lab_Econ_I/Carreto_C")
    getwd()

# operaciones basicas
    abs(-5)
    round(5.5)
    log(44)

# Guardar objetos
    b<-54
    c<-"perrito"
    g<-TRUE #booleana
    g

# tipo de variable
    class(g)

# Operaciones entre numericas

# multiplicar boleanos por numericos

# Crear nuevas variables

#########################3
# Vectores
    c(5,4,6,4322,45,0,0,0,0)
    A<-c(5,4,6,4322,45,0,0,0,0)
    Animalitos=c("perro","gato","pollo")
    Animalitos

    Vbooleano=c(TRUE,FALSE)

    A<E
##################

    A=matrix(c(1,2,3,4),2)
    A

    D=matrix(1:9,byrow = FALSE,nrow = 3)
    D

#
    A%*%D

    #TRANSPUEST
    #identidad
    i10=diag(10)
    i10
######

    a[1]
# inversa de una matriz

#
# ##########
# concatenar matrices


#######


# tarea 1 ejercicio 4
# definiciones

    Ex1=0
    Ex2=-4
    Ex3=1
    Ey1=-1
    Ey2=4

    varx1=1
    varx2=4
    varx3=2
    vary1=1
    vary2=9

    covx1x2=-1
    covx1x3=0
    covx1y1=0
    covx1y2=1

    covx2x3=2
    covx2y1=-1
    covx2y2=-3

    covx3y1=0
    covx3y2=3
    covy1y2=-2


# inciso i
# E(x)
# primera transpuesta es para indicar que sea matriz
# segunda transpuesta para indicar que transponga
    EX=t(t(c(Ex1,Ex2,Ex3)))
# otra forma
    Ex=matrix(c(Ex1,Ex2,Ex3),3)

    var(x)=matrix(c(varx1,covx1x2,covx1x3,covx2x1,
                varx2,covx2x3,covx3x1,covx3x2,varx3),3)

# VARY
    varY=matrix(c(vary1,covy1y2,covy1y2,vary2),2)

# Para el trabajo final: hacer 4 y 6 
# copiar y pegar codigo en markdown, pero dar tabulador
