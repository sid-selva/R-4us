rm(list = ls())
mvt <- read.csv("mvtWeek1.csv")
str(mvt)
summary(mvt)
max(mvt$ID)
min(mvt$Beat)
summary(mvt$Arrest)
summary(mvt$LocationDescription)
mvt$Date[1]

DateConvert = as.Date(strptime(mvt$Date, "%m/%d/%y %H:%M"))
summary(DateConvert)
#extract month and dayof the week
mvt$Month = months(DateConvert)
mvt$Weekday = weekdays(DateConvert)
mvt$Date = DateConvert
summary(mvt$Month)
table(mvt$Month)
table(mvt$Weekday)
#arrests and MotorThefts 
mvtt <- subset(mvt, mvt$Arrest == "TRUE")
table(mvtt$Month)
# or
table(mvt$Arrest, mvt$Month)
#Histogram Date
hist(mvt$Date, breaks=100)
#Boxplot
boxplot(mvt$Date~ mvt$Arrest)

rm(mvt2011)
mvt2001<- subset(mvt, mvt$Year == "2001")
table(mvt2001$Arrest)
# or another method
table(mvt$Arrest, mvt$Year)

#top 5 locations
sort(table(mvt$LocationDescription))

top5 <- subset(mvt,LocationDescription == "STREET"| 
                 mvt$LocationDescription ==  "PARKING LOT/GARAGE(NON.RESID.)"| 
                 mvt$LocationDescription =="ALLEY"|
                 mvt$LocationDescription == "GAS STATION"|
                 mvt$LocationDescription == "DRIVEWAY - RESIDENTIAL")

rm(Top5)
top5$LocationDescription = factor(top5$LocationDescription)
#refershig the factor variable. 
str(top5)
table(top5$Arrest,top5$LocationDescription)
table(top5$Weekday, top5$LocationDescription)
