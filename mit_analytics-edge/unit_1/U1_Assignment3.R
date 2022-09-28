rm(list = ls())
#if necessary 
cps <- read.csv("CPSData.csv")
str(cps)
table(cps$Industry)
sort(table(cps$State))
table(cps$Citizenship)
table(cps$Race)
summary(cps)
is.na(cps$Married)
?is.na
table(cps$Region, is.na(cps$Married))
table(cps$Age,is.na(cps$Married))
table(cps$State, is.na(cps$MetroAreaCode))
table(cps$Region, is.na(cps$MetroAreaCode))

# calculating propotion with tapply
tapply(is.na(cps$MetroAreaCode),cps$State, mean)
sort(tapply(is.na(cps$MetroAreaCode),cps$State, mean))

MetroCode <- read.csv("MetroAreaCodes.csv")
countryMap <- read.csv("CountryCodes.csv")

cps <- merge(cps,MetroCode, by.x = "MetroAreaCode", by.y = "Code", all.x = TRUE)
str(cps)
summary(cps$MetroArea)
sort(table(cps$MetroArea))

sort(tapply(cps$Hispanic,cps$MetroArea, mean))
cps$ISAsian <- cps$Race =="Asian"
sort(tapply(cps$ISAsian,cps$MetroArea,mean))

sort(tapply(cps$Education == "No high school diploma", cps$MetroArea, mean, na.rm= TRUE))

#integrating cpuntry of Birth

cps <-merge(cps, countryMap, by.x = "CountryOfBirthCode", by.y = "Code", all.x = TRUE)
summary(cps$Country)
sort(table(cps$Country))

tapply(cps$Country != "United States", cps$MetroArea, mean, na.rm = TRUE)

sort(tapply(cps$Country == "Somalia", cps$MetroArea, sum, na.rm = TRUE))
#use sum to count the number of occurances.