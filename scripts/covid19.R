while (!is.null(dev.list()))  dev.off() # shut down device
alfa <- 0.07
beta <- c(0.03,0.07, 0.17)
startday = 1
time = startday:200
startvalue = 10
rate = beta-alfa

cngfunc = function(startvalue, rate, time){
  val = startvalue*exp(rate*time)
  #return(val)
  return(log(val,exp(1)))
}
legendName = vector()
color = 2:4
par(pin=c(5,3)) # width & height of plot in inch
par(mar=c(4.5,4.5,2,1.5)+0.1)
plot(numeric(0), numeric(0),
     xlab= "time [day]", ylab = " person infectd [in natural log scale]",
     type = "n", cel.xlab = 2,
     xlim = c(0,length(time)),cex.lab=1.5,
     ylim = c(-5,25),
     #log='y',
     main = "Total infected after 120 days (person)"
     )
for(i in seq_along(rate)){
  print(i)
  value1 <- paste("beta =  ", beta[i], sep = "")
  legendName <- c(legendName, value1) # storing the legend name in a vector
  value <- cngfunc(startvalue, rate[i], time)
  lines(time, value, pch=18, col = color[i], lty = 6,lwd = 3)
  legend("topleft",inset = .035,title = "Infection Rate", legend= legendName,
         col= color, lty = 6, cex=1.1, lwd =3)}


