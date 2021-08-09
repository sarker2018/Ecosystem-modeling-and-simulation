while (!is.null(dev.list()))  dev.off() # shut down device

set.seed(42); time = rnorm(mean = 20, sd = 4, 300)
rate = c(3,1,5); coeffs = c(6,5,4); dataset = matrix(ncol = 3, nrow = 300)

step_function = function(time, rate, coeffs){
  val = rate*(time/(time+coeffs))
  return(val)
}

for (i in seq_along(rate)){
  dataset[,i] = step_function(time, rate[i], coeffs)
}
color = 1:3
plot(numeric(0), numeric(0),
     main = "time vs value",
     xlim = c(0, length(time)),
     ylim = c(0,length(time)),
     xlab = "Time", ylab = "Value",
     type = "n", cex = 2)
for(i in 1:length(rate)){
  lines(time, dataset[,i], lty = 2, lwd = 3, col = color[i])
  legend("center", legend = c("rate_1", ""))
}