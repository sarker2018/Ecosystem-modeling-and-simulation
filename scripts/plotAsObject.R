

par(mar = c(4,4,4,4) + 1) # setting plot position
# plot(x = numeric(0),y = numeric(0),
#      type= "n",
#      ylim = c(0,2.5),
#      xlim = c(0,200),
#      ylab = "Photo Synthesis Rate: P [1/day]",
#      xlab = "Light Intensity: I [ muEm^2*1/s]",
#      main = "Light Intensity vs Photo Synthesis Rate",
#      cex.lab = 1.7,
#      cex.main = 2,
#      cex.axis = 1,
#      font.axis = 2,
#      font.lab=2,
#      font.main = 2)


# lines(p_dat$depth, p_dat$production, lty =1,lwd = 2, col = "blue")
# lines(eps_0.1$depth, eps_0.1$production, lty =1,lwd = 2, col = "red")# lines(intensity_I, diff, lty =1,lwd = 2, col = "green")
# 
# legend("bottomright",inset = .01, lty = 1,lwd = 2, col = c("blue","red"), legend = c("eps = 1", "eps = .5"),
#        title = "Curves for diff. epsiln", cex = .8, title.col = "black",
#        box.lwd = 3,box.col = "#f53877",text.col = "#b51d64", text.font = 2)
# 
# 
# 


# plot(hp ~ mpg, data = mtcars)
# leg <- legend("topleft", lty = 1,
#               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
#               col = c("black","red","blue"), plot = FALSE)
# 
# # adjust as desired
# leftx <- leg$rect$top
# rightx <- (leg$rect$left + leg$rect$w) * 1.2
# topy <- leg$rect$top
# bottomy <- (leg$rect$top - leg$rect$h) * 1
# 
# # use the new coordinates to define custom
# legend(x = c(leftx, rightx), y = c(topy, bottomy), lty = 1,
#        legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
#        col = c("black","red","blue"))



p = function(x = numeric(0),y = numeric(0),
             type= "n",
             ylim = numeric(0),
             xlim = numeric(0),
             ylab = "Photo Synthesis Rate: P [1/day]",
             xlab = "Light Intensity: I [ muEm^2*1/s]",
             main = "Light Intensity vs Photo Synthesis Rate",
             cex.lab = 1.7,
             cex.main = 2,
             cex.axis = 1,
             font.axis = 2,
             font.lab=2,
             font.main = 2){
        return(c(x = numeric(0),y = numeric(0),
                 type= "n",
                 ylim = numeric(0),
                 xlim = numeric(0),
                 ylab = "Photo Synthesis Rate: P [1/day]",
                 xlab = "Light Intensity: I [ muEm^2*1/s]",
                 main = "Light Intensity vs Photo Synthesis Rate",
                 cex.lab = 1.7,
                 cex.main = 2,
                 cex.axis = 1,
                 font.axis = 1,
                 font.lab=2,
                 font.main = 2))
}


plot(p(), main = "My custom Plot", ylab = "My custom Y lab", xlab = "My custom x axis", xlim = c(0,10), ylim = c(0,10))


# Plot Netcdf Images  #####

pdf(file = "test bathimetry.pdf")
image2D(x = lon, y = lat, z = depth,
        xlim = range(lon),
        ylim = range(lat),
        zlim = c(0,90),
        frame.plot = T,
        pch = ".",
        cex = 4,
        main = "North Sea",
        clab = "Depth / m",
        xlab = "lon [degree east]",
        ylab = "latutude [degre N ]",
        axes = TRUE)

dev.off() # to close the pdf


# Giving legend by for loop ####

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


