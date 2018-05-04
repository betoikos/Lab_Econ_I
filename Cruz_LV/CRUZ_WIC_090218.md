# Notas de Clase 09 de Febrero 2018
Uso de Brackects/Markdown para las notas de clase

Ver el archivo template.md de la carpeta H que se encuentra dentro del repertorio Lab_Econ_1 y tambien disponible en [este link](https://github.com/betoikos/Lab_Econ_I/blob/master/H/template.md).

## Clase de RStudio

Utilizamos "#" para hacer comentarios en R

El comando setwb(" ") fija el directorio donde se guardan los archivos de R

* Ejemplo: setwd("C://Users/Luis Valentin Cruz/Documents/GitHub/Lab_Econ_I/Cruz_LV")

### Operaciones básicas en R

En R podemos realizar calculos sencillos y complejos, estos incluyen las operaciones aritméticas: suma, resta, multiplicación, división y otras como la función valor absoluto, el logaritmo de un número, la exponenciación y la raíz cuadrada.


* Ejemplo: 1+1, 5-2, 2*2, 9/3, abs(-10), sqrt(36), round(3.1416, digits=2), log(1), exp(-2).


### Definir variables en R
Hay dos formas de definir una variable en R, la más común es utilizar "<-"; también se puede utilizar el simbolo "=" para definir una variable y esta es la que a menudo utilizaremos. Al definir variables hay que tomar en cuenta si ésta es de tipo númerico, caracter/de cadena, o booleana. 

Ejemplo:
*   a = 35

*   b = "Alimentos"

*   c = TRUE

Utilizamos el comando Class() para saber el tipo de dato o variable y utilizamos el nombre de la variable que definimos para realizar operaciones, incluso podemos crear nuevas variables a partir de las ya definidas.

### Vectores y Matrices en R
Para definir una variable como vector en R utilizamos el comando c(), dentro de los paréntesis colocamos las variables que deseamos (pueden ser de los tipos antes ya mencionados).

* Ejemplo: Vector = c(2, "niño", TRUE)

Se puede operar con vectores de acuerdo al tipo de variable que hayamos utilizado, por ejemplo, podemos realizar operaciones aritméticas con dos vectores de tipo numérico.

También se pueden crear matrices en R utilizando el comando matrix(), dentro de los paréntesis ponemos las especificaciones de la matriz, por ejemplo, si quiero una matriz con números del 1 al 10 distribuidos en 2 filas, se puede definir de la siguiente manera: M = matrix(1:10, byrow = TRUE, nrow=2).

Al igual que con los vectores también se pueden operar matrices ya definidas respetando las reglas del álgebra matricial.
* Suma y resta: Z = A + B - C
* Producto: H = A%*%B
* Matriz transpuesta: F = t(M)
* Matriz inversa: G = solve(M)
* Concatenar matrices: J = cbind (A,B) | Concatenar horizontalmente, J = rbind (A,B) | Concatenar verticalmente
* Matriz idéntica: I = diag(n)

También podemos definir nuevos matrices/vectores a partir de los ya definidos.

* Ejemplo: j = A[,1] Columna uno de la matriz A , j = A[1,] Fila uno de la matriz A

Hasta aquí la primera sesión de R, Realizar los ejercicios 4 y 6 de la tarea 1 de econometría.

    Ejercicio 4: Sea X = (x1, x2, x3) vector aleatorio de dimensión 3 y Y = (y1, y2) vector aleatorio de dimensión dos.
    i)ENcontrar E(X), VAR(X), E(Y), VAR(Y), COV(X,Y), COV(Y,X)
    
