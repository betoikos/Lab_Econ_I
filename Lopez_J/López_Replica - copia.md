# Replica y analisis de regresión del articulo *"Does pay inequality within a team affect performance?"* para 2005-2010.

Con el metodó de extrancción de información de los juegos ganados y salarios por equipo en el beisbol norteamericano, así como con los metodos de tratamiento de los datos obtenidos y guiados por la replica del laboratorista se obtuvieron los siguientes resultados de la regresión:

    =============================================================================
                                        Dependent variable:                        
                        ---------------------------------------------------------
                                              pctwin                               
                          (1)                   (2)                    (3)          
    -----------------------------------------------------------------------------
    top20share          0.157**               0.244***               0.232***    
                        (0.071)               (0.077)                (0.076)    

    payroll                                   0.032***                          
                                              (0.012)                        

    log(payroll)                                                      3.662**
                                                                     (1.517)

    Constant            40.176***             30.487***               17.861*
                        (4.377)               (5.662)                (10.203)    

    -----------------------------------------------------------------------------
    Observations          180                   180                    180       
    R2                   0.027                 0.064                  0.058      
    Adjusted R2          0.022                 0.053                  0.047     
    Std. Error     6.392 (df = 178)       6.288 (df = 177)       6.307 (df = 177)
    F Statistic  4.934**(df = 1; 178) 6.019***(df = 2; 177) 5.448***(df = 2; 177)
    =============================================================================
    Note:                                             *p<0.1; **p<0.05; ***p<0.01
    
1. *Primer modelo de regresión*

De esta regresión se puede decir que si bien la proporción de dinero gastado en nomina por el quinto quintil de la muestra explica poco de la variabilidas de juegos ganados, es claro que en este primer modelo  el efecto de este gasto en el top20 es significativo con el 95% de confianza.
    
La interpretación usual de este coeficiente generado sería que con la información obtenida, un aumento unitario en el nivel de la nomina del top20 se asocia a un aumento promedio de 0.157 juegos ganados.

2. *Segundo modelo*

Siendo Payroll, el gasto total por jugadores de cada equipo de beisbol; el segundo modelo (que solo añade dicha variable al modelo de regresión versus el modelo uno) al igual que el anterior solo explica poco de la variabilidad de los juegos ganados (5.3%), pero apesar de ello sus efectos son altamante significativos a más del 99% de confianza.

A modo de interpretación se puede decir que:

* Respecto al modelo 1, el efecto del gasto del ultimo quintil aumenta de modo que ahora un aumento unitario de la nomina del top20 se asocia a un aumento promedio de 0.244 juegos ganados, manteniendo el resto de variables constantes.

* El modelo extrae que para la información obtenida, un aumento unitario en el presupuesto del equipo se asocio a un aumento de 0.032 juegos ganados, manteniendo lo demás constante.


3. *Tercer modelo*

En este tercer modelo a diferencia del segundo, en lugar de considerarse la nomina de cada equipo, se considera al logaritmo de dicha variable, así se extraen las siguientes conclusiones:

* Respecto al modelo 1, el efecto del gasto del ultimo quintil aumenta caso contrario al contrastarlo con el modelo 2; de modo que ahora un aumento unitario de la nomina del top20 se asocia a un aumento promedio de 0.232 juegos ganados, manteniendo el resto de variables constantes.

* En este caso la interpretación del logaritmo (al ser una variable nivel) de la nomina de cada equipo se interpreta como sigue; a un incremento en el uno porciento de la nomina del equipo se aumenta el número promedio de juegos ganados en 0.0366%, manteniendo el resto de variables constante