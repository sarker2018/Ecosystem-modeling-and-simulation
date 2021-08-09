
# if (!require('ggplot2')) install.packages('ggplot2'); library('ggplot2')
# if (!require('readxl')) install.packages('readxl'); library('readxl')
# if (!require('rjson')) install.packages('rjson'); library('rjson')
# 
# 
# setwd("C:/Users/razsa/Desktop/Dr_kai_course")
# data <- fromJSON(file = "Books_small.json")
# 
# 
# for (rev in length(data)){
#   print(rev)
# }
# 
# data = data.frame(data)
# 
# multiline comment control + shift + c
# control + L clear console

getwd()
setwd("C:/Users/razsa/Desktop/Dr_kai_course/Advance_env_modelling/08_03_2021_D_1")
ls()
Listfiles <- list.files(".")
Listfiles
list.files("..")
setwd("C:\Users\razsa\Desktop\Dr_kai_course\Advance_env_modelling\08_03_2021_D_1")


# Scalar variables
a <- 2
print(a)
a
b <- 3
c <- a*b
c
print(a*b)


# sequence() and vector

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
t <- seq(0,0.2, length = 21)
t
seq(1,20,2)
help(seq)


# data frames, 

time <- 0:20; Var1 <- 0.1*exp(0.3*time)
Var1
Var2 <- 0.1*exp(0.3*time-0.02*time*time)
AllData <- data.frame(time = time, Infect_1 = Var1, Infect_2 = Var2)

#Elemntary statistical Functions
A <- matrix(c(1:8,10), nrow = 3, ncol = 3)
A 
a = data.frame(A)
a
str(a)
mean(a)
mean(A)
sd(a)

summary(a)
cor(a)
cor(AllData)
square <- function(x){
  return(x*x)
}

square(4)
a <- 1:10
square(a)
help("function")

topower <- function(x,y=2){
  z <- x^y
  return(z)
}
topower(2,3)
topower(y=3,x=2)

# Plotting
A <- matrix(nrow = 20, ncol=10)
A

A[,1] <- 1:20


A[,2] <- A[,1]+rnorm(20,sd=1)
A[,2]
A[,3] <- 21-A[,1]+rnorm(20,sd=5)
A[,3]
a <- data.frame(A)
names(a)
names(a) <- c("x", "y", "z")
pairs(a)
names(a)
pairs(AllData)
help(plot)
help(par)

plot(AllData$time, AllData$Infect_1)
plot(AllData$time, AllData$Infect_2)

plot(a$x,a$y)

plot(a$x,a$y,xlab = "x", ylab = "z",
     main="z(x)", xlim = c(0,20),
     ylim = c(0, 1.1*max(a$z)))
     
par(mfrow=c(1,2), xaxs = "i", yaxs = "i",
    mar = c(4.5,4.5,2,1.5)+.1)
for (i in 2:3){
  plot(numeric(0), numeric(0), xlim= c(0, max(a$x)), ylim = c(0,1.1*max(a[,i])),
       type = "n", main = paste(names(a)[i], "x", sep = ""), xlab = names(a)[1],
       ylab = names(a)[i])
  print(i)
}     



     