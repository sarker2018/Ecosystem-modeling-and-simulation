

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
    lines(t, var,  col = color[i], type = "b", lty = 3)
    legend("topleft", legend= legendName,
           col= color, lty = 2:5, cex=1.2)
  }

for( i in 1:length(a)){
  print(paste("index: ",i,a[i], sep = "  "))
}
