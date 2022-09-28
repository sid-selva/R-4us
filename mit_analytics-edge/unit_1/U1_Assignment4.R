poll <- read.csv("AnonymityPoll.csv")
str(poll)
table(poll$Smartphone)
summary(poll)
table(poll$Sex, poll$Region)
table(poll$State, poll$Region)
table(poll$Internet.Use, poll$Smartphone)
poll1 <- subset(poll, Internet.Use == "1" | Smartphone == "1")
summary(poll1)
mean(poll$Info.On.Internet, na.rm = TRUE)
table(poll$Info.On.Internet)
table(poll$Worry.About.Info)
table(poll$Anonymity.Possible)
table(poll$Tried.Masking.Identity)
128/(128+656)
table(poll1$Privacy.Laws.Effective)
186/(186+541)
hist(poll$Age,breaks = 20)

table(poll$Age, poll$Info.On.Internet)
max(table(poll1$Age, poll1$Info.On.Internet))
plot(poll$Info.On.Internet~poll$Age)
plot(poll$Age, poll$Info.On.Internet)

#usage of jitter 
jitter(c(1,2,3))
#jitter adds or subtracts a small amount of random noise to the 
## values passed to it, and two runs will yield different results

plot(jitter(poll1$Age), jitter(poll1$Info.On.Internet))

tapply(poll1$Info.On.Internet, poll1$Smartphone, mean, rm.na = TRUE)
tapply(poll1$Tried.Masking.Identity, poll1$Smartphone, table)
tapply(poll1$Tried.Masking.Identity, poll1$Smartphone, summary)
