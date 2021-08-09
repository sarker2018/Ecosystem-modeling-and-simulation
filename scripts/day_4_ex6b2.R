#saturation depth #####

#saturation depth, Z1 = (log(initial_intensity) - log(2*haft saturation))/espsilon

# initial intensity
I = 200  #  mu E m^2 1/s

# Half Saturation 
K = 25 #  mu E m^2 1/s

# attenuation constant eps 
eps = .2 # 1/m



# Intensity at depth H ####

dz = .1 # step size
I = 200

H = 150
Intensity = function(I,H,eps,dz){
  H = seq(from = 0, to = H, by = dz)
  y =  I
  for (i in 2:length(H)){
    didz = -y[i-1]*eps
    y[i] = y[i-1] + didz*dz
  }
  df = data.frame(depth = H, Intensity = y)
  return(df)
}
 
df = Intensity(I, H, eps, dz)
I_H = df$Intensity


# intensity at depth 

# Mean photo synthesis ####
#mean = maximum_synthesis*1/epsilon(epsilon*Z1+1-(I(H)/I(Z1)))

Pm = 2 # maximum intensity mu E m^2 1/s
# Z1 = NULL # saturation depth m
# I_H = NULL # intensity at depth H:  mu E m^2 1/s
# I_Z1 = NULL # inetnsity at depth Z1: mu E m^2 1/s
eps = .1 # Attenuation Coeff: 1/m
K = 25


P_mean = function(Pm, eps,K,I_H, I_Z1){
  Z1 = (log(I,exp(1))-log(2*K, exp(1)))/eps
  I_Z1 = 2*K
  I_H = df$Intensity
  p = Pm*(1/eps)*(eps*Z1 + 1 - (I_H/I_Z1))
  dat = data.frame(production = p, depth = df$depth)
  return(dat)
  }
eps_0.1 = P_mean(Pm, eps = .2,K,I_H, I_Z1)
eps_0.5 = P_mean(Pm, eps=.5,K=10,I_H, I_Z1)
K_5 = P_mean(Pm, eps=.5,K=5,I_H, I_Z1)
K_25 = P_mean(Pm, eps= .5,K=25,I_H, I_Z1)


par(mar = c(3,3,3,3) + 1) # setting plot position
plot(numeric(0),numeric(0),
     type= "n",
     ylim = c(0,40),
     las=3,
     
     xlim = c(0,150),
     ylab = "Productivity (???)",
     xlab = "Depth in (m)",
     main = "Primary production",
     cex.lab = 1.4,
     cex.main = 2,
     cex.axis = 1.3)
lines(eps_0.1$depth, eps_0.1$production, lty =1,lwd = 2, col = "blue")
lines(eps_0.5$depth, eps_0.5$production, lty =1,lwd = 2, col = "red")# lines(intensity_I, diff, lty =1,lwd = 2, col = "green")
lines(K_5$depth, K_5$production, lty =1,lwd = 2, col = "green")
lines(K_25$depth, K_25$production, lty =1,lwd = 2, col = "grey")


legend("topright",inset = .01, lty = 1,lwd = 2, col = c("blue","red", "green", "grey"), legend = c("eps = 1", "eps = .5", "K_5", "K_25"),
       title = "Curves for diff. epsiln", cex = .8, title.col = "black",
       box.lwd = 1,box.col = "#f53877",text.col = "#b51d64", text.font = 2)



