climate = read.csv("climate_change.csv")
## Use read.csv as opposed to read_csv 
train = subset(climate, Year <= 2006)

test = subset(climate, Year > 2006)
climatelm = lm(Temp ~ MEI + CO2 + CH4 + N2O + CFC.11 + CFC.12 + TSI + Aerosols, data=train)
summary(climatelm)
?tapply
c1<- cor(train)

climatelm2<- lm(Temp ~ MEI + N2O + TSI + Aerosols, data=train)
summary(climatelm2)
