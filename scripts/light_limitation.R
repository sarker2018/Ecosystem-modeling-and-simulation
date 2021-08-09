ramp_function = function(Max_Synth_pm, intensity_I, Half_Satu_K){
  val = Max_Synth_pm*(intensity_I/(2*Half_Satu_K))
  val[intensity_I>=2*Half_Satu_K] = Max_Synth_pm
  return(val)}