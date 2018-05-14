# R project
# Set 1
# Exercise 4
# Firstly, we define the expected values of the random varaibles
    Ex1=0
    Ex2=-4
    Ex3=1
    Ey1=-1
    Ey2=4
# Secondly, the variance and covariance of random variables
    Varx1=1
    Varx2=4
    Varx3=2
    Vary1=1
    Vary2=9

    Covx1x2=-1
    Covx1x3=0
    Covx1y1=0
    Covx1y2=1
    Covx2x3=2
    Covx2y1=-1
    Covx2y2=-3
    Covx3y1=0
    Covx3y2=3
    Covy1y2=-2

# i)

# expected values matrix of X
    EX<-matrix(c(Ex1,Ex2,Ex3),3)
    EX

# Variance and convariance matrix of X
    VarX<-matrix(c(Varx1,Covx1x2,Covx1x3,Covx1x2,
                   Varx2,Covx2x3,Covx1x3,Covx2x3,
                   Varx3),nrow=3)
    VarX

# Expected values matrix of Y

    EY=matrix(c(Ey1,Ey2),2)
    EY

# Variance and convariance matrix of Y

    VarY=matrix(c(Vary1,Covy1y2,Covy1y2,
                  Vary2),nrow=2)
    VarY

# Convariance matrix of X and Y

    CovXY<-matrix(c(Covx1y1,Covx1y2,Covx2y1,
                   Covx2y2,Covx3y1,Covx3y2),nrow=3)
    CovYX=t(CovXY)
    CovYX

# ii)

# Vector of constants
    a1<-matrix(c(-1, 3/2,-4),nrow=3)
    a1
# E(aX)
    EaX=a1*EX
    EaX

    VaraX<- t(a1)%*%VarX%*%a1
    VaraX

# iii)
    A<-matrix(c(-2,0,1,1,4,-2),
             nrow=2)
    A

    b<-matrix(c(1,1),nrow=2)
    b


# definimos H=AX+b

    EH<-(A%*%EX)+b
    EZ<-EH
    VarZ=A%*%VarX%*%t(A)
    VarZ

# iv)
    U_1<-matrix(c(1,0,-3,0,1,0,0,2,3),
    nrow=3)
    U_1

    u_1<-matrix(c(2,0,5),nrow=3)
    u_1

    V_1<-matrix(c(1,-1,1,-1,4,-1),nrow=2)
    V_1

    v_1<-matrix(c(1,0),nrow=2)
    v_1

# E(U)
    EU_1=(U_1%*%EX)+u_1
    EU_1

# E(V)

    EV_1=(V_1%*%EX)+v_1
    v_1

# Var(U)

    VarU_1=U_1%*%VarX%*%t(U_1)
    VarU_1

# Var(V)

    VarV_1=V_1%*%VarX%*%t(V_1)
    VarV_1

# Cov(U,V)

    CovU_V=U_1%*%VarX%*%t(V_1)
    CovU_V

# Cov(V,U)

    CovV_U=t(CovU_V)
    CovV_U

 # V

    C<-matrix(c(-2,1,5),nrow=3)
    C

    d=8
    d

# Definimos Cov(AX+b,Cx+d)=CovW
    CovW<-A%*%VarX%*%C
    CovW

# vi)
    D<-matrix(c(1,0,2,-2,4,3),nrow=3)
    D
    e<-matrix(c(1,0,-1),nrow=3)
    e

# definimos Cov(AX+b,Dy+e)=CovT
    CovT<-A%*%CovXY%*%t(D)
    CovT

# vii)
    b1<-matrix(c(-1,0,-4,1,2,-1),
              nrow=2)
    b1

    Varb1X<-b1%*%VarX%*%t(b1)
    Varb1X

# viii)
    W_2<-matrix(c(-1,0,-4,1,2,-1),
              nrow=2)
    W_2
    Z_2<-matrix(c(1,1,0,1,1,-1),
              nrow=3)
    Z_2
    CovW_2Z_2<-W_2%*%CovXY%*%t(Z_2)
    CovW_2Z_2
    CovZ_2W_2<-t(CovW_2Z_2)
    CovZ_2W_2

