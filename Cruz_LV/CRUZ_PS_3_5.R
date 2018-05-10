library(MASS)
n = 100
MEAN = c(0,-1,-2,0,2)
VAR = matrix(c(1,-1/4,0,0,0,-1/4,1/2,0,0,0,0,0,1,1/3,-1/2,0,0,1/3,1/4,0,0,0,-1/2,0,1),5,5)
VAR
sample = mvrnorm(n,MEAN,VAR)
sample 

