
# Primera sesión de R
_____________________________________________

En esta sesión rebizamos el comando getwd(), la cual muestra el directorio de trabajo

    getwd()
    C:/Users/Riccardo/Documents

Algunas funciones aritméticas básicas son:

    Raíz cuadrada sqrt()
    logaritmo log()
    exponencial exp()

Existen gran cantidad de etiquetas para catalogar a una variable, a continuación unas clasificaciones relevantes

    a=10 class(a) [1] "numeric"
    b="cat" class(b) [1] "character"

Las matrices se crean con la siguiente formula

    A=matrix(c(1,2,3,4,5,6,7,8,9)3,3)
    siempre es renglon columna el orden
    
Para hacer la transpuesta se utiliza
    
    B=t(A)
    para realizar multiplicaciones
    AB=A%*%B
    
Para solo tomar ciertes elementos de la matriz se utilizan los corchetes

    z=A[,2]
    
Para unir elementos se utiliza
  
      por renglones
      rbind(A,B)

      por columnas
      cbind(A,B)
