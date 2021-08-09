light_surface = 200

surface = 0
bottom_H = 50
dz = .5
depth = seq(from = surface, to = bottom_H, by = dz)

eps_0.5 = 0.5
eps_0.1 = .1
eps_1 = 1


# by numerical way
y =  light_surface
for (i in 2:length(depth)){
  didz = -y[i-1]*eps_0.5
  y[i] = y[i-1] + didz*dz
}
y1 = light_surface
for (i in 2:length(depth)){
  didz = -y1[i-1]*eps_1
  y1[i] = y1[i-1] + didz*dz
}

y2 = light_surface
for (i in 2:length(depth)){
  didz = -y2[i-1]*eps_0.1
  y2[i] = y2[i-1] + didz*dz
}



at_coeff_0.5 = data.frame(depth = depth, light = y)
at_coeff_1 = data.frame(depth = depth, light = y1)
at_coeff_0.1 = data.frame(depth = depth, light = y2)


par(mar = c(5.1, 4.5, 4.5, 2) + 0.5) # setting plot position
plot(at_coeff_0.5$light, at_coeff_0.5$depth, type = "l", col = "red",
     xlab = "Intensity [ mu Em^2 1/s ]",
     ylab = "Depth of Water Column [m]",
     main = "Light intensity at different depths",
     ylim = c(50,0),
     xlim = c(0,200),
     cex.lab = 1.4,
      cex.main = 2,
      cex.axis = 1.3)


lines(at_coeff_1$light, at_coeff_1$depth, lty =1,lwd = 2, col = "green")
lines(at_coeff_0.1$light, at_coeff_0.1$depth, lty =1,lwd = 2, col = "blue")
legend("bottomright",inset = .02, lty = 1,lwd = 2, col = c("red","green", "blue"),
       legend = c("coeff = 0.5", "coeff = 1", "coeff = 0.1"),
       title = "Curves for diff. coeff", cex = 1)




# plot(numeric(0),numeric(0),
#      type= "n",
#      ylim = c(0,2.5),
#      xlim = c(0,300),
#      ylab = "Photo Synthesis Rate: P [1/day]",
#      xlab = "Light Intensity: I [ muEm^2*1/s]",
#      main = "Light Intensity vs Photo Synthesis Rate",
#      cex.lab = 1.4,
#      cex.main = 2,
#      cex.axis = 1.3)
# lines(intensity_I, f1, lty =1,lwd = 2, col = "blue")
# lines(intensity_I, f2, lty =1,lwd = 2, col = "red")
# lines(intensity_I, diff, lty =1,lwd = 2, col = "green")
# 
# legend("bottomright",inset = .02, lty = 1,lwd = 2, col = c("blue","red", "green"), 
#        legend = c("Michaelis-Menten Line", "Ramp Function Line", "Difference"),
#        title = "Curves for diff. functions", cex = 1)
# 
# x -> 200
# 
