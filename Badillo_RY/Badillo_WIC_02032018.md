#Sesión 2 de R
#Operadores
```
6==8  
6!==8
6<=8
```
##condicionales
```
a=1
b=1
```
>Verificar si dos números son iguales
```
if(a!==b){
print("los dos numeros son egaux)"
} else 
print("non son diferentes")
}
funciones
help("function")
```
```
sqrt(25) ¿
nrow(X)
ncol(X)
```
```
cuadrado = function(z){
y=z^2
return(y)
}
```
```
cuadrado(555)
```
##Otro ejemplo
```
raiz=function(x){
if(x<0){
print("el número es negativo y me rehuso a darte el ultimo beso")
} else{
    return(sqrt(x))
}
}
raiz(9)
```
```
hipo=function(a,b){
c=sqrt(a^2+b^2)
return(c)
}

hipo(3,4)
```
##Chicharronera para polinomios de la forma ax^2+bx+c
>input: tres números reales a, b, c
>output: si se cumple que b^2>=4ac 
```
chi=function(a,b,c){
cond=b^2>4*a*c
if(cond){
    z1=(-b+sqrt(b^2-4*a*c))/2*a
    z2=(-b-sqrt(b^2-4*a*c))/2*a
    Z=matrix(c(z1,z2),1)
    return(Z)
    } else{
    print("el polinomio tiene raíces complejas")
    }
}

chi(2,4,2)
Loops
x=1
while(x<10){
x=x+1  #los valores dentro de una función son locales 
print(x)
}
```
##"next" hace que se brinque un paso el loop
##"break" termina el loop abruptamente
```
x=1
while(x<8){
x=x+1
if(x==4) next
print(x)
}
función "for"
for(i in 1:300){
    print(paste("este es el loop",i)) #la función paste pega un valor numérico con un texto
print(i*i)
}
```

##cosas que aprendí hacer funciones
```
raiz = function(x,y){
  if (x<=0){
    print("we cant express imaginary numbers")
  }
  else{
    return(sqrt(x))
  }
}

raiz(5)

cuadratica <- function(a,b,c){

  if (b^2>4*a*c){
    z1=(-b+sqrt(b^2-4*a*c))/2*a
    z2=(-b-sqrt(b^2-4*a*c))/2*a
    return(matrix (c(z1, z2), 1))
  }
  else 
    print('el polinomio no tiene raices reales')
    
}
cuadratica (1,4,2)

x=1
while(x < 5) {x <- x+1
print(x)
}

for (year in c(2010,2011,2012,2013,2014,2015)){
  print(paste("The year is", year))
}

euclides= function(a,b){
  A=a
  B=b
  if (A!=0){
    while (B!=0){
      if (A>B){
        A=A-B
      }else {
        B=B-A
      }
    }
    return(A)
  }
 else {
  return(B)
}
}

euclides(4,0)

```
