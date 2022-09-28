nba <- read.csv("mit_analytics-edge/unit_2/data/NBA_train.csv")
str(nba)
# there is an X because, in R variable should't start with number. 
table(nba$W, nba$Playoffs)
# need about 42 wins to make it to playoffs 
#score more points, conced less points
nba$ptsdiff <- nba$PTS - nba$oppPTS
plot(nba$ptsdiff, nba$W)

winsreg <- lm(W~ptsdiff, data = nba)
summary(winsreg)

## Regression Wins = 41 + 0.0326 * Pts Diff
## For 42 wins, PTS Diffs >= 30.67


pointsReg <- lm(PTS ~ X2PA+ X3PA + 
                  FTA + AST + ORB+ DRB + TOV
                +STL + BLK, data = nba)
summary(pointsReg)

sse = sum(pointsReg$residuals^2)
sse
#RMSE - Root mean sq error 
rmse <- sqrt(sse/nrow(nba))
#SST 
mean(nba$PTS)

#removing TOV 
pointsReg1 <- lm(PTS ~ X2PA+ X3PA + 
                  FTA + AST + ORB+ DRB
                + STL + BLK, data = nba)
summary(pointsReg1)

#removing DRB

pointsReg2 <- lm(PTS ~ X2PA+ X3PA + 
                  FTA + AST + ORB 
                +STL + BLK, data = nba)
summary(pointsReg2)

#removinf blocks
pointsReg3 <- lm(PTS ~ X2PA+ X3PA + 
                  FTA + AST + ORB
                +STL, data = nba)
summary(pointsReg3)

ssef <- sum(pointsReg3$residuals^2)
rmsef <- sqrt(ssef/nrow(nba))
# prediction 

nba_test <- read.csv("NBA_test.csv")
pointspredictions <- predict(pointsReg3,newdata = nba_test)
#calculate the r-sq of the sample, testing sample 

sset <- sum((pointspredictions - nba_test$PTS)^2)
sstt <- sum((mean(nba$PTS)-nba_test$PTS)^2)
R2 <- 1 - (sset/sstt)
rmset <- sqrt(sset/nrow(nba_test))
