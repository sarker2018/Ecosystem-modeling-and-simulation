# Ecosystem-modeling-and-simulation

* All the task descriptions can be found in the task.pdf file
* Scripts are uploaded in the scripts folder. Scripts are separated for each task specified in the task.pdf (planning to combine them in a single Rmarkdown file soon)
* Dataset is uploaded as a .nc (netcdf4 format) and also one can download specific data at free of cost from the https://www.oceancolour.org/thredds/ncss/grid/CCI_ALL-v3.1-DAILY/dataset.html


## Warm-up: R & R Studio

```r

# where you are ...
# ------------------

Listfiles <- list.files(".")
Listfiles
list.files("..")
setwd("\home\MyPath\MyFolder")

a <- 2
print(a)
a
b <- 3
c <- a*b
c
print(a**b)
# sequences / vectors:
# --------------------
1:5


x <- 1:5
x
length(x)
5*x
y <- c(3,8,9,100,200)
help(c)
names(y) <- c("a","b","c")
y[1:3]
y[c(1,4)]
y["c"]
x*y
sum(x*y)
t <- seq(0,0.2,length=21)
help(seq)


# data frames, here with columns time
# and Var1 and another with columns
# time and Var2:
time <- 0:20; Var1 <- 0.1*exp(0.3*time);
Var2 <- 0.1*exp(0.3*time-0.02*time*time);
AllData <- data.frame(time = time,
                      Infect_1 = Var1, Infect_2 = Var2)
# elementary statistics functions:
# --------------------------------
A <- matrix(c(1:8,10),nrow=3,ncol=3)
a <- data.frame(A)
mean(A)
mean(a)
sd(a)
summary(a)
cor(a)
cor(AllData)

square <- function(x)
{
  return(x*x)
}
a <- 1:10
square(a)
help("function")
topower <- function(x,y=2)
{
  z <- x^y
  return(z)
}
topower(2,3)
topower(y=3,x=2)
# plotting
# --------
A <- matrix(nrow=20,ncol=3)
A[,1] <- 1:20
A[,2] <- A[,1] + rnorm(20,sd=1)
A[,3] <- 21 - A[,1] + rnorm(20,sd=5)
a <- data.frame(A)
names(a) <- c("x","y","z")
pairs(a)
pairs(AllData)
help(plot)
help(par)
plot(AllData$time,AllData$Infect_1)
plot(AllData$time,AllData$Infect_2)
plot(a$x,a$y)
plot(a$x,a$z,xlab="x",ylab="z",
     main="z(x)",xlim=c(0,20),
     ylim=c(0,1.1*max(a$z)))

par(mfrow=c(1,2),xaxs="i",yaxs="i",
    mar=c(4.5,4.5,2,1.5)+0.1)
for ( i in 2:3 )
{
  plot(numeric(0),numeric(0),xlim=
         c(0,max(a$x)),ylim=c(0,1.1*max(a[,i])),
       type="n",main=paste(names(a)[i],"(x)",
                           sep=""),xlab=names(a)[1],
       ylab=names(a)[i])
  # lines(a$x,a[,i])
  # points(a$x,a[,i])
}
help(legend)
x <- 1:20
y <- square(x)

# new plot figure
windows()
plot(x,y,xlab="#users",ylab="#messages",
     log="y")
# write to file
png("message.png", width=520, height=420)
plot(x,y,xlab="#users",ylab="#messages")
dev.off()
# writing and reading data:
# --------------
write(A,"test_data.dat", ncolumns=3)
newA <- read.table("test_data.dat",
                   header = TRUE)
newA



# Exercise 2

p = c(20:30)
q = c(25:35)
r = c(15:25)
plot(q,p)

x  <- seq(-2, 2, 0.05)
y1 <- pnorm(x)
y2 <- pnorm(x, 1, 1)

plot(x,y1,type="l",col="red")
lines(x,y2,col="green")


plot( x, y1, type="l", col="red" )
par(new=TRUE)
plot( x, y2, type="l", col="green" )
# 
# plot(first thing to plot)
# plot(second thing to plot,add=TRUE)


x1  <- seq(-2, 2, 0.05)
x2  <- seq(-3, 3, 0.05)
y1 <- pnorm(x1)
y2 <- pnorm(x2,1,1)

plot(x1,y1,ylim=range(c(y1,y2)),xlim=range(c(x1,x2)), type="l",col="red")
lines(x2,y2,col="green")


par(mfrow=c(1,2))

plot(p,q)

plot(p,r) 
     

library(lattice)
x <- seq(-2,2,0.05)
y1 <- pnorm(x)
y2 <- pnorm(x,1,1)
xyplot(y1 + y2 ~ x, ylab = "y1 and y2", type = "l", auto.key = list(points = F,lines = TRUE))

```
![grafik](https://user-images.githubusercontent.com/61450446/130712315-e3a2385b-087d-4c7f-a4a7-44bf55bd322f.png)

![grafik](https://user-images.githubusercontent.com/61450446/130712341-f2276eda-9a37-42c7-967b-21d6099c4d2f.png)
![grafik](https://user-images.githubusercontent.com/61450446/130712398-e0641297-4694-452d-89e6-e3f049d0be41.png)

![grafik](https://user-images.githubusercontent.com/61450446/130712413-91b0941a-1a56-4ed9-946c-f564a49b7878.png)
![grafik](https://user-images.githubusercontent.com/61450446/130712422-cc8f3791-ff09-4675-bc15-a89c56fba4fc.png)

![grafik](https://user-images.githubusercontent.com/61450446/130712436-43236131-ac23-4f6a-a24e-52c1cf6db82d.png)
![grafik](https://user-images.githubusercontent.com/61450446/130712440-a98e38d2-9fec-4426-8a2d-f6374577557f.png)
![grafik](https://user-images.githubusercontent.com/61450446/130712453-f4cab9d5-e539-4523-a53e-6f46365a9306.png)

![grafik](https://user-images.githubusercontent.com/61450446/130712464-c4797343-10c7-430f-a4ff-3a51c96162ad.png)


## Example of xponential Function

```R


t = seq(-5,4.95,0.05)
length(t)
a = c(-0.3,0.3,0.35)
y0 = c(0.5,1.5,2)

f1 = function(a,b,c){
  val = c*exp(a*b)
  return(val)
}


dev.off()
color = c("red", "green", "blue")
legendName = vector()
par(pin=c(5,4)) # width & height of plot in inch
par(mar=c(4.5,4.5,2,1.5)+0.1)
plot(numeric(0),numeric(0),
     xlim = c(0,5.5), ylim = c(0,11),
     xlab = "Time (day)",
     ylab = "Number of Birds",
     main = "Growth vs Time with changed growth Rate",
     cex.main= 1,
     type = "n")

  for (i in seq_along(a)){
    var <- paste("at g_rate: ",a[i], sep = " ")
    legendName <- c(legendName, var) # storing 
    var <- f1(t,a[i],y0[i])
    print(length(var))
    lines(t, var,  col = color[i], type = "l", lty = 3)
    legend("topleft", legend= legendName,
           col= color, lty = 2:5, cex=1.2)
  }

for( i in 1:length(a)){
  print(paste("index: ",i,a[i], sep = "  "))
}

```

## Iterate a specific parameter different values
```r
#  exponential y(t) = y0 · e(?? t)

t = seq(-1,1,0.05)
a = c(-1, 1, 3)
y_0 = 1
expo <- function(y_0, a, t){
  return(y_0*(2.71828)^(a*t))
}
y_1 = vector()
y_2 = vector()
y_3 = vector()

for(i in a){
  y_1 <- (expo(y_0,a[1],t))
  y_2 <- (expo(y_0,a[2],t))
  y_3 <- (expo(y_0,a[3],t))
}

# everything by loop


plot(t,y_1, pch=19, ylim=c(0,max(y_1)*1.2),xlim=c(0,max(t)*1.2), type="b",col="red", xlab="Time(day)", ylab="number of birds")
lines(t,y_2,col="green")
lines(t,y_3,col="blue")
legend((0.75*max(t)),(0.75*max(y_1)), legend=c("y_1 for a = -1", "y_2 for a = 2", "y_3 for a = 3"),col=c("red", "blue", "green"), lty=1:3, cex=0.8,  title="Line types", text.font=2, bg='lightgreen')

```
