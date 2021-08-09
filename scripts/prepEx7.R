#source('read_nc_var.R') #varlist <- read_nc_var(file_depth)

require(ncdf4)
require(plot3D)

## --- specify filename 
file1_depth <- 'esacci_depth.nc'
## --- 

## --- opening netcdf file (and assigning its meta-information to a )
NC1        <- nc_open(file1_depth) # NC1 <- nc_open('esacci_depth.nc')

#print(NC1)
## --- looking at some information 
print( typeof(NC1) )
print( class(NC1) ) #print( attr(NC1,"class") ) # works as well
print( NC1$filename )
print( NC1$nvars )
print( NC1$ndims )

print( NC1$dim[[1]]$name )
print( NC1$dim[[2]]$name )
print( NC1$dim[[3]]$name )

lat     <- NC1$dim$lat$vals # reading latitudes
#plot(lat,pch=2,cex=0.2)
len_lat <- length(lat)
print( paste0('Length (number of elements) of Latitude vector: ',
              len_lat) )

lon     <- NC1$dim$lon$vals # reading longitudes
#plot(lon,pch=2,cex=0.2)
len_lon <- length(lon)
print( paste0('Length (number of elements) of Longitude vector: ',
              len_lon) )
# 
# ## --- what are the names of the variables?  
# print( NC1$var[[1]]$name )
# print( NC1$var[[2]]$name )
# #print( NC1$var[[3]]$name )
# 
# a systematic approach, since we know the number of variables (nvars!!)
NC1_varnames <- character(NC1$nvars) # initialise (empty at first)
# loop that gets the names of the variables
for (i in 1:NC1$nvars) NC1_varnames[i] <- NC1$var[[i]]$name
print( NC1_varnames )
# 
# ## --- eventually, we read the array of "DEPTH"
depth       <- ncvar_get(NC1,'DEPTH',verbose=F)
#depth       <- ncvar_get(NC1,NC1_varnames[2],verbose=F)
# ## --- closing the netcdf file
nc_close(NC1)
# 
# ## --- for convenience, we construct a list "NS" North Sea
NS        <- list(depth=depth, lon=lon, lat=lat)
# 
# ## --- now, making a figure (based on image2D of package 'plot3D')
#pdf(file='tst_bathymetry_GB.pdf')
png(file='tst_bathymetry_GB.png')
image2D(x=lon, y=lat, z=depth,
        xlim = range(lon),
        ylim = range(lat),
        zlim = c(0,90),
        frame.plot=TRUE,
        pch = ".",
        cex = 4,
        main = "North Sea Bathymetry",
        clab = 'Depth / m',
        #xlab = expression(paste('Longitude / [  '^'o',' ]')),
        xlab = 'Longitude / [ Degree East ]',
        #xlab = expression(paste('Latitude / [  '^'o',' ]')),
        ylab = 'Latitude / [ Degree North ]',
        axes=TRUE)
dev.off()
# 
# ## --- opening "pdf device", so that the image can be stored therein
# pdf(file = 'North_Sea_Bathymetry.pdf')
# image2D(x=lon, y=lat, z=depth,
#         xlim = range(lon), 
#         ylim = range(lat), 
#         zlim = c(0,90),
#         frame.plot=TRUE,
#         pch = ".",
#         cex = 4,
#         main = "North Sea Bathymetry",
#         clab = 'Depth / m',
#         #xlab = expression(paste('Longitude / [  '^'o',' ]')),
#         xlab = 'Longitude / [ Degree East ]',
#         #xlab = expression(paste('Latitude / [  '^'o',' ]')),
#         ylab = 'Latitude / [ Degree North ]',
#         axes=TRUE)
# dev.off() # do not forget to close this "pdf device"
# 
# # 
# varlist$dates <- as.POSIXct(varlist$time*86400,
#                             origin="1970-01-01 12:00:00")
# 
# 
# min_lat_GB <- 52.2; max_lat_GB <- 56.8
# min_lon_GB <- 4.2;  max_lon_GB <- 9.0
# 
# ilat <- which(lat>min_lat_GB&lat<max_lat_GB) # min_lat_GB < lat < max_lat_GB
# ilon <- which(lon>min_lon_GB&lon<max_lon_GB) # min_lon_GB < lon < max_lon_GB
# 
