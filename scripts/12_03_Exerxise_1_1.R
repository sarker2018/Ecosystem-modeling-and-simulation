# 
# require(maps)
# require(fields)
# require(OceanView)
# require(R.utils)
#readline(prompt="Enter name: ")
setwd("C:/Users/razsa/Desktop/Dr_kai_course/Advance_env_modelling/12.03.2021_D_5")
require(ncdf4)
require(plot3D)
NC = nc_open("2017_2019_MONTHLY.nc")

depth = ncvar_get(NC1, "DEPTH", verbose = F)

print(typeof(NC))
print(class(NC))
print(NC$filename)
print(NC$nvars)
print(NC1$ndims)
print(NC$dim)


# Dim names 
varlist = c()
varlist2 = vector(mode = "list", length = 5)


for (i in 1:length(NC$dim)){
  varlist = c(varlist,NC$dim[[i]]$name)
}

v = vector(mode= "list", length = 3)
for(i in 1:3){
  v[i] = NC$dim[[i]]$name
  # value_field = as.name(paste("NC$dim$", v[i], "$vals", sep = ""))
  # v[i] = value_field
  v[i] = ncvar_get(NC,v[i], verbose = F )
}
v


noquote("NC$dim$lat$vals")
get(noquote("NC$dim$lat$vals"))
NC$dim$lat$vals
parse("NC$dim$lat$vals")

d = "NC$dim$lat$vals"
d = noquote(d)
d = as.symbol(d)
d = assign(d)
class(d)
d
d = as.name("NC$dim$lat$vals")
d = as.character(d)




eval(d)
parse(d)
class(d)
eval(as.symbol("NC$dim$lat$vals"))
eval(parse("NC$dim$lat$vals"))
NC$dim$lat$vals
require(tidyverse)
eval(sym(d))
a = as.name(v[1])
eval("abc")

a = "a"
b = "c"
print(assign(a, get(b)))

assign("a", get(b))
as.name("a")

NCvn = character(NC$nvars)
varnames = c("latitude", "longitude", "time", "bathymetry", "TSM", "Depth") # 'depth' 'n_an'
varnames= c(NCvn)
varnames

as.character(5)

varlist2[[i]] = 

varlist2[1] = NC$dim$lat$vals
varlist[2] = NC$dim$lat$vals
varlist[2] = NC$dim$lon$vals
lats = ncvar_get(NC, "lat")
lats
#valuefield = ncvar_get(NC1, "DEPTH", verbose = F)

varnames = vector()
for(i in 1:NC$nvars){
  varlist = c(varlist, NC$var[[i]]$name)
  
}

NC$var[[i]]$name
varlist




# get values
lon = NC$dim$lon$vals


length(varnames)
NC$var[[2]]$name
typeof(NC$nvars)
length(NC$nvars)

# dimenstion name in file$dim[[i]]$name
print(NC$dim[[1]]$name)
print(NC$dim[[2]]$name)
print(NC$dim[[3]]$name)

# latitude 
lat = NC$dim$lat$vals
len_lat = length(lat)
print(paste('Length (Number of Elements) of Latitude vector:  ', len_lat))
lat
# longitude
lon = NC$dim$lon$vals
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
NC1$var[[1]]$name
print(NC1_varnames)  

depth = ncvar_get(NC1, "DEPTH", verbose = F)

# must close the nc file
nc_close(NC1)

# subset for North Sea NS
NS = list(depth = depth, lon = lon , lat = lat)
NS$lat[1:10]


x = list("z", "b", "d")
replace(x, list("c", "d", "e")) 
x


v_names = vector()
v_list = vector(mode = list, length = 5)

for(i in seq_along(NC$dim)){
  print(NC$dim[[i]]$name)
  v_names = c(v_names, NC$dim[[i]]$name)
}



for(i in 1:2){
  print(NC$var$name)
}


