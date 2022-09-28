usda <- read.csv("USDA.csv")
names(usda) #gives the names of the variable
str(usda)
summary(usda)

usda$Description[which.max(usda$Sodium)]

highsod <- subset(usda, Sodium > 10000)
highsod$Description


usda$Sodium[match("CAVIAR", usda$Description)]

mean(usda$Sodium, na.rm = TRUE)
summary(usda$Sodium)

plot(usda$Protein ~ usda$TotalFat, col = "red")
hp_hf <- subset(usda, Protein > 40 & TotalFat > 40)

hist(usda$VitaminC, xlim = c(0,100), breaks = 2000)
?break

boxplot(usda$Sugar)

highsodium <- usda$Sodium > mean(usda$Sodium,na.rm = TRUE) 
#check whether the value is greater than mean
usda$highsodium <- as.numeric(highsodium)
#convert in to numberic value
str(usda)

usda$highprotien <- as.numeric(usda$Protein > mean(usda$Protein, na.rm = TRUE))
usda$highfat <- as.numeric(usda$TotalFat > mean(usda$TotalFat, na.rm = TRUE))
usda$highcarbs <- as.numeric(usda$Carbohydrate > mean(usda$Carbohydrate, na.rm = TRUE))

# 1- high - true, 0 False. Combined table. 0 in both etc
table(usda$highsodium)
table(usda$highsodium, usda$highfat)

#Tapply, shorting my 2nd argument and applying function

tapply(usda$Iron, usda$highprotien, mean, na.rm = TRUE)
tapply(usda$VitaminC, usda$highcarbs, mean, na.rm = TRUE)
tapply(usda$VitaminC, usda$highcarbs, max, na.rm = TRUE)
tapply(usda$VitaminC, usda$highcarbs, summary, na.rm = TRUE)


rm(list = ls())
