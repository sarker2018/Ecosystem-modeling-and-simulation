nc_reader = function(path){ # function to read netCDF4 files
  NC = nc_open(path)
  v = vector() # primary vector to save the variables and dimensions names
  # save dimension $ variable names in the same v vector, one after another
  for(i in 1:NC$ndims) v = c(v, NC$dim[[i]]$name)
  for(i in 1:NC$nvars) v = c(v, NC$var[[i]]$name)
  varlist = vector(mode = "list", length = length(v)) # create empty list same length as number of variables + dimenstions
  for (i in seq_along(1:length(v))){ # populate the list with values in varlist
    vname = v[i]
    varlist[[i]] = ncvar_get(NC, vname, verbose = F)}
  names(varlist) <- v # Rename the list items according to their individual names
  nc_close(NC)
  return(varlist)}
# 
# 
# setwd("C:/Users/razsa/Desktop/Dr_kai_course/Advance_env_modelling/15.03.21_D_6")
# require(ncdf4)
# require(plot3D)
# 
# path = "esacci_depth.nc"
# varlist = nc_reader(path)
# 
# par(mar = c(4,4,4,4)+.4)
# image2D(x = varlist[[3]], y = varlist[[2]], z = varlist[[5]][,,28],
#         xlim = range(varlist[[3]]),
#         ylim = range(varlist[[2]]),
#         zlim = c(0.1,3),
#         frame.plot = T,
#         #log = "z",
#         pch = ".",
#         cex = 4,
#         main = "Attenuation at North Sea [ 1/m ]",
#         cex.lab = 1.4,
#         cex.main = 1.7,
#         cex.axis = 1,
#         font.axis = 1,
#         font.lab=2,
#         font.main = 2,
#         clab = "chl-a",
#         xlab = "lonitude [degree east]",
#         ylab = "latutude [degre N ]",
#         axes = TRUE)
# 
# # superimpose the map
# library(maptools)
# data(wrld_simpl)
# plot(wrld_simpl,add=TRUE)
# 
# dim(varlist[[4]])
# dim(varlist[[1]])
# dim(varlist[[2]])
# dim(varlist[[3]])
# varlist[[2]]
# 
# names(varlist[4])
# length(varlist[4])
# 
# 
# 
# lons = wrld_simpl$LON[wrld_simpl$LON>0 & wrld_simpl$LON<10]
# lats = wrld_simpl$LAT[wrld_simpl$LAT>0 & wrld_simpl$LAT<10]
# wor = subset(wrld_simpl, )
# 
# newdata <- subset(wrld_simpl, wrld_simpl$LON[wrld_simpl$LON>0 & wrld_simpl$LON<10] & wrld_simpl$LAT[wrld_simpl$LAT>0 & wrld_simpl$LAT<10])
# 
# require(rlist)
# list.filter(wrld_simpl, wrld_simpl$LON[wrld_simpl$LON>0 & wrld_simpl$LON<10] & wrld_simpl$LAT[wrld_simpl$LAT>0 & wrld_simpl$LAT<10])
# 
# chl = ncvar_get(NC, "chlor_a", start = , count = )
# 
# varlist[[5]][120,100,28]
# 
# p = function(x = 1:100, y = 1:100, main = "plot title",xlab = "x lab"){
#   return(plot(list(x = 1:100, y = 1:100, main = "plot title", xlab = "x lab")))
# }
# 
# do.call(p, list(main = "New title", xlab = " new xlablab"))
# 
# do.call(f, argv)
# 
# 
# 
# f <- function(a = 10, b = 2) a + b
# 
# do.call(f,list(a=10, b=20, xlab = "This is xlab"))
