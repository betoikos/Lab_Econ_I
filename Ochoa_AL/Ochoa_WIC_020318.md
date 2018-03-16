# Notas: Segunda sesion de R

Tópicos principales para usar R:

- Comparación de valores numericos y asignar a una variable booleana
- Comando IF
- loops
- comando FOR
    - Next
    
    
- Comando WHILE 
- Crear FUNCIONES
- crear valores en matrices cumpliendo distribuciones normales usando LIbrerias

    
    
### Comparación de valores numericos y asignar a una variable booleana

Se deben utilizar los siguientes comandos:


    #Operadores relacionares para comparar dos numeros, asigna booleanos
    7 == 8 #pregunta si es un numero igual, asigna un booleano
    3 != 7 # Es 3 diferente de 7?
    3 > 7 # es 3 mayor a 7?
    3 < 7 # es 3 menor a 7?
    3 <= 8 # es 3 menor o igual a 8?
    3 >= 8 # es 3 mayor o igual a 8?


El resultado:

    > #Operadores relacionares para comparar dos numeros, asigna booleanos
    > 7 == 8 #pregunta si es un numero igual, asigna un booleano
    [1] FALSE
    > 3 != 7 # Es 3 diferente de 7?
    [1] TRUE
    > 3 > 7 # es 3 mayor a 7?
    [1] FALSE
    > 3 < 7 # es 3 menor a 7?
    [1] TRUE
    > 3 <= 8 # es 3 menor o igual a 8?
    [1] TRUE
    > 3 >= 8 # es 3 mayor o igual a 8?
    [1] FALSE



 
###  Condicionales en R

R puede efectuar operacione básicas donde verifica si una condicion es cierta para continuar con una rutina.
Para ello utiliza  ***if*** si la condicion es cierta ejecuta lo indicado, si no es verdad se usa ***else*** y sigue esos comandos

Un ejemplo

    a=1
    b=1
    # Verificando si los numeros son iguales
    if (a==b)  {
        print("los dos numeros son iguales")
      } else { 
        print("lso dos numeros son distintos")
        }


El resultado:

     a=1
    > b=1
    > # Verificando si los numeros son iguales
    > if (a==b)  {
    +     print("los dos numeros son iguales")
    +   } else { 
    +     print("lso dos numeros son distintos")
    +     }
    [1] "los dos numeros son iguales"


### Crear funciones 

Las funciones son pequeñas rutinas que podemos crear para hacer una acción y tienen su propio subespacio, en ella se crean nuevas variables temporales, donde solo se guarda el ultimo valos que tome la funcion en la memoria.

Algunos ejemplos son:

***Funcion que saca el cuadrado de un numero real***

    ########haciendo funciones

    #cuadrado
    #Input: num real
    #output: el cuadrado del num real

    cuadrado = function(z){
      y=z^2
      return(y)
    } 

    cuadrado(5)

Resultado:

    > ########haciendo funciones
    > 
    > #cuadrado
    > #Input: num real
    > #output: el cuadrado del num real
    > 
    > cuadrado = function(z){
    +   y=z^2
    +   return(y)
    + } 
    > 
    > cuadrado(5)
    [1] 25
    > 


Pueden emplear más de dos variables, o incluso condicionales.
Las nuevas variables a utilizar se declaran delante del nombre de la funcion entre parentesis.

Ejemplo

***Hipotenusa***

    > ########haciendo funciones
    > 
    > #cuadrado
    > #Input: num real
    > #output: el cuadrado del num real
    > 
    > cuadrado = function(z){
    +   y=z^2
    +   return(y)
    + } 
    > 
    > cuadrado(5)
    [1] 25
    > 

Resultado:

    > #Hipotenusa
    > #input: 2 numeros reales
    > #output: valor de la hipotenusa
    > 
    > hipotenusa = function(a,b){
    +         c=sqrt(a^2+b^2)
    +       print(c)
    +     
    +   }
    >   
    > hipotenusa(-3,5)
    [1] 5.830952
    > 

### Generar Loops

Podemos usar diferentes comandos:

***WHILE***

Este comando hace acciones cumpliendo alguna condición. Ejemplos

    x=1
    while (x < 5) {
      x = x+1
      print(x)
    }

    #solo dentro del loop
    # next hace que se brinque un paso el loop
    #break para terminar el paso abruptamente

Actua desde 1 y hasta que ex sea menos qque 5

Resultado:

    > x=1
    > while (x < 5) {
    +   x = x+1
    +   print(x)
    + }
    [1] 2
    [1] 3
    [1] 4
    [1] 5
    > 
    > #solo dentro del loop
    > # next hace que se brinque un paso el loop
    > #break para terminar el paso abruptamente

si incorporamos ***next*** en la rutina hace lo siguiente:

    > x=1
    > while (x <8) {
    +   x = x+1
    +   if (x==4)next
    +   print(x)
    + }
    [1] 2
    [1] 3
    [1] 5
    [1] 6
    [1] 7
    [1] 8

Se salta la accion para cuando x= 4


***FOR***

Este comando hace acciones con una secuencia de conteo, se puede usar con elementos de un vector.

Ver ejemplos a continuación:

    #For

    for (i in  1:30) {
      print(paste("este es el loop",i))
      print(i*i)
    }


Resultado: Solo mostramos el final de la secuencia, termina en 30.

     "este es el loop 27"
    [1] 729
    [1] "este es el loop 28"
    [1] 784
    [1] "este es el loop 29"
    [1] 841
    [1] "este es el loop 30"
    [1] 900
    
Un ejemplo de algoritmo que incorpora parte de los conceptos antes visto es el que s emuestra a continuación para MCD,se usa un loop y se debe tener cuidado en verificar las condiciones de las acciones que se piden para verificar en R o se podría generar un Loop infinito.

***Euclides - MCD ***

Código:

    MCD <- function(a,b){
      A =a
      B =b
      if (A !=0){
        while (B!=0) {
          if (A>B){
            A=A-B
          }else {B=B-A}
          return(A)
        }
      }
      else {return (B)}
    }

    MCD(10,5)
    MCD (0,5)

Resultado:

     MCD(10,5)
    [1] 5
    > MCD (0,5)
    [1] 5
    
    
    
*** Rutina/funcion para MCO ***


Código:



    MCO= function (x,y){
      X=x
      Y=y
      xr=nrow(X)
      yr=nrow(Y)
      if(xr==yr){
        b=solve(t(X)%*%X)%*%t(X)%*%Y
        return(b)
      }else {
        print("verifique las dimensiones de la matriz")
      }
    }


    D=matrix(c(5,9,3,4,98,4,5,48,8,32,22,788,4,5,98,7,15,8),6)
    D

    E=matrix(5:10,6)
    E

    F=matrix(5:9,5)
    F

    MCO (D,E)

    MCO (D,F)


Resultado:

    > MCO (D,E)
               [,1]
    [1,] 0.08619368
    [2,] 0.01216441
    [3,] 0.07493308
    > 
    > MCO (D,F)
    [1] "verifique las dimensiones de la matriz"
    > 


### crear valores en matrices cumpliendo distribuciones normales usando LIbrerias

***Librerias***
Finalmente, se vio como generar valores aleatorios para matrices y vectores con alguna distribución
Usamos librerías, que son recursos que ya contienen rutinas/funciones hechas por alguien más, así solo llamamos las funciones sin contruirlas. Un ejemplo es la libreria ***MASS***

***Distribuccion normal univariada***

Construir valores aleatorios para una variable normar con media "mu" y varianza "su".

El código es:

    #libraries

    #buscar paquetes
    #instalar un paquete
    #llamar un paquete

    ###Llamar un paquete

    #muestras  aleatorias normales

    library(MASS)

    n=30 #Tamaño de la muestra

    mu= 0 #media de U una variable aleatoria con 30 observaciones
    su= 0.2 #varaianza de u


    #rnorm Muestra aleatoria de U , solo 1 var aleat
    #mvnorm  Muestra aleatoria de vector normal multivariado



    ####Este es parte del código del laboratorio para crear las matrices, tomado del reposotorio de Humberto



    Usample = rnorm(n,mu,su) # Muestra aleatoria de U
    Usample
    
Resultado:

    > 
    > Usample = rnorm(n,mu,su) # Muestra aleatoria de U
    > Usample
     [1]  0.033343559 -0.158688194  0.002026121 -0.076377428 -0.120557238  0.051055900
     [7]  0.068841266 -0.159847466 -0.047902122  0.245684798  0.071206874  0.078642356
    [13]  0.077965037  0.281361458  0.386149365  0.110488137  0.109460356  0.196353605
    [19]  0.080776672  0.180239970 -0.046302538 -0.113934457  0.206706792  0.015694975
    [25]  0.196863595 -0.050249084 -0.258992319  0.117221920  0.210388553  0.130477677
    > 
    
Genera 30 valores para una variable aleatoria normal con media y varianza especificadas.


***Distribucion normal multivariada***

Otro comando similar, pero para normales multivariadas es el siguiente:

Código:


    mx = c(4,2,0,0,2) # Vector de medias de X 
    sx = matrix(c(4,-1,0,0,0,
                  -1,1,0,0,0,
                  0,0,1,0,0,
                  0,0,0,8,2,
                  0,0,0,2,4),5) # Varianza de X


    Xsample = mvrnorm(n,mx,sx) # Muestra aleatoria de x1 y x2
    Xsample

Resultado:
    > mx = c(4,2,0,0,2) # Vector de medias de X 
    > sx = matrix(c(4,-1,0,0,0,
    +               -1,1,0,0,0,
    +               0,0,1,0,0,
    +               0,0,0,8,2,
    +               0,0,0,2,4),5) # Varianza de X
    > 
    > 
    > Xsample = mvrnorm(n,mx,sx) # Muestra aleatoria de x1 y x2
    > Xsample
                 [,1]      [,2]         [,3]       [,4]       [,5]
     [1,] 1.386073850 2.7045064  0.008418856  3.1175716  2.6412508
     [2,] 5.078444588 1.1847208 -0.906835748  5.8019939  3.4777804
     [3,] 2.395820805 2.1776276  1.524004623  1.3944838  1.7035524
     [4,] 3.717124565 2.9698692 -0.975520775  0.2544944  3.1629174
     [5,] 4.191457960 1.8846104 -1.576018538 -0.8926122  4.3077429
     [6,] 2.868563893 2.4452920 -0.812830273  1.9001417  3.2753700
     [7,] 0.002913181 1.8296752  0.168332834 -2.7950632  2.4192506
     [8,] 6.247622575 0.5745455 -0.720625276  0.5970588  0.6396950
     [9,] 3.188603116 1.4611411 -0.150444314 -4.5007920 -2.1444191
    [10,] 1.304216422 1.5548484  1.460669878  0.5893683  3.0211227
    [11,] 4.528493312 2.0327034  0.981064894 -2.7430115  1.8179268
    [12,] 3.678931968 3.3567881  0.525393092 -2.3278794  0.4237694
    [13,] 5.764263741 2.8990594 -0.656176202  2.7975826  4.8655566
    [14,] 5.311195192 1.0316867 -0.408396499 -1.9414882  1.3167829
    [15,] 5.411334093 1.4899313  1.376370155  4.2065129  3.0513065
    [16,] 4.968715974 1.1123590  0.869640607  4.9658954  4.0230338
    [17,] 2.079542917 1.7991424 -1.291862502 -2.3480831  4.8407348
    [18,] 5.038674794 1.3585342  0.290455528  0.6155756  3.9971915
    [19,] 2.580891473 3.5187651  0.285775225 -0.1009767  2.3552445
    [20,] 3.240752246 1.2393524 -0.877143776 -0.3658160 -0.1538403
    [21,] 2.691295631 2.4781160 -0.958466588 -0.3781520  1.3377850
    [22,] 1.032992188 3.1361951 -0.719276129 -5.8331772 -0.8094398
    [23,] 5.612055880 0.9281383 -0.713953832  1.1105260 -0.3125790
    [24,] 4.507076114 0.7887981  0.387374348 -2.0569923 -0.1256527
    [25,] 5.817231308 1.6396784 -0.802097432  0.1124421 -0.2361442
    [26,] 2.332978742 3.3808622 -1.103481870 -0.7217206 -1.8927920
    [27,] 1.114702036 2.3794153 -0.414395483 -3.8718083  2.3557177
    [28,] 5.390063275 1.1813496  1.616470869  0.1728187  1.8862751
    [29,] 4.348964520 0.6889134 -0.753369333  0.3084520  3.1005414
    [30,] 4.436536407 3.1737399 -0.382151018  1.5498762  1.9507018
    > 


Genera 30 valores que cumplen con las condiciones establecidas para media y varianza de un vector.