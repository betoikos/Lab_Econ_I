#Tarea 2 Ejercicio 5

Bmco = function(x,y){
      z=solve(t(x)%*%x)%*%t(x)%*%y
    return(z)
}

Bmcr = function(x,y,R,r){
  z=Bmco(x,y)-solve(t(x)%*%x)%*%t(R)%*%solve(R%*%solve(t(x)%*%x)%*%t(R))%*%(R%*%Bmco(x,y)-r)
  return(z)
}

#No se puede calcular bmco con u y x �nicamente, ya que tenemos una ecuaci�n y dos
#variables por encontrar, Y y bmco. 


