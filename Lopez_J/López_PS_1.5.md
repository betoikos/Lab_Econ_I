# Ejercicio 6, Tarea 1.

Para este ejercicio dato que Z=(y,X), donde X=(x1,x2), entonces en primera instancia se definió en R, la varianza de dicho vector aleatorio y su esperanza; datos dados en el ejercicio.

    > EZ=matrix(c(1,0,2),ncol=1)
    > EZ
         [,1]
    [1,]    1
    [2,]    0
    [3,]    2
    > VZ= matrix(c(0.8,0.4,-0.2,0.4,1,-0.8,-0.2,-0.8,2),ncol=3,byrow=T)
    > VZ
         [,1] [,2] [,3]
    [1,]  0.8  0.4 -0.2
    [2,]  0.4  1.0 -0.8
    [3,] -0.2 -0.8  2.0

i) Para encontrar la varianza de X=(x1,x2) y de Y, se separa EZ y VZ conforme a lo visto en clase:

    > VarY1.6=VZ[1,1]
    > VarY1.6
    [1] 0.8
    > VarX1.6=matrix(c(VZ[2,2],VZ[2,3],VZ[3,2],VZ[3,3]),ncol=2)
    > VarX1.6
         [,1] [,2]
    [1,]  1.0 -0.8
    [2,] -0.8  2.0
    > covYX1.6=matrix(c(VZ[1,2],VZ[1,3]),ncol=2)
    > covYX1.6
         [,1] [,2]
    [1,]  0.4 -0.2
    > covXY1.6=t(covYX1.6)
    > covXY1.6
         [,1]
    [1,]  0.4
    [2,] -0.2

ii) Para calcular, los correspondientes datos del ejercicios, se procedio conforme a las proposiciones de clase, obteniendo:

    > EYcuadrada=VarY1.6+EZ[1,1]^2
    > EYcuadrada
    [1] 1.8
    > EXtX=VarX1.6+c(0,2)%*%t(c(0,2))
    > EXtX
         [,1] [,2]
    [1,]  1.0 -0.8
    [2,] -0.8  6.0
    > EtXX=VarX1.6[1,1]+VarX1.6[2,2]+1
    > EtXX
    [1] 4
    > EytX=covYX1.6+c(0,2)
    > EytX
         [,1] [,2]
    [1,]  0.4  1.8
    > EyX=t(EytX)
    > EyX
         [,1]
    [1,]  0.4
    [2,]  1.8