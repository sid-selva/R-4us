squareroot2 <- sqrt(2)

ls()

# Vectors and Dataframes 

d <- c(2,3,4,5)

ls()

# TODO: Add Examples


a <- seq(0,100,5)

b <- seq(0,300,15)

c <- data.frame(a,b)

c$c <- seq(0,20)

# Rbind combine rows in to a data frame

who <- read.csv("mit_analytics-edge/data/WHO.csv")

str(who)
# Structure Who 

summary(who)

who_europe <- subset(x = who, Region == "Europe")

# Write.csv 

rm(who_europe)

ls()


who$Under15

mean(who$Under15)
sd(who$Under15)

summary(who$Under15)

# Min index 

which.min(who$Under15)
which.max(who$Under15)

who$Country[which.min(who$Under15)]

who$Country[which.max(who$Under15)]

plot(who$GNI,who$FertilityRate)

outliers <- subset(who, GNI>10000 & who$FertilityRate > 2.5)

nrow(outliers)

outliers[c("Country","GNI","FertilityRate")]

# histogram and Plots 

hist(who$CellularSubscribers)

boxplot(who$LifeExpectancy ~ who$Region, ylab = "Life Expectency", main = 
          "Life Expectancy by Region")

boxplot(who$LifeExpectancy ~ who$Region)

table(who$Region)

# Tapply, First Argument is the variable needs to be summarised, second is grouping variable 
# third grouping function 

# tapply(vector, index, function)

tapply(who$Over60, who$Region, mean)

tapply(who$LiteracyRate,who$Region, min, na.rm = TRUE)

tapply(who$ChildMortality,who$Region, min, na.rm = TRUE)
