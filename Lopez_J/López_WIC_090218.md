# Primera sesión de R.
En la primer parte del laboratorio se mostraron las funciones getwd() y setwd(), las cuales nos dicen cual es nuestra carpeta de trabajo y la cambia, respectivamente.
 getwd()
 setwd("C://Users/Jhair/OneDrive/Documentos/Lab_Econ_I/Lopez_J/HW14")

## Sobre las funciones basicas integradas.
Aqui se mostraron algunas funciones importantes de conocer y que se encuentran integradas en R por default.
1. Raíz cuadrada.
 sqrt(10)
 [1] 3.162278

2. Logaritmos y exponencial.
 > log(2)
 [1] 0.6931472
 > exp(4)
 [1] 54.59815

## Sobre los tipos y la asignación de variables.

En esta parte de mostro que los datos podian ser caracteres, números o valores logicos, de forma que con ellos se podía operar. Para saber que tipo de datos contiene un elemento se usa la función class(), y para asignar valores se define una (variable)=(valor).

 > a=exp(1)
 > class(a)
 [1] "numeric"
 > b="dog"
 > class(b)
 [1] "character"

Los vectores se pueden crear con el comando c(), que dentro tiene los elementos separados por comas:

 > a=c(1,2,3,4)
 > a
 [1] 1 2 3 4

Con los cuales se puede operar con facilidad al igual que con los números.

En el caso de matrices, estan se crean de la siguiente manera:

 > A = matrix(c(1,2,3,4,5,6,7,8,9),3)
 > A
      [,1] [,2] [,3]
 [1,]    1    4    7
 [2,]    2    5    8
 [3,]    3    6    9

Que por defaul, acomoda los valores por columna, en caso de quererse por hilera se le agrega el comando matrix(...,byrow=T).
Con las matrices la multiplicación de matrices se hace como sigue:

 > C= matrix(1:9, byrow = TRUE, nrow = 3)
 > A-C
      [,1] [,2] [,3]
 [1,]    0    2    4
 [2,]   -2    0    2
 [3,]   -4   -2    0
 > A%*%C
      [,1] [,2] [,3]
 [1,]   66   78   90
 [2,]   78   93  108
 [3,]   90  108  126

Donde la ultima operación indica dicha multiplicación matricial.
Para transponer dicha matrix se usa la función t() , para la identidad la función diag() y para sacar la inversa solve()

 > t(A)
      [,1] [,2] [,3]
 [1,]    1    2    3
 [2,]    4    5    6
 [3,]    7    8    9
 > diag(3)
      [,1] [,2] [,3]
 [1,]    1    0    0
 [2,]    0    1    0
 [3,]    0    0    1

Para llamar elementos de una matriz de utilisan corchetes, de la siguiente manera:

 > A[1,1]
 [1] 1
 > A[,1]
 [1] 1 2 3

Donde el primer elemento son el número de hilera y columna.
Para concatenar matrices, es decir juntarlas se usa la función cbind() y rbind(), las cuales agregan elementos por columna o hilera.

 > cbind(A,C)
      [,1] [,2] [,3] [,4] [,5] [,6]
 [1,]    1    4    7    1    2    3
 [2,]    2    5    8    4    5    6
 [3,]    3    6    9    7    8    9
 > rbind(A,C)
      [,1] [,2] [,3]
 [1,]    1    4    7
 [2,]    2    5    8
 [3,]    3    6    9
 [4,]    1    2    3
 [5,]    4    5    6
 [6,]    7    8    9

