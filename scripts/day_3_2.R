intensity_I = seq(from = 1, to =300, by = 0.5)
Half_Satu_K = 25
Max_Synth_pm= 2


#tst <- append(2*irrad[irrad<50],0.5*irrad[irrad>=50])

mm_light = function(Max_Synth_pm, intensity_I, Half_Satu_K){
  val = Max_Synth_pm*(intensity_I/(intensity_I + Half_Satu_K))
  return(val)
}
f1 = mm_light(Max_Synth_pm, intensity_I, Half_Satu_K)
plot(intensity_I, f1, type= "l",
     ylim = c(0,2.5),
     ylab = "Photo Synthesis Rate: P [1/day]",
     xlab = "Light Intensity: I [ muEm^2*1/s]",
     main = "Light Intensity vs Photo Synthesis Rate")


limit = 2*Half_Satu_K 

ramp_function = function(Max_Synth_pm, intensity_I, Half_Satu_K){
  val = Max_Synth_pm*(intensity_I/(2*Half_Satu_K))
  val[intensity_I>=2*Half_Satu_K] = Max_Synth_pm
  return(val)}

f2 = ramp_function(Max_Synth_pm, intensity_I, Half_Satu_K)
lines(intensity_I, f2, lty =2, col = "red")



legend("bottomright",inset = .02, lty = 1, col = c("grey","red"), legend = c("Michaelis-Menten Line", "Ramp Function Line"),
       title = "Curves", cex = 1)


# legend("bottomright",inset = .02, legend = c("MM_curve", "ramp_curve"),
#        title = "Curves", col = c("grey", "red"))



# 
# dat = matrix(nrow = length(intensity_I), ncol=2)
# dat[,1] = ramp_function(Max_Synth_pm, intensity_I, Half_Satu_K)
# 
# 
# plot(numeric(0), numeric(0),
#      main = "time vs value",
#      xlim = c(0, length(time)),
#      ylim = c(0,length(time)),
#      xlab = "Time", ylab = "Value",
#      type = "n", cex = 2)
# 
# 
# 
# if (dat[,1] >= limit){
#   lines(intensity_I, dat[,1], lty = 2, lwd = 3)
#   legend("center", legend = c("rate_1", "rate_2"))
#   
# }else{
#   dat[,1] = 1
#   lines(intensity_I,dat[,1], lty = 2, lwd = 3)
# }
# 
# dat
# 
