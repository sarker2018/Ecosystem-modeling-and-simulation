require(ncdf4)
require(plot3D)
require(maps)
require(fields)

setwd("C:/Users/razsa/Desktop/Dr_kai_course/Advance_env_modelling/11.03.2021_D_4")

file = nc_open("2017_2019_MONTHLY.nc")

str(file)
names(file$var$chlor_a_log10_rmsd$name)


open_function = function(fileName){
  NC = nc_open(fileName)
  #collect vatiable Names: NC$nvars
  Ncvn = character(NC$nvars)
  for(i in 1:length(NC$var)) NCvn[i] = NC$var[[i]]$name
  
  print(NCvn)
  
  varnames = c("latitude", "longitude", "time", "bathymetry", "TSM", "Depth") # 'depth' 'n_an'
  varnames= c(NCvn) # c("DEPTH") # 'depth''n_an'
  print(NC$dim$lat)
  
  varlist = vector('list', length(NC$var)) # varnames
  names(varlist) = Ncvn
  varlist$lon = NC$dim$lon
  varlist$lat = NC$dim$lat
  
  for (varno in seq(1,))
}