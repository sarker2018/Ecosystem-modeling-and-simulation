P_mean = function(Pm, eps,K,H,I){     # eps: 1/m, K : mu Em/m^2*s
  Z1 = (log(I)-log(2*K))/eps #Intensity mu Em/m^2*s
  Z1[Z1<0.1] = 0.1 # holds the Z1 value always higher than 0.1
  #I_Z1 = 2*K                                #Intensity mu Em/m^2*s
  I_Z1 = I_analytic(I,H,eps)
  I_H = I_analytic(I,H,eps)                        #Intensity mu Em/m^2*s
  p = Pm*(1/eps)*(eps*Z1 + 1 - (I_H/I_Z1))  # total integrated p 1/DAY
  p = p/H # devide by depth to get the average p
  return(p)
}