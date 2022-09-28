rm(list = ls())
#if required
IBM <- read.csv("IBMStock.csv")
GE <- read.csv("GEStock.csv")
ProcterGamble <- read.csv("ProcterGambleStock.csv")
CocaCola <- read.csv("CocacolaStock.csv")
Boeing <- read.csv("BoeingStock.csv")

#Convert Date The first argument to the as.Date function is 
# the variable we want to convert, 
# and the second argument is the format of the Date variable 

str(GE)
IBM$Date = as.Date(IBM$Date, "%m/%d/%y")

GE$Date = as.Date(GE$Date, "%m/%d/%y")

CocaCola$Date = as.Date(CocaCola$Date, "%m/%d/%y")

ProcterGamble$Date = as.Date(ProcterGamble$Date, "%m/%d/%y")

Boeing$Date = as.Date(Boeing$Date, "%m/%d/%y")

min(GE$Date)
max(GE$Date)
mean(IBM$StockPrice, na.rm = TRUE)
min(GE$StockPrice)
summary(CocaCola)
summary(Boeing)
sd(ProcterGamble$StockPrice, na.rm = TRUE)
?plot
plot(CocaCola$Date,CocaCola$StockPrice, type ="l", col = "Red")
lines(ProcterGamble$Date, ProcterGamble$StockPrice, col = "blue")
abline(v=as.Date(c("2000-03-01")))


plot(CocaCola$Date[301:432], CocaCola$StockPrice[301:432], type="l", col="red", ylim=c(0,210))
lines(GE$Date[301:432], GE$StockPrice[301:432], col = 'blue')
lines(Boeing$Date[301:432], Boeing$StockPrice[301:432], col = 'green')
lines(IBM$Date[301:432], IBM$StockPrice[301:432], col = 'orange')
lines(ProcterGamble$Date[301:432], ProcterGamble$StockPrice[301:432], col = 'purple')
abline(v = as.Date(c("1997-09-01","1997-12-01")))

tapply(IBM$StockPrice, months(IBM$Date), mean)
tapply(GE$StockPrice, months(GE$Date), mean)
tapply(CocaCola$StockPrice, months(CocaCola$Date), mean)
tapply(ProcterGamble$StockPrice, months(ProcterGamble$Date), mean)
tapply(Boeing$StockPrice, months(Boeing$Date), mean)