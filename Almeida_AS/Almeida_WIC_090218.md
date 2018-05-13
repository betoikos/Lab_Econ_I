# *Notas de primera clase en R* 

##### Siempre fijar carpeta de origen

    getwd()
    setwd("C://Users/Yunoen Badillo Salas/Documents/GitHub/Lab_Econ_I/Almeida_AS")

##### Se pueden hacer operaciones simple 

    1+1
    2-3
    5*4
    100/4
    25^3


    sqrt(4)
    abs(-5)
    log(365)
    exp(3)

##### Variables y tipos de variables 
###### podemos utilizar el igual o <- para definir una variable 


    a = 52  
    a <- 52 


    b = "perrita"
    d = FALSE #Bolean

###### si quiero saber qué tipo de dato/variable es X objeto, usar:
    class(b)
    class(a)
    class(d)

    a+a
    a+c
    a*d #se pueden multiplicar numéricos con booleanos pero no con strings (con palabras)

    hello=a*c
    sqrt(hello)

#----------------

###### Vectores y matrices 

###### Creando un vector
    c(3,4,2,1)

    #Los vectores también se pueden guardar 
    A= c(1,2,3,4,5)
    Reggeatoneros = c('JBalvin', "Maluma baby", "Ozuna")

###### Matrices
###### Elementos ordenados de n en n
    A= matrix(c(2,3,4,5,6,7,8,9,9),3)
    A

###### Matriz de cincos, con 4 filas y 10 columnas
    B= matrix(5,4,10)
    B

###### Matriz con elementos del uno al nueve, ordenados en 3 filas
    C= matrix(1:9, byrow=TRUE, 3)
    C

    f=t(A)
    f

###### Identidad de tamaño k
            I_5 = diag(5)
            I_5


###### Seleccionar elementos de una matriz 

###### Elemento all
###### fila 1
    A[1,]

    #Columna 1
    A[,1]

###### Inversa de una matriz

    I = solve(A)
    I

###### Cambiando el elemento 2 de la matriz A
    A[2]= 5521
    A

###### Cambiando la primera columna de O
    A[,1]=c(3,3,3)
    A

###### Concatenar matrices horizontalmente  (juntar dos matrices)
    P= cbind(A,C)
    P
