# Notas de Clase 02 de Marzo 2018

## Clase de RStudio

### Operadores relacionales

"==" Compara dos valores y me arroja un valor lógico

"!=" Diferente de

">" Mayor que

"<" Menor que

### Condicionales

    If(){} 
    Else{}
    
    Ejemplo: Raíz de un número
    Raiz = function(x){ 
    if(xmenorque0){
    print("Inválido")
    } else {
    return(sqrt(x))
    }
    }

### Loops (Bucles)

#### While

Ejemplo: Asigna a la variable x el valor de uno y repite el bucle hasta que x + 1 sea igual a 5
    
    x=1
    while(x<5){
    x=x+1
    print(X)
    }
    
#### For

Ejemplo: Para cada observación desde 1 hasta 30 imprime "Loop i"

    for(i in 1:30){
    print(paste("Loop",i))
    }
### Ejemplo algoritmo para calcular MCO

Input: matriz x de variables explicativas, matriz y de variables dependientes

Output: vector b que miniza la suma de residuos al cuadrado en y=xb-U

    MCO = function(x,y){
    X=x
    Y=y
    xr=nrow(X)
    yr=nrow(Y)
    if(xr==yr){
    b=solve(t(X)%*%X)%*%t(X)%*%Y
    return(b)
    } else {
    print("No se puede llevar a cabo la operación matricial")
    }
    }
    
#### Muestras aleatorias de la distribución normal

Usamos los comandos "rnorm() y mvrnorm()" para generar muestras aleatorias