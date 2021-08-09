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


df = matrix(nrow = 4, ncol = length(t))
















 
# for(i in 1:length(t)){
#   val = expo(y_0,a[1],t[i])
#   y_1 <- c(y_1,val)
# }
# print(y_1)
# 
# # a = 1, when t>700, becomes infinity
# 
# 
# for(i in 1:length(t)){
#   val = expo(y_0,a[2],t[i])
#   y_2 <- c(y_2,val)
# }
# print(y_2)
# 
# # a = 3
# 
# 
# for(i in 1:length(t)){
#   val = expo(y_0,a[3],t[i])
#   y_3 <- c(y_3,val)
# }
# print(y_3)
# 

# 
# 
# 
# 
# 
# 
# 
# ##########################
# # 
# # library(lattice)
# # 
# # xyplot(y_1 + y_2 + y_3 ~ t, ylab = "y_1, y_2,y_3", type = "l", auto.key = list(points = T,lines = TRUE))
# # 
# # xyplot(y_1  ~ t, ylab = "y_1", type = "l", auto.key = list(points = T,lines = TRUE))
# # xyplot(y_2  ~ t, ylab = "y_2", type = "l", auto.key = list(points = T,lines = TRUE))
# # xyplot(y_3  ~ t, ylab = "y_3", type = "l", auto.key = list(points = T,lines = TRUE))
# # 
# # 
# # x1  <- seq(-2, 2, 0.05)
# # x2  <- seq(-3, 3, 0.05)
# # y1 <- pnorm(x1)
# # y2 <- pnorm(x2,1,1)
# # 
# # plot(t,y_1, type="b", pch=19, ylim=range(c(0,length(y_2))),xlim=range(c(0,length(t))), type="l",col="red")
# # lines(t,y_2,col="green")
# # lines(t,y_3,col="blue")
# # 
# # plot(t, y_1, type="b", pch=19, col="red", xlab="Time", ylab="number of birds")
# # plot(t, y_2, type="b", pch=19, col="green", xlab="Time", ylab="number of birds")
# # plot(t, y_3, type="b", pch=19, col="blue", xlab="Time", ylab="number of birds")
# # 
# # # Add a line
# # lines(t, y_2, pch=18, col="blue", type="b", lty=2)
# # lines(t, y_3, pch=18, col="green", type="b", lty=2)
# # # Add a legend
# # 
# # 
# # 
# # 
# 
# 
# 
# # 
# # 
# # 
# # x<-1:10; y1=x*x; y2=2*y1
# # plot(x, y1, type="b", pch=19, col="red", xlab="x", ylab="y")
# # # Add a line
# # lines(x, y2, pch=18, col="blue", type="b", lty=2)
# # # Add a legend
# # legend(1, 95, legend=c("Line 1", "Line 2"),
# #        col=c("red", "blue"), lty=1:2, cex=0.8)


# plot(t,y_1, pch=19, ylim=c(0,100),xlim=c(0,100), type="b",col="red", xlab="Time(day)", ylab="number of birds")
# lines(t,y_2,col="green")
# lines(t,y_3,col="blue")
# legend(70,75, legend=c("y_1 for a = -1", "y_2 for a = 2", "y_3 for a = 3"),col=c("red", "blue", "green"), lty=1:3, cex=0.8,  title="Line types", text.font=4, bg='lightgreen')

