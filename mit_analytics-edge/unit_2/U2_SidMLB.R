# baseball and moneyball 
#95 wins to make it to playoffs
# need more runs, How many runs 135 more than they allowed
bb <- read.csv("baseball.csv")
str(bb)

#subset only till 2002
moneyball <- subset(bb, Year<2002)
#run difference RD
moneyball$RD <- moneyball$RS - moneyball$RA

WinsReg = lm(W ~ RD, data = moneyball)
summary(WinsReg)


## do we need 135 as RD 
## Regression Model Wins = 80.8314 + 0.1058(RD)
## RD >= 133.4 
# the claim is verified 

# To Predict Runs OBP and SLG versus BA 
RunsReg = lm(RS ~ OBP+SLG + BA, data = moneyball)
summary(RunsReg)

# BA has a negative coefficient, implies that team with higher BA will score less runs
# Issue of multicollinearity , the factors are highly correlated 

RunsReg1 = lm(RS ~ OBP+SLG, data = moneyball)
summary(RunsReg1)

#OPB is more important than SLG, from coefficients 

#Allowing Runs 

RunsAll <- lm(RA~ OOBP + OSLG, data = moneyball)
summary(RunsAll)


teamRank = c(1,2,3,3,4,4,4,4,5,5)
wins2012 <- c(94,88,98,88,93,94,98,97,93,94)
wins2013 <- c(97,97,92,93,92,96,94,96,92,90)
cor(teamRank,wins2012)
cor(teamRank, wins2013)
