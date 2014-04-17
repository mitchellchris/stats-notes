site <- "http://www1.appstate.edu/~arnholta/Data/Bangladesh.csv"
Bang <- read.csv(file=url(site))

opar <- par(no.readonly = TRUE)
par(mfrow = c(2, 2))
Arsenic <- Bang$Arsenic
hist(Arsenic, breaks = "Scott", main = "Figure 6a", col = "lightblue")
qqnorm(Arsenic, main = "Figure 6b")
qqline(Arsenic, col = "red")
B <- 10000
n <- sum(!is.na(Arsenic))
arsenic.mean <- numeric(B)
set.seed(7)
for (i in 1:B) {
  x <- sample(Arsenic, size = n, replace = TRUE)
  arsenic.mean[i] <- mean(x)
}
hist(arsenic.mean, main = "Figure 7a", col = "lightblue", breaks = "Scott", xlab = substitute(paste(bar(X), "*")))
qqnorm(arsenic.mean, main = "Figure 7b")
qqline(arsenic.mean, col = "red")

BELOW <- sum(arsenic.mean <= (mean(arsenic.mean) + qnorm(0.025) *
                                sd(arsenic.mean)))/B
ABOVE <- sum(arsenic.mean >= (mean(arsenic.mean) + qnorm(0.975) *
                                sd(arsenic.mean)))/B
c(BELOW, ABOVE)


site <- "http://www1.appstate.edu/~arnholta/Data/TV.csv"
TV <- read.csv(file = url(site)) # read data into TV
head(TV)

ct <- tapply(TV$Times, TV$Cable, mean)
ct

times.Basic <- subset(TV, select = Times, subset = Cable == "Basic", drop = TRUE)
times.Ext <- subset(TV, select = Times, subset = Cable == "Extended", drop = TRUE)

B <- 10^4
times.diff.mean <- numeric(B) # theta hat star
set.seed(5)
for (i in 1:B) {
  Basic.sample <- sample(times.Basic, size = length(times.Basic), replace = TRUE)
  Ext.sample <- sample(times.Ext, size = length(times.Ext), replace = TRUE)
  times.diff.mean[i] <- mean(Basic.sample) - mean(Ext.sample) # distribution of theta hat stars
}
opar <- par(no.readonly = TRUE)
par(mfrow = c(1, 2))
hist(times.diff.mean, breaks = "Scott", freq = FALSE, main = "Bootstrap Distribution \n (Figure 8a)",
     xlab = substitute(paste(bar(x)[1], "*", -bar(x)[2], "*")),
     col = "lightblue")
qqnorm(times.diff.mean, main = "Normal Q-Q Plot \n (Figure 8b)")
qqline(times.diff.mean, col = "red")


par(opar)
CI <- quantile(times.diff.mean, prob = c(0.025, 0.975))
CI

for (i in 1:P) {
  index <- sample(length(TV$Times), size = length(TV$Times[TV$Cable ==
                                                             "Basic"]), replace = FALSE)
  times.diff.meanP[i] <- mean(TV$Times[index]) - mean(TV$Times[-index])
}
opar <- par(no.readonly = TRUE)
par(mfrow = c(1, 2))
hist(times.diff.meanP, breaks = "Scott", freq = FALSE, main = "Randomization Distribution \n (Figure 9a)",
     xlab = substitute(paste(bar(x)[1], "*", -bar(x)[2], "*")),
     col = "lightblue")
abline(v = obsDIFF, col = "red")
qqnorm(times.diff.meanP, main = "Normal Q-Q Plot \n (Figure 9b)")
qqline(times.diff.meanP, col = "red")

par(opar)
pvalue <- (sum(times.diff.meanP >= obsDIFF) + 1)/(P + 1)



site <- "http://www1.appstate.edu/~arnholta/Data/Girls2004.csv"
Girls <- read.csv(file=url(site))
AK <- Girls[Girls$State == "AK",]$Weight
WY <- Girls[Girls$State == "WY",]$Weight
str(Girls)
summary(AK)
summary(WY)
head(AK)
head(WY)

#tapply(Girls$Weight, Girls$State, mean)

B <- 10^4
ths <- numeric(B) # theta hat star
set.seed(13)
for (i in 1:B) {
  aks <- sample(AK, size = length(AK), replace = TRUE)
  wys <- sample(WY, size = length(WY), replace = TRUE)
  ths[i] <- mean(aks) - mean(wys) # distribution of theta hat stars
}

hist(ths, breaks = "Scott", freq = FALSE)
summary(ths)

CI <- quantile(ths, prob = c(0.025, 0.975))
CI

# We are 95% confident that the weight of arkansas babies are, on average, between 87.97 and 524
# more units of weight than wyoming babies


BIAS <- (mean(AK) - mean(WY)) - mean(ths)
BIAS
sd(ths)

BIAS / sd(ths)
