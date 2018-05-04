czeros=function(v){
  nz=0
  for(i in 1:length(v)){
    if(v[i]==0){
      nz=nz+1
    }
  }
  return(nz)
}

sen=function(n){
  sum=0
  i=1
  while(i<=n){
    sum=sum+(((-1)^(i))*(n^(2i+1)))/(factorial(2i+1))
    i=i+1
  }
  return(sum)
}
fact=function(i){
  if(i==0){
    value=1
  }
  else{
    value=i*fact(i-1)
  }
  return(value)
}

ssqr=function(n){
  if(n==1){
    sum=1
  }
  else{
    sum=n^2+(ssqr(n-1))
  }
  return(sum)
}

fun1=function(xmin,xmax,n){
  x=c(0)
  f=c(0)
  for(i in 0:n){
    x[i+1]=xmin+i*(xmax-xmin)/n
    f[i+1]=sin(x[i+1])
  }
  plot(x,f,type="l",col="green",xlab="x",ylab="y")    
}

expfr=function(xmin, xmax, n,eps){
  x=c(0)
  f=c(0)
  for(i in 0:n){
    x[i+1]=xmin+i*(xmax-xmin)/n
    if(abs(x[i+1])>eps){
      f[i+1]=(exp(2*x[i+1])-1)/(exp(x[i+1])-1)
    }
    else{
      f[i+1]=2
    }
  }
  plot(x,f,type="l",col="pink",xlab="x",ylab="y")
}

poly=function(v,x){
  n=length(v)-1
  polyv=v[1]
  for(i in 1:n){
    polyv=polyv+v[i+1]*x^i
  }
  return(polyv)
}

v=c(1,2,5)
z=c(2,8,4)
m=v/z

gauss=function(Ab){
  n=nrow(Ab)
  for(k in 1:(n-1)){
    for(i in (k+1):n){
      mik=Ab[i,k]/Ab[k,k]
      Ab[i,k]=0
      for(j in (k+1):(n+1)){
        Ab[i,j]=Ab[i,j]-mik*Ab[k,j]
      }
    }
  }
  return(Ab)
}

usol(B,b)