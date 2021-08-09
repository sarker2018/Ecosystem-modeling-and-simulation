

#  ####
exp<-expression(x^3)
D(exp, "x", 2)


f <- function(x) x^2

derivative = deriv(~ x^3, "x") 
x <- 2
eval(derivative )

int1 <- integrate(f, 0,2)




