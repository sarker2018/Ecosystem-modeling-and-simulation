

light_surface = 200
surface = 0
bottom_H = 15
dz = .1
depth = seq(from = surface, to = bottom_H, by = dz)
eps = 1


# by numerical way
y =  light_surface
for (i in 2:length(depth)){
  didz = -y[i-1]*eps
  y[i] = y[i-1] + didz*dz
}


df = data.frame(depth = depth, light = y)

par(mar = c(5.1, 4.5, 4.5, 2) + 0.5) # setting plot position
plot(df$light, df$depth, type = "l", col = "red",
     xlab = "Intensity [ mu Em^2 1/s ]",
     ylab = "Depth of Water Column [m]",
     main = "Light intensity upto 15 m",
     ylim = c(16,0),
     xlim = c(0,200),
     cex.lab = 2,
     cex.main = 2,
     cex.axis = 2,
)


intensity_I = df$light
Half_Satu_K = 25
Max_Synth_pm= 2


# synthesis_rate = function(Max_Synth_pm, intensity_I, Half_Satu_K){
#   val = Max_Synth_pm*(intensity_I/(intensity_I + Half_Satu_K))
#   return(val)}

rates = Max_Synth_pm*(intensity_I/(intensity_I + Half_Satu_K))
df$rate = rates



# lines(at_coeff_1$light, at_coeff_1$depth, lty =1,lwd = 2, col = "green")
# lines(at_coeff_0.1$light, at_coeff_0.1$depth, lty =1,lwd = 2, col = "blue")
# legend("bottomright",inset = .02, lty = 1,lwd = 2, col = c("red","green", "blue"),
#        legend = c("coeff = 0.5", "coeff = 1", "coeff = 0.1"),
#        title = "Curves for diff. coeff", cex = 1)



plot(numeric(0),numeric(0),
     type= "n",
     ylim = c(0,2.5),
     xlim = c(0,200),
     ylab = "Photo Synthesis Rate: P [1/day]",
     xlab = "Light Intensity: I [ muEm^2*1/s]",
     main = "Light Intensity vs Photo Synthesis Rate",
     cex.lab = 1.7,
     cex.main = 2,
     cex.axis = 1,
     font.axis = 2,
     font.axis = 2,
     font = 2)
lines(df$light, df$rate, lty =1,lwd = 2, col = "blue")


legend("bottomright",inset = .02, lty = 1,lwd = 2, col = "red",
       legend = "Rate : Michael Mentel",
       title = "photo synthesis rate", cex = 1)



