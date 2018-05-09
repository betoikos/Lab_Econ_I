# **Notas de segunda sesión de R.**

## **_Sobre la definición y utilidad de algoritmos._**

En esta parte del laboratorio se proyecto un video sobre el significado de algoritmo; así, se dijo que esté era Un proceso ordenado el cual se alimenta de outputs, que al ser procesado mediante secuencias de instrucciones, genera un resultado deseado, es decir un output.

## **_Intruducción al uso y formulación de funciones en R._**

### _Elementos racionales_

Como primer aproximación vimos que R permite hacer pruebas logicas sobre si un valor es igual, mayor, menor o diferente de otro número especificado. 
Ejemplo:

    1==2......Para saber si el número 1 es igual a dos
    1!=2......Para saber si uno es diferente de 2
    1>2.......Para saber si uno es mayor a 2
    1<=2......Para saber si uno es menor o igual a 2.


### _Uso de condicionales._

Para esto se debe de seguir lo siguiente:

    if("Argumento a ser condicionado"){

   "Instrucción a llevarse a savo si el argumento es verdadero"

    } else {

    "Instrucción a llevarse a cabo si es falso"

    }

Por ejemplo:

    x=1
    if(x =1){
        print("Eres un genio")
      } else {
        print("Puedes vender fruta")
     }

### _Elaboración de funciones._

Para este fín, se hace uso de la función de R function(), la cual permite definir que hacer con objetos y posteriormente permite ejecutar las instrucciones a argumentos especificos. Por ejemplo, con un nivel alto de dificultad:

    masuno= function(x){
      y=x+1
      return(y)
    }

    masuno(2)

    [1] 3

Para llevar a cabo las funciones se recomendo tener claro cuales son nuestros inputs y outputs, de este modo para la función anterior tendriamos.

    Input: Cualquier número elemento de los reales.
    Output: Un número elemento de los reales.

Como ejercicio de condicional, se mostró en el laboratorio el ejemplo de la obtención de una raíz cuadrada, de modo que:

    raiz = function(x){

      if(x<0){

        print("El número es negativo y se ve que no sabes lo elemental")

      } else {

        return(sqrt(x))

      }

    }

    raiz(0)
    [1] 0

Así tambien se mostraron algunos ejercicios más complejos en su elaboración.

### _Uso de loops._

1. Operación con while().

La operación while() permite generar una operación a un argumento mientras se mantenga en unos limites establecidos. Así:


    "Argumento"="número"

    while(Condición limite al argumento) {

      "Operación que llevará el argumento" 

      print("Operación")

      }
  
  Ejemplo:
  
      x = 2

    while(x>=2) {

      x = 1/x

      print(x)

    }
    [1] 0.5

2. Uso de For()

Este tipo de loop es adecuado para definir un procedimiento a un conjunto de valores dentro de un conjunto. Así:

    for("Conjunto de valores"){

      "Función o procedimiento a ser ejecutado"

      print("Instrucción")

    }

Así a modo de ejemplo de clase:

    for(i in 1:5){

      print(paste("Este es el loop",i))

      print(i*i)

    }
    [1] "Este es el loop 1"
    [1] 1
    [1] "Este es el loop 2"
    [1] 4
    [1] "Este es el loop 3"
    [1] 9
    [1] "Este es el loop 4"
    [1] 16
    [1] "Este es el loop 5"
    [1] 25

### _Desarrollo de logaritmo util para clases de econometría._

Como lo explicó y fue elaborado por el laboratorista, se presento la forma de elaborar el algoritmo para obtener los estimadores por Minimos Cuadrados Ordinarios (MCO), el cual se alimenta de matrices conformables como inputs y como output nos brinda el valor de los estimadores.

Así y sustentando el procedimiento mediante lo desarrollado en las tareas, se obtuvo lo siguiente:

    MCO = function(x,y){

      X=x

      Y=y

      xr=nrow(X)

      yr=nrow(Y)

      if(xr==yr){

        b=solve(t(X)%*%X)%*%t(X)%*%Y

        return(b)

      } else {

        print("No se puede llevar a cabo la operación, verifique las dimensiones de las matrices")

      }

    }

    A=matrix(c(5,9,15,65,98,84,5,48,8,32,45,788,4,8,98,7,15,8),6)

    A

         [,1] [,2] [,3]
    [1,]    5    5    4
    [2,]    9   48    8
    [3,]   15    8   98
    [4,]   65   32    7
    [5,]   98   45   15
    [6,]   84  788    8


    B=matrix(5:10,6)


        [,1]
    [1,]    5
    [2,]    6
    [3,]    7
    [4,]    8
    [5,]    9
    [6,]   10


    C=matrix(5:9,5)

        [,1]
    [1,]    5
    [2,]    6
    [3,]    7
    [4,]    8
    [5,]    9

    MCO(A,B)

                [,1]
    [1,] 0.094033982
    [2,] 0.002406379
    [3,] 0.061237352