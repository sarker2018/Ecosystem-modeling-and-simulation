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


setwd("C:/Users/razsa/Desktop/Dr_kai_course/Advance_env_modelling/15.03.21_D_6")
require(ncdf4)
require(plot3D)

path = "Razeeb_2017_2020_MONTHLY.nc"
varlist = nc_reader(path)
depth = n

par(mar = c(4,4,4,4)+.4)
image2D(x = varlist[[3]], y = varlist[[2]], z = varlist[[5]][,,28],
        xlim = range(varlist[[3]]),
        ylim = range(varlist[[2]]),
        zlim = c(0.1,3),
        frame.plot = T,
        #log = "z",
        pch = ".",
        cex = 4,
        main = "Attenuation at North Sea [ 1/m ]",
        cex.lab = 1.4,
        cex.main = 1.7,
        cex.axis = 1,
        font.axis = 1,
        font.lab=2,
        font.main = 2,
        clab = "chl-a",
        xlab = "lonitude [degree east]",
        ylab = "latutude [degre N ]",
        axes = TRUE)



## Creating the subset for the German Bight, GB

NS = varlist
min_lat = 52.2; max_lat = 56.8
min_lon = 4.2; max_lon = 9.0
ilat = which(NS$lat > min_lat & NS$lat<max_lat)
ilon = which(NS$lon > min_lon & NS$lon<max_lon)

NC1 = nc_open("esacci_depth.nc")
depth = ncvar_get(NC1, "DEPTH", verbose = F)
depth[depth<0 ]= NA

GB = list(kd_490 = NS$kd_490[ilon, ilat, ],
          chl = NS$chlor_a[ilon, ilat, ],
          lon = NS$lon[ilon],
          lat = NS$lat[ilat],
          time = as.Date(NS$time, origin = '1970-01-01', tz = "UTC"),
          s_depth = depth[ilon,ilat],
          L_penetration_d = 1/NS$kd_490[ilon, ilat, ])

## 
select_date = "2017-03-01"
idate1 = which(GB$time == select_date)

tmp_pene_depth = GB$L_penetration_d[,,idate1]
NA_L_penetration_d = tmp_pene_depth[!is.na(tmp_pene_depth)]
NA_re_s_depth = GB$s_depth[!is.na(tmp_pene_depth)]

length(NA_L_penetration_d)
length(NA_re_s_depth)

fit = lm(NA_L_penetration_d ~ NA_re_s_depth)
fit

slope = vector()
dates = vector()

# NA_L_penetration_d = tmp_pene_depth[!is.na(tmp_pene_depth)]
# 
# 
# intercept
# coeffs

for (i in 1:length(GB$time)){
  tmp_pene_depth = GB$L_penetration_d[,,i]
  
  NA_L_penetration_d = tmp_pene_depth[!is.na(tmp_pene_depth)]
  NA_re_s_depth = GB$s_depth[!is.na(tmp_pene_depth)]
  
  # length(NA_L_penetration_d)
  # length(NA_re_s_depth)
  # 
  if (length(NA_L_penetration_d > 0)){
    fit = lm(NA_L_penetration_d ~ 0+NA_re_s_depth)
    slope[i] = fit$coefficients[1]
    dates[i] = GB$time[i]
    plot(NA_re_s_depth, NA_L_penetration_d, pch = ".",
         main = paste("Batymetry vs Calculated Depth, \nDate: ",GB$time[i],sep = '' ),
         cex.lab = 1.7,
         cex.main = 2,
         cex.axis = 1,
         font.axis = 1,
         font.lab=2,
         font.main = 2,
         xlim = c(0,max(NA_re_s_depth, na.rm = T)), ylim = c(0,max(GB$L_penetration_d[,,i], na.rm = T)))
    abline(fit,col = "red")
    
  }

}

date_in_format = as.Date(dates, origin = "1970-01-01", tz = "UTC")

coeffs_data = list( slope = slope, dates = date_in_format )


## save as csv
write.csv(x=coeffs_data, file= "slope.csv")
slope = read.csv("slope.csv")

##
install.packages("xlsx")
require(xlsx)
write.xlsx(coeffs_data, file = "slopes.xlsx")

plot(GB$s_depth, GB$L_penetration_d[,,idate1], pch = ".", 
     xlim = c(0,max(GB$s_depth, na.rm = T)), ylim = c(0,max(GB$L_penetration_d[,,1], na.rm = T)))
abline(fit,col = "red")

fit = lm(NA_L_penetration_d ~ NA_re_s_depth)
fit$coefficients[1]
fit$coefficients[2]

#1:length(GB$s_depth
image2D(x = GB$lon, y = GB$lat, z = GB$s_depth[,], zlim = c(0,100),
        xlim = range(GB$lon), ylim = range(GB$lat), main = "")
image2D(x = GB$lon, y = GB$lat, z = GB$L_penetration_d[,,20], zlim = c(0,40))
max(GB$L_penetration_d[,,1], na.rm = T)
