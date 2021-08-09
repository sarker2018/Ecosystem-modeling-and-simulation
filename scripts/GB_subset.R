# NS = varlist
min_lat = 52.2; max_lat = 56.8
min_lon = 4.2; max_lon = 9.0
ilat = which(NS$lat > min_lat & NS$lat<max_lat)
ilon = which(NS$lon > min_lon & NS$lon<max_lon)

NC = nc_open("esacci_depth.nc")
depth = ncvar_get(NC, "DEPTH", verbose = F)
depth[depth<0 ]= NA

GB = list(kd_490 = NS$kd_490[ilon, ilat, ],
          chl = NS$chlor_a[ilon, ilat, ],
          lon = NS$lon[ilon],
          lat = NS$lat[ilat],
          time = as.Date(NS$time, origin = '1970-01-01', tz = "UTC"),
          s_depth = depth[ilon,ilat],
          L_penetration_d = 1/NS$kd_490[ilon, ilat, ])
GB$jd = julian(GB$time, origin = min(GB$time))%%365



