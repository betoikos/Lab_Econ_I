# Tarea 2 Ejercicio 5
### Creamos una función para obtener bmco

    Bmco = function(x,y){
          z=solve(t(x)%*%x)%*%t(x)%*%y
        return(z)
    }

    Bmcr = function(x,y,R,r){
      z=Bmco(x,y)-solve(t(x)%*%x)%*%t(R)%*%solve(R%*%solve(t(x)%*%x)%*%t(R))%*%(R%*%Bmco(x,y)-r)
      return(z)
    }

### No se puede calcular bmco con u y x únicamente, ya que tenemos una ecuación y dos variables por encontrar, Y y bmco. 