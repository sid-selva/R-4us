wine <- read.csv("wine.csv")
str(wine)
summary(wine)
# one variable Regression 
model1 <- lm(Price ~ AGST, data = wine)
summary(model1)
# SSE 
model1$residuals
sse = sum(model1$residuals^2)
sse
#adding variables
model2 <- lm(Price ~ AGST + HarvestRain, data = wine)
summary(model2)
# both R-sq inceased so good.

sse2 <- sum(model2$residuals^2)
sse2

#all independent Variables 
model3 <- lm(Price ~ WinterRain + AGST + 
               HarvestRain + Age + FrancePop, 
             data = wine)

summary(model3)

sse3 <- sum(model3$residuals^2)
sse3


q1<- lm(Price ~ HarvestRain + WinterRain, data = wine)
summary(q1)

summary(model3)

model4 <- lm(Price ~ WinterRain + AGST + 
               HarvestRain + Age, 
             data = wine)
summary(model4)
cor(wine$WinterRain, wine$Price)
# matrix 
cor11 <- cor(wine)

model5 <- lm(Price ~ WinterRain + AGST + 
               HarvestRain, 
             data = wine)
summary(model5)

#predictive Ability , How well does the model perform on new data

wineTest <- read.csv("wine_test.csv")
str(wineTest)
predictTest <- predict(model4, newdata = wineTest)
predictTest
# to find r-sq

sse4 = sum((wineTest$Price- predictTest)^2)
sst4 = sum((wineTest$Price- mean(wine$Price))^2)
1-(sse4/sst4)
