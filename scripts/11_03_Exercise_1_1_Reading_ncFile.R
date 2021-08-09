require(ncdf4)
require(plot3D)
require(maps)
require(fields)
require(OceanView)
require(R.utils)
setwd("C:/Users/razsa/Desktop/Dr_kai_course/Advance_env_modelling/11.03.2021_D_4")


# file = nc_open("2017_2019_MONTHLY.nc")
#
# str(file)
# names(file$var$chlor_a_log10_rmsd$name)


fileName = "2017_2019_MONTHLY.nc"

open_function = function(fileName){
  NC = nc_open(fileName)
  #collect vatiable Names: NC$nvars
  NCvn = character(NC$nvars)
  for(i in 1:length(NC$var)) NCvn[i] = NC$var[[i]]$name

  print(NCvn)

  varnames = c("latitude", "longitude", "time", "bathymetry", "TSM", "Depth") # 'depth' 'n_an'
  varnames= c(NCvn) # c("DEPTH") # 'depth''n_an'
  print(NC$dim$lat)

  varlist = vector('list', length(NC$var)) # varnames
  names(varlist) = NCvn
  varlist$lon = NC$dim$lon
  varlist$lat = NC$dim$lat

  for (varno in seq(1,length(varnames))){
    varlist[[varno]] = ncvar_get(NC, varnames[varno], verbose = F)
  }
  print(varnames)
  # close netcdf file
  nc_close(NC)
  return(varlist)
}

datei = open_function("esacci_depth.nc")

# data = open_function(fileName)
# data$kd_490_rmsd
# kd_dt = data$kd_490_rmsd
# str(kd_dt)
# names(kd_dt)
# typeof(kd_dt)
# dim(kd_dt)
# dim(data$chlor_a_log10_rmsd)
# 
# 
# kd_dt[1,1,7]

# 
# file = nc_open("2017_2019_MONTHLY.nc")
# 

# 
# dim(kd_490)
# print(kd_490[100,100,9])           
# plot(kd_490[,,10], time)
# length(time)
# plot(time,kd_490[1:10,1:10,])
# subset()

# file
# lat
# lon
# time
# kd_490
# 
# 
# plot(x = numeric(0), y = numeric(0),
#      type = "n",
#      xlab = "time",
#      ylab = "value")


  
file = nc_open("2017_2019_MONTHLY.nc")

lat = ncvar_get(file, "lat")
lon = ncvar_get(file, "lon")
time = ncvar_get(file, "time")
kd_490 = ncvar_get(file, "kd_490_rmsd", start = c(1,1,1), count = c(100,100,1))

time = as.Date(time, origin = "1970-01-01", tz = "UTC")

image(lon,lat, kd_490)


time = file$dim$time$vals
lat = file$dim$lat$vals
lon = file$dim$lon$vals

lat_ind = which(lat,lat[lat<= 55 & lat >= 54])
lat_ind

image.plot(lat[1],log[1],kd_490, na.rm = T)
kd_490

x = 30:12
x
x[-4]
x[c(1,9)]
x[x %in% c(23,22)]
l <- list(x = 1:5, y = c('a', 'b')) 
y = which(x %in% 30:27)
y
