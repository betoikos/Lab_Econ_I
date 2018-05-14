# Replica del analisis de regresión 

Durante la clase se análizo el ingreso percibido por los jugadores de Baseball de diferentes equipos, se análizo el número de juegos jugados, los salarios por equipo de baseball, con lo cual se corrio el siguiente análisis de regresión.

_________________________________________________________________________________
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
    
### Análisis 

Se contrastarón tres diferentes modelos en donde cada uno arrojo conclusiones relevantes para el análisis
##### Primer modelo

Se puede observar que el la variable Top20 con un intervalo del 95% de confianza explica una relación positiva entre el número de juegos ganados  los recursos destinados a este rubro. Se tiene que por cada punto porcentual en que incremente la nomina del Top20 se incrementarán en .157 puntos porcentuales el numero de juegos ganados.
El modelo es significativo al 95% de confianza para que se pueda explicar el comportamiento del número de juegos ganados.

##### Segundo modelo

Payroll es el gasto total por jugadores de cada equipo, se puede observar que al incrementar esta nueva variables respecto al modelo 1, la significancia global incrementa al 99% de confianza.

El incremento del 1% en la nomina del TOP20  afectará de manera directa el número de juegos ganados, en una proporción de .244 puntos porcentuales, además el incrmento en una unidad en el payroll incrementa en .032 puntos porcentuales en el número de juegos ganados con una confianza del 99% cada uno de los coeficientes.

Siendo Payroll, el gasto total por jugadores de cada equipo de beisbol; el segundo modelo (que solo añade dicha variable al modelo de regresión versus el modelo uno) al igual que el anterior solo explica poco de la variabilidad de los juegos ganados (5.3%), pero apesar de ello sus efectos son altamante significativos a más del 99% de confianza.

##### Tercer modelo

En este tercer modelo a diferencia del segundo, en lugar de considerarse la nomina de cada equipo, se considera al logaritmo de dicha variable, así se extraen las siguientes, esto ayuda el análisis en forma  de elasticidades.

Se puede observar que el modelo tiene una significancia al 99% de confianza al ver el estadístico F, además se observa la siguiente relación:
Por cada punto porcentual en que incremente el TOP20 el número de juegos ganados incrementará en .23 puntos porcentaules (este estimador es significativo al 99% de confianza), mientras que al incrementar en una unidad porcentual el payroll el número de juegos ganados incrementará en 3.62 puntos porcentuales (este estimador es significativo al 95% de confianza)

