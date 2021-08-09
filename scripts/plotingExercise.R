while (!is.null(dev.list()))  dev.off() # shut down device
s_half = c(10,13.5,40)
saturation = c(26,52,30)
t = seq(1,1000,1)

rate = function(sat,halfsat,time){
  return(sat*(time/(time+halfsat)))
}


legendName = vector()
color = c("red", "green", "blue")
par(pin=c(5,3)) # width & height of plot in inch
plt <- vector()
p <- plot(numeric(0), numeric(0),
     xlab= "time (minute)", ylab = "reaction rate",
     type = "n",
     xlim = c(0,10),
     ylim = c(0,10),
     main = "Michaelis-Menten kinetics: time vs Reaction rate")


for(i in 1:3){
  plotname = paste("plt_",j, sep = "")
  
  plt <- c(plt, plotname)
}
print(plt)
for(j in seq_along(s_half)){
  
  for(i in seq_along(saturation)){
    value1 <- paste("sat_", i, sep = "")
    legendName <- c(legendName, value1) # storing the legend name in a vector
    
    value <- rate(saturation[i], s_half[j], t)
    
    lines(t, value, pch = 19, col = color[i], type = "b", lty = 3)
    legend("topright", legend=legendName,
           col= color, lty = 1:3, cex=0.8)}
  
}


  
##########################################################

# # Using for loop first, then plot, creates multiple graph
# 
# par(mfrow = c(1,1))
# for(i in seq_along(saturation)){
#   plot(numeric(0), numeric(0),
#        xlab= "time (minute)", ylab = "reaction rate",
#        type = "n", 
#        xlim = c(0,10),
#        ylim = c(0,10),
#        main = "Michaelis-Menten kinetics: time vs Reaction rate")
#  
#         
#   
#       value1 <- paste("sat_", i, sep = "")
#       legendName <- c(legendName, value1) # storing the legend name in a vector
#       print(value)
#       value <- rate(saturation[i], s_half[i], t)
#       
#       lines(t, value, pch = 19, col = color[i], type = "b", lty = 3)
#       legend("topright", legend=legendName,
#              col= color, lty = 1:3, cex=0.8)
#       
#   
# }
# 
# ## Do while loop is a possible solution??
