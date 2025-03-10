
# where you are ...
# ------------------
getwd()
ls()
Listfiles <- list.files(".")
Listfiles
list.files("..")
setwd("\home\MyPath\MyFolder")

a <- 2
print(a)
a
b <- 3
c <- a*b
c
print(a**b)
# sequences / vectors:
# --------------------
1:5


x <- 1:5
x
length(x)
5*x
y <- c(3,8,9,100,200)
help(c)
names(y) <- c("a","b","c")
y[1:3]
y[c(1,4)]
y["c"]
x*y
sum(x*y)
t <- seq(0,0.2,length=21)
help(seq)


# data frames, here with columns time
# and Var1 and another with columns
# time and Var2:
time <- 0:20; Var1 <- 0.1*exp(0.3*time);
Var2 <- 0.1*exp(0.3*time-0.02*time*time);
AllData <- data.frame(time = time,
                      Infect_1 = Var1, Infect_2 = Var2)
# elementary statistics functions:
# --------------------------------
A <- matrix(c(1:8,10),nrow=3,ncol=3)
a <- data.frame(A)
mean(A)
mean(a)
sd(a)
summary(a)
cor(a)
cor(AllData)

square <- function(x)
{
  return(x*x)
}
a <- 1:10
square(a)
help("function")
topower <- function(x,y=2)
{
  z <- x^y
  return(z)
}
topower(2,3)
topower(y=3,x=2)
# plotting
# --------
A <- matrix(nrow=20,ncol=3)
A[,1] <- 1:20
A[,2] <- A[,1] + rnorm(20,sd=1)
A[,3] <- 21 - A[,1] + rnorm(20,sd=5)
a <- data.frame(A)
names(a) <- c("x","y","z")
pairs(a)
pairs(AllData)
help(plot)
help(par)
plot(AllData$time,AllData$Infect_1)
plot(AllData$time,AllData$Infect_2)
plot(a$x,a$y)
plot(a$x,a$z,xlab="x",ylab="z",
     main="z(x)",xlim=c(0,20),
     ylim=c(0,1.1*max(a$z)))

par(mfrow=c(1,2),xaxs="i",yaxs="i",
    mar=c(4.5,4.5,2,1.5)+0.1)
for ( i in 2:3 )
{
  plot(numeric(0),numeric(0),xlim=
         c(0,max(a$x)),ylim=c(0,1.1*max(a[,i])),
       type="n",main=paste(names(a)[i],"(x)",
                           sep=""),xlab=names(a)[1],
       ylab=names(a)[i])
  lines(a$x,a[,i])
  points(a$x,a[,i])
}
help(legend)
x <- 1:20
y <- square(x)

# new plot figure
windows()
plot(x,y,xlab="#users",ylab="#messages",
     log="y")
# write to file
png("message.png", width=520, height=420)
plot(x,y,xlab="#users",ylab="#messages")
dev.off()
# writing and reading data:
# --------------
write(A,"test_data.dat", ncolumns=3)
newA <- read.table("test_data.dat",
                   header = TRUE)
newA



# Exercise 2

p = c(20:30)
q = c(25:35)
r = c(15:25)
plot(q,p)

x  <- seq(-2, 2, 0.05)
y1 <- pnorm(x)
y2 <- pnorm(x, 1, 1)

plot(x,y1,type="l",col="red")
lines(x,y2,col="green")


plot( x, y1, type="l", col="red" )
par(new=TRUE)
plot( x, y2, type="l", col="green" )
# 
# plot(first thing to plot)
# plot(second thing to plot,add=TRUE)


x1  <- seq(-2, 2, 0.05)
x2  <- seq(-3, 3, 0.05)
y1 <- pnorm(x1)
y2 <- pnorm(x2,1,1)

plot(x1,y1,ylim=range(c(y1,y2)),xlim=range(c(x1,x2)), type="l",col="red")
lines(x2,y2,col="green")


par(mfrow=c(1,2))

plot(p,q)

plot(p,r) 
     

library(lattice)
x <- seq(-2,2,0.05)
y1 <- pnorm(x)
y2 <- pnorm(x,1,1)
xyplot(y1 + y2 ~ x, ylab = "y1 and y2", type = "l", auto.key = list(points = F,lines = TRUE))



dat <- list(c(1.12157347682574, 1.33192942183165, 2.08170603538164, 
              3.21936891077735, 3.87674160966784, 4.01222877372179, 3.97721253044977, 
              3.92748085243377, 3.89422132704385, 3.87554992373411, 3.86571722337484, 
              3.86066855038186, 3.85810016465002, 3.85679624059312, 3.85613341785451, 
              3.85579555076542, 3.85562274484616, 3.85553404933868, 3.85548836742791, 
              3.85546476209749, 3.85545252710548), c(1.10529328957704, 1.31478057418982, 
                                                     2.05843350413484, 3.21445290319435, 3.93127780496161, 4.10019570732597, 
                                                     4.0548974496435, 3.97577600575589, 3.91388817353566, 3.87397233241435, 
                                                     3.85011420707963, 3.83631205949334, 3.82843188274012, 3.82395020512325, 
                                                     3.82139984806649, 3.81994467228049, 3.81911146133043, 3.81863258400429, 
                                                     3.81835633714707, 3.81819642258335, 3.81810355018493), c(1.08732237015566, 
                                                                                                              1.29744314553374, 2.03681100176799, 3.18820303674863, 3.90649946705568, 
                                                                                                              4.08059333708303, 4.04639279053423, 3.98156199908701, 3.93264549967637, 
                                                                                                              3.90244185986869, 3.88514800191734, 3.87554934102343, 3.87028551934942, 
                                                                                                              3.86740818622607, 3.86583394198314, 3.86497024645408, 3.86449471113229, 
                                                                                                              3.86423191258367, 3.86408614948732, 3.86400502180298, 3.86395972379237
                                                     ), c(1.30161877569605, 1.46553776200827, 2.10197173547206, 3.06930201699535, 
                                                          3.66250999070993, 3.85723600464989, 3.8942042549933, 3.88392091929778, 
                                                          3.8605155020708, 3.83375521970562, 3.80643844775653, 3.77938071354659, 
                                                          3.75282366570479, 3.72683925144018, 3.70144788585054, 3.67665362718513, 
                                                          3.65245483803303, 3.62884749589963, 3.60582627074711, 3.58338491537713, 
                                                          3.5615164406438), c(1.08469594718265, 1.29546127452487, 2.03810539840721, 
                                                                              3.18905959610048, 3.89746111531108, 4.06513051117241, 4.03208432847638, 
                                                                              3.97188967237102, 3.92762525203426, 3.90089820027383, 3.88590086923236, 
                                                                              3.87773268456738, 3.87333409971113, 3.87097228241208, 3.8697027802883, 
                                                                              3.86901848471182, 3.86864832970741, 3.86844736049309, 3.86833785249504, 
                                                                              3.86827797747177, 3.86824513600819), c(1.07964052838977, 1.29190777425215, 
                                                                                                                     2.04231250239992, 3.19798917985082, 3.89723898066506, 4.05757629447758, 
                                                                                                                     4.02387699444488, 3.96603112527963, 3.9243602259927, 3.89958493083309, 
                                                                                                                     3.88586527520208, 3.87848244531751, 3.87455196717863, 3.87246483056295, 
                                                                                                                     3.87135520285416, 3.87076356341284, 3.87044698746471, 3.87027696477127, 
                                                                                                                     3.87018532072631, 3.87013575499355, 3.87010886245731), c(1.08933181649253, 
                                                                                                                                                                              1.29901388665636, 2.03604356337407, 3.18580149536436, 3.9065276727864, 
                                                                                                                                                                              4.08284397088934, 4.04915431500807, 3.9839665676791, 3.93452404770496, 
                                                                                                                                                                              3.90388767912571, 3.88629572919666, 3.87650700142078, 3.8711264587724, 
                                                                                                                                                                              3.8681788052111, 3.86656261507012, 3.86567402891195, 3.86518376322719, 
                                                                                                                                                                              3.86491225889191, 3.86476135376567, 3.86467718966398, 3.86463009866786
                                                                                                                     ), c(1.12459738833516, 1.33429622029097, 2.08134547519017, 3.21607128232391, 
                                                                                                                          3.87334654404529, 4.0092794872425, 3.97432485460807, 3.92449513705583, 
                                                                                                                          3.89113365765329, 3.87239201995412, 3.86251706226948, 3.85744441841396, 
                                                                                                                          3.85486281767585, 3.85355171294798, 3.85288501684111, 3.8525450675694, 
                                                                                                                          3.85237114377774, 3.85228184815236, 3.8522358438795, 3.85221206522138, 
                                                                                                                          3.85219973692982), c(1.08152696725377, 1.29354595382903, 2.04268473144721, 
                                                                                                                                               3.19946254279135, 3.90444884340271, 4.06790786857492, 4.0329743488585, 
                                                                                                                                               3.9721635966533, 3.92774092720633, 3.9009926112924, 3.88600650759486, 
                                                                                                                                               3.87785240458544, 3.87346429522664, 3.87110919016533, 3.86984371655882, 
                                                                                                                                               3.869161759929, 3.86879293902871, 3.86859272357885, 3.86848363941323, 
                                                                                                                                               3.86842400221486, 3.86839129414273), c(1.08197483401857, 1.29359825225018, 
                                                                                                                                                                                      2.04082955314597, 3.19437482098117, 3.89680650725515, 4.05972606592981, 
                                                                                                                                                                                      4.02617525912275, 3.96741176617648, 3.92476392035391, 3.89926386772869, 
                                                                                                                                                                                      3.88507394855001, 3.87740396348501, 3.87330326448182, 3.87111672936341, 
                                                                                                                                                                                      3.86994950869332, 3.86932463408538, 3.86898891944037, 3.86880788736096, 
                                                                                                                                                                                      3.86870991350275, 3.86865670925241, 3.86862772534133), c(1.08216196424983, 
                                                                                                                                                                                                                                               1.29413465287689, 2.04304891046787, 3.19856102707185, 3.90114775913897, 
                                                                                                                                                                                                                                               4.0634953181634, 4.02931505555857, 3.97000974912286, 3.92696706310058, 
                                                                                                                                                                                                                                               3.90120957987481, 3.88686190905547, 3.87909827895443, 3.87494285145371, 
                                                                                                                                                                                                                                               3.87272456890303, 3.8715389950979, 3.87090352665212, 3.87056170077119, 
                                                                                                                                                                                                                                               3.87037714404976, 3.87027713742418, 3.87022276077104, 3.87019310063444
                                                                                                                                                                                      ), c(1.08208080422425, 1.29409482026275, 2.04322281433486, 3.19877157213528, 
                                                                                                                                                                                           3.90088920797055, 4.06293059188269, 4.02879633885981, 3.96968626960857, 
                                                                                                                                                                                           3.92683419521334, 3.90121559093586, 3.88695769522339, 3.879248936171, 
                                                                                                                                                                                           3.87512613020615, 3.87292696985694, 3.87175252322308, 3.87112350463803, 
                                                                                                                                                                                           3.87078540971225, 3.87060300879754, 3.87050424709519, 3.87045058912723, 
                                                                                                                                                                                           3.87042134381434), c(1.08220050068092, 1.29416045954134, 2.04300889772717, 
                                                                                                                                                                                                                3.19847760351553, 3.90113372450959, 4.06353948547856, 4.02936728462705, 
                                                                                                                                                                                                                3.97004710522954, 3.92698700475469, 3.90121623176852, 3.88685981428833, 
                                                                                                                                                                                                                3.87909079476742, 3.87493215130221, 3.87271198077119, 3.87152530797643, 
                                                                                                                                                                                                                3.87088920267017, 3.87054700860192, 3.87036223928244, 3.8702621099747, 
                                                                                                                                                                                                                3.87020766254669, 3.87017796158474), c(1.08207245581171, 1.29409069738142, 
                                                                                                                                                                                                                                                       2.04324072847744, 3.1987945048703, 3.90086667118013, 4.06287780648447, 
                                                                                                                                                                                                                                                       4.02874718343757, 3.96965515642479, 3.92682083928555, 3.90121519699921, 
                                                                                                                                                                                                                                                       3.88696568414963, 3.87926204867567, 3.87514228806757, 3.87294491227269, 
                                                                                                                                                                                                                                                       3.87177150366836, 3.87114308652571, 3.87080533935571, 3.87062313929028, 
                                                                                                                                                                                                                                                       3.87052449352086, 3.87047090244975, 3.87044169573205), c(1.08218708599303, 
                                                                                                                                                                                                                                                                                                                1.29415164868573, 2.0430238507559, 3.19850707937143, 3.90113545482259, 
                                                                                                                                                                                                                                                                                                                4.06351892102187, 4.02934466379532, 3.97003155465113, 3.92697929062447, 
                                                                                                                                                                                                                                                                                                                3.90121442227887, 3.88686187260142, 3.87909523146381, 3.87493800601191, 
                                                                                                                                                                                                                                                                                                                3.87271866772437, 3.87153247939674, 3.87089665489438, 3.87055462321291, 
                                                                                                                                                                                                                                                                                                                3.87036994768823, 3.87026987252343, 3.87021545634019, 3.87018577340675
                                                                                                                                                                                                                                                       ))

par(mfrow = c(1, 1))
plot(NA, ylim = c(0, 7), xlim = c(0, 20))
for(i in 1:15){
  lines(dat[[i]], type = "l", col = colorRampPalette(c("blue", "red"))(i)) 
}

