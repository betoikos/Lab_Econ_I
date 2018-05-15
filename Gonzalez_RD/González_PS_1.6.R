#Rogelio Daniel González González
#Colegio de México
#Econometría I
#Prof. Eneas Caldiño
#Trabajo Final

#Ejercicio 1.6

#Declaramos la información que tenemos

Ez=matrix(c(1,0,2),3,1)
varz=matrix(c(0.8,   0.4,-0.2,
              0.4,   1.0,-0.8,
             -0.2,  -0.8, 2),3,3)
#i
  #Var(Y)=Varz[1,1]

VarY=varz[1,1]

  #Var(X)=Varz[-1,-1]

Varx=varz[-1,-1]

  #Cov(y,x)=varz[1,-1]

Covyx=varz[1,-1]

  #Cov(x,y)=(Cov(y,x)´)

Covxy=t(Covyx)

#ii

  EY2=VarY-Ez[1]
  Exxt=Varx+Ez[-1]%*%t(Ez[-1])
  Extx=varz[2,2]+varz[3,3]+Ez[2]+Ez[3]
  EYXt=Covyx+Ez[1]*t(Ez[-1])
  EXY= matrix(c(Covyx[1]+1,Covyx[2]+3),2,1)

