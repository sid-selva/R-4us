usda <- read.csv("mit_analytics-edge/data/usda.csv")

str(usda)

summary(usda)

usda$Sodium

which.max(usda$Sodium)

# Column Names 
names(usda)

usda$Description[which.max(usda$Sodium)]

high_sodium <- subset(usda, usda$Sodium > 10000)

nrow(high_sodium)

high_sodium$Description


# Using Match to Identify 

match("CAVIAR", usda$Description)

usda$Sodium[4154]

usda$Sodium[match("CAVIAR", usda$Description)]

summary(usda$Sodium)

sd(usda$Sodium, na.rm = TRUE)

plot(usda$Protein,usda$TotalFat)


plot(usda$Protein,usda$TotalFat, xlab = "Protein", ylab = "Fat", col = "blue")

hist(usda$VitaminC, xlab = "Vitamin C", main = "Histogram of Vitamin C")

hist(usda$VitaminC, xlab = "Vitamin C", main = "Histogram of Vitamin C", xlim = c(0,100))

hist(usda$VitaminC, xlab = "Vitamin C", main = "Histogram of Vitamin C", xlim = c(0,100), breaks = 100)
hist(usda$VitaminC, xlab = "Vitamin C", main = "Histogram of Vitamin C", xlim = c(0,100), breaks = 2000)

boxplot(usda$Sugar)

usda$Sodium[1] > mean(usda$Sodium, na.rm = TRUE)
usda$Sodium[50] > mean(usda$Sodium, na.rm = TRUE)

high_sodium_vec <- usda$Sodium > mean(usda$Sodium, na.rm = TRUE)

as.numeric(high_sodium_vec)

high_sodium_vec <- as.numeric(usda$Sodium > mean(usda$Sodium, na.rm = TRUE))

usda$high_sodium <- as.numeric(usda$Sodium > mean(usda$Sodium, na.rm = TRUE))
usda$HighCarbs = as.numeric(usda$Carbohydrate > mean(usda$Carbohydrate, na.rm=TRUE))
usda$HighProtein = as.numeric(usda$Protein > mean(usda$Protein, na.rm=TRUE))
usda$HighFat = as.numeric(usda$TotalFat > mean(usda$TotalFat, na.rm=TRUE))


# Table 
table(usda$high_sodium)

table(usda$high_sodium, usda$HighCarbs)

tapply(usda$Iron, usda$HighProtein, mean, na.rm = TRUE)

tapply(usda$VitaminC, usda$HighCarbs, max, na.rm = TRUE)

tapply(usda$VitaminC, usda$HighCarbs, summary, na.rm = TRUE)
