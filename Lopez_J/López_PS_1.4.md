# Ejercicio 4, Tarea 1.

Para poder desarrollar el ejercicio se capturaron los datos del mismo, los cuales se presentan a continuación.

    Ex1=0
    Ex2=-4
    Ex3=1
    Ey1=-1
    Ey2=4
    Vx1=1
    Vx2=4
    Vx3=2
    Vy1=1
    Vy2=9
    Cx1x2=-1
    Cx1x3=0
    Cx1y1=0
    Cx1y2=1
    Cx2x3=2
    Cx2y1=-1
    Cx2y2=-3
    Cx3y1=0
    Cx3y2=3
    Cy1y2=-2

Donde Exi representa el valor esperado de Xi, Vxi la varianza de Xi y Cxixj la covarianza de xi y xj; de forma similar para y.

i) Para resolver el primer punto se agruparon los datos para obtener el valor esperado y varianza de los vectores X=(x1,x2,x3) y Y=(y1,y2).

    > EX=matrix(c(Ex1,Ex2,Ex3),ncol=1)
    > EX
         [,1]
    [1,]    0
    [2,]   -4
    [3,]    1
    > VX=matrix(c(Vx1,Cx1x2,Cx1x3,Cx1x2,Vx2,Cx2x3,Cx1x3,Cx2x3,Vx3),byrow=T,nrow=3)
    > VX
         [,1] [,2] [,3]
    [1,]    1   -1    0
    [2,]   -1    4    2
    [3,]    0    2    2
    > EY=matrix(c(Ey1,Ey2),ncol=1)
    > EY
         [,1]
    [1,]   -1
    [2,]    4
    > VY=matrix(c(Vy1,Cy1y2,Cy1y2,Vy2),byrow=T,nrow=2)
    > VY
         [,1] [,2]
    [1,]    1   -2
    [2,]   -2    9
    > CXY=matrix(c(Cx1y1,Cx1y2,Cx2y1,Cx2y2,Cx3y1,Cx3y2),byrow=T,nrow=3)
    > CXY
         [,1] [,2]
    [1,]    0    1
    [2,]   -1   -3
    [3,]    0    3
    > CYX=t(CXY)
    > CYX
         [,1] [,2] [,3]
    [1,]    0   -1    0
    [2,]    1   -3    3

ii) Para resolver este punto se identifico al vector como una combinación aX, de forma siguiente:

    > a=matrix(c(-1, 3/2,-4),ncol=1)
    > 
    > EaX=t(a)%*%EX
    > EaX
         [,1]
    [1,]  -10
    > VaX= t(a)%*%VX%*%a
    > VaX
         [,1]
    [1,]   21

iii) Para este punto, se definieron en R la matriz A y el vector b del ejercicio, para posteriormente por proposiciones de clase obtener el valor esperado de AX+b y su varianza.

    > A=matrix(c(-2,0,1,1,4,-2),ncol=3,byrow=T)
    > b=matrix(c(1,1),ncol=1)
    > EAxb=A%*%EX+b
    > EAxb
         [,1]
    [1,]    2
    [2,]  -17
    > VAxb=A%*%VX%*%t(A)
    > VAxb
         [,1] [,2]
    [1,]    6   10
    [2,]   10   33

iv) Para este punto, se definió al vector U=HX+h y al vector V=Ex+f, obteniendo los siguientes resultados:

    > H=matrix(c(1,0,-3,0,1,0,0,2,3),ncol=3,byrow=T)
    > h=matrix(c(2,0,5),ncol=1)
    > E=matrix(c(1,-1,1,-1,4,-3),ncol=3,byrow=T)
    > f=matrix(c(1,0),ncol=1)
    > 
    > EU=H%*%EX+h
    > EU
         [,1]
    [1,]   -1
    [2,]   -4
    [3,]    0
    > EV=E%*%EX+f
    > EV
         [,1]
    [1,]    6
    [2,]  -19
    > VU=H%*%VX%*%t(H)
    > VU
         [,1] [,2] [,3]
    [1,]   19   -7  -32
    [2,]   -7    4   14
    [3,]  -32   14   58
    > VV=E%*%VX%*%t(E)
    > VV
         [,1] [,2]
    [1,]    5  -14
    [2,]  -14   43
    > CUV=H%*%VX%*%t(E)
    > CUV
         [,1] [,2]
    [1,]    2  -11
    [2,]   -3   11
    [3,]   -6   28
    > CVU=t(CUV)
    > CVU
         [,1] [,2] [,3]
    [1,]    2   -3   -6
    [2,]  -11   11   28

v) para este inciso, se procedio a generarel vector c y la constante d en R, y aplicando la teroria de clase se obtuvo la covarianza.

    > C=c(-2,1,5)
    > d=8
    > 
    > #Cov(AX+b,CX+d) se calcula como sigue:
    > A%*%VX%*%C
         [,1]
    [1,]   18
    [2,]   37

vi) Para este punto, apoyandose de las matrices generadas en incisos anteriores y con proposiciones de clase se calculó la COV(AX+b,DY+e) como sigue.

    > D=matrix(c(1,0,2,-2,4,3),ncol=2,byrow=T)
    > e=matrix(c(1,0,-1),ncol=1)
    > 
    > A%*%CXY%*%t(D)
         [,1] [,2] [,3]
    [1,]    0   -2    3
    [2,]   -4   26  -67

vii) Para este punto se definió la matriz presentada como una combinación lineal de las matrices G y g de modo que se calculó la var(GX+g).

    > G=matrix(c(-1,0,-4,1,2,0),ncol=3,byrow=T)
    > g=matrix(c(0,-1),ncol=1)
    > 
    > G%*%VX%*%t(G)
         [,1] [,2]
    [1,]   33  -15
    [2,]  -15   13

viii) Generando a W y V como: W=GX+g y Z=LY y calculando COV(W,Z), se obtuvo lo siguiente:

    > L=matrix(c(1,2,0,1,1,-1),ncol=2,byrow=T)
    > 
    > CWZ=G%*%CXY%*%t(L)
    > CWZ
         [,1] [,2] [,3]
    [1,]  -26  -13   13
    [2,]  -12   -5    3
    > CZW=t(CWZ)
    > CZW
         [,1] [,2]
    [1,]  -26  -12
    [2,]  -13   -5
    [3,]   13    3

