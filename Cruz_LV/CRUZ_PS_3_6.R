library(MASS)
n = 200
MEAN = c(0,0,1,1)
VAR = matrix(c(1,0,1,0,0,9,0,1,1,0,4,0,0,1,0,9),4,4)
VAR
sample = mvrnorm(n,MEAN,VAR)
sample 
