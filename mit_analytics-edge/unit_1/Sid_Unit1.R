## TO clear work space use - rm(list=ls())

## Read.csv and read_csv are different in ways they import data. One imports us dataframe and 
## other as table Data frame
str(who_data)
summary(who_data)
getwd()
who <- read.csv("WHO.csv")
str(who)
summary(who)
who_eur <- subset(who, Region == "Europe")
str(who_eur)

# use , extension 
write.csv(who_eur,"WHO_Europe.csv")
rm(who_eur)

mean(who$Over60)

# to get the min variable 
which.min(who$Over60)
who$Country[183]

who$Country[which.max(who$LiteracyRate)]

#Tapply splits the data by the second argument and applies the third argument. 

tapply(who$LiteracyRate, who$Region, min, na.rm = TRUE)
tapply(who$ChildMortality, who$Region, mean)

ls()
rm(who)
