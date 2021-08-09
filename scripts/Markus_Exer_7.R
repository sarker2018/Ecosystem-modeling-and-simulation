setwd("C:/Users/razsa/Desktop/Dr_kai_course/Advance_env_modelling/12.03.2021_D_5")
require(ncdf4)
require(plot3D)
# require(maps)
# require(fields)
# require(OceanView)
# require(R.utils)

NC1 = nc_open("esacci_depth.nc")
print(typeof(NC1))
print(class(NC1))
print(NC1$filename)
print(NC1$nvars)
print(NC1$ndims)

print(NC1$dim[[1]]$name)
print(NC1$dim[[2]]$name)
print(NC1$dim[[3]]$name)

# latitude 
lat = NC1$dim$lat$vals
len_lat = length(length(lat))
print(paste('Length (Number of Elements) of Latitude vector:  ', len_lat))
lat
# longitude
lon = NC1$dim$lon$vals
plot(lon, pch = 2, cex = .2)
len_lon = length(lon)
print(len_lon)


# time

t = NC1$dim$time$vals
t = as.Date(time, origin = "1970-01-01", tz = "UTC")
t

print(NC1$var[[1]]$name)
print(NC1$var[[2]]$name)

NC1_varnames = character(NC1$nvars) # initialise the var nam,es

for (i in 1:NC1$nvars) NC1_varnames[i] = NC1$var[[1]]$name
print(NC1_varnames)  

depth = ncvar_get(NC1, "DEPTH", verbose = F)

# must close the nc file
nc_close(NC1)

# subset for North Sea NS
NS = list(depth = depth, lon = lon , lat = lat)
NS$lat[1:10]

pdf(file = "test bathimetry.PNG")

par(mar = c(4,4,4,4) + 1) # setting plot position


# jpeg(filename = "Rplot%03d.jpeg",
#      width = 480, height = 480, units = "px", pointsize = 12,
#      quality = 75,
#      bg = "white", res = NA, ..., family = "", restoreConsole = TRUE,
#      type = c("cairo", "Xlib", "quartz"), antialias)

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

""


# ploting function of the ncdf file


# p = function(x = 1:10, y = 1:10, z = 1:10,
#              xlim = range(lon),
#              ylim = range(lat),
#              zlim = c(0,90),
#              frame.plot = T,
#              pch = ".",
#              cex = 4,
#              main = "North Sea",
#              clab = "Depth / m",
#              xlab = "lon [degree east]",
#              ylab = "latutude [degre N ]",
#              axes = TRUE){
#   return(c(x = 1:10, y = 1:10, z = 1:10,
#            xlim = range(lon),
#            ylim = range(lat),
#            zlim = c(0,90),
#            frame.plot = T,
#            pch = ".",
#            cex = 4,
#            main = "North Sea",
#            clab = "Depth / m",
#            xlab = "lon [degree east]",
#            ylab = "latutude [degre N ]",
#            axes = TRUE))
# }
# 
# image2D(p(), x = lon, y = lat, z = depth, )
