
# Linear function y(t) = y0 + ?? t


#creating empty list and appending
# append(x, values, after = length(x))
# list.append(empty_list, 1:3)
# 
# l = vector()
# append(l, 1:3)
# print(l)
# 
# 
# mylist <- vector()
# 
# 
# for (i in 1:10){
#   mylist <- c(mylist, i)
# }
# print(mylist)
# 


t = c(0, 1, 5)
alpha = c(-1, 1, 3)
y_t = vector()


linear <- function(y_0, alpha, t){
  return(y_0 + alpha*t)
  # y <- y_0 + alpha*t
  # return(y)
}

for (i in 1:length(t_0)){
  y <- linear(1, alpha[i], 1)
  y_t <- c(y_t,y)
  
}

print(y_t)
