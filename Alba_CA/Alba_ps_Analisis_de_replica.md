# Análisis de la regresión realizada en el laboratorio

#### A continuación se presentan los resultados de la regresión de tres modelos distintos:

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
    
Como se puede observar, el primer modelo de regresión, en el que se regresa el porcentaje de juegos ganados (pctwin) en función del gasto realizado en la nomina del último quintil respecto al gasto total de toda la liga (top20share), arroja un coeficiente, estadísticamente significativo al 5%, de 0.157. Esto quiere decir que un aumento porcentual de 1% en top20share incrementa el porcentaje de juegos ganados en aaproximadamente 0.157 puntos porcentuales.

Cuando se introduce la variable de gasto total en nomina de cada equipo (payroll), significativa al 1%, la variable top20share pasa a ser significativa al 1% y su tamaño incrementa a 0.244. De este segundo modelo se pueden concluir, entre otras cosas, dos aspectos: primero, un posible sesgo que se presenta en el primer modelo; y segundo, la interpretación de la variable payroll, es decir, que un incremento de una unidad en el gasto total en nomina de cada equipo incrementa en aproximadamente 0.032 puntos porcentuales el porcentaje de juegos ganados.

Finalmente, el tercer modelo involucra la variable log(payroll) en lugar de payroll. Su coeficiente es significativo al 5% y el de top20share lo sigue siendo al 1%. La interpretación de log(payroll) es la siguiente: un incremento porcentual de 1% en e gasto total en nomina de cada equipo incrementa en aproximadamente 0.03662% el porcentaje de juegos ganados.

