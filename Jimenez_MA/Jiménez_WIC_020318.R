# Relaciones
"=="  # Igual
"!=" # Diferente
"> " # Mayor
"< " # Menor
"<=" # Menor o igual
">=" # Mayor o igual

# Condicionales
# Uso del IF
if(condici�n) {
  Sentencia_1 ## Si la condici�n se cumple (TRUE)
} else {
  Sentencia_2 ## Si la condici�n no se cumple (FALSE)
}  

#Funci�n existente 
sqrt(10000) # Regresa la ra�z cuadrada del argumento, i.e. en este caso de 10000.

#Funci�n creada.
Nombre_funci�n = function(variable_independiente){
  F�rmula_o_sentencia # Variable dependiente igual a algo de la variable independiente
  return(variable_dependiente)
}

# Uso del While 
while(condici�n) { 
  Sentencia_o_comando
# Se ejecuta el comando repetidamente, siempre que la condici�n sea TRUE.
}

# Uso del For
for (variable in a:b) {
  Sentencia_o_comando
  # El comando se ejecuta n veces (longitud de la secuencia) y en cada iteraci�n el valor de la variable asume cada uno de los valores de secuencia.
}

#Llamar librero
library(Nombre_paquete)