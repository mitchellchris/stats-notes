FD <- read.csv(url("http://www1.appstate.edu/~arnholta/Data/FlightDelays.csv"))
summary(FD)
str(FD)
head(FD)
tail(FD)

airMeans <- tapply(FD$Delay, FD$Carrier, mean)
obDif <- as.vector(airMeans[1] - airMeans[2])

m <- summary(FD$Carrier)[1]
n <- summary(FD$Carrier)[2]
as.vector(table(FD$Carrier))

DelayTimes <- FD$Delay

N <- 10^4 - 1
diffs <- numeric(N)
for (i in 1:N) {
  index <- sample(m+n, m, replace=FALSE)
  diffs[i] <- mean(DelayTimes[index]) - mean(DelayTimes[-index])
}

hist(diffs, col="tomato2")
summary(diffs)

require(ggplot2)
ggplot(data=data.frame(x=diffs), aes(x=x)) + geom_density(fill = "tomato2", alpha=.8) + theme_bw() + geom_vline(xintercept=obDif, lty="dashed")
pval <- ((sum(diffs <= obDif) + 1)/(N + 1)) * 2
pval