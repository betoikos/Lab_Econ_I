

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

