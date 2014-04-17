site <- "http://www1.appstate.edu/~arnholta/Data/FlightDelays.csv"
FD <- read.csv(site)
FD[1:4, 1:9]
AA <- FD[FD$Carrier == "AA",]
UA <- FD[FD$Carrier == "UA",]
late <- AA[AA$Delay > 28,]
dim(late)[1] / dim(AA)[1] - dim(UA[UA$Delay > 28,])[1] / dim(UA)[1]


ANS <- tapply(FD$Delay > 28, FD$Carrier, mean)
ANS
OS <- ANS[1] - ANS[2]
OS
T1 <- xtabs(~Carrier, data=FD)
T1
m <- T1[1]
names(m) <- NULL
n <- T1[2]
names(n) <- NULL
c(m + n, m, n)
delays <- FD$Delay
SIMS <- 10^4 - 1
diffs <- numeric(SIMS)
set.seed(1)
for (i in 1:SIMS) {
  index <- sample(2906 + 1123, m, replace=FALSE)
  diffs[i] <- mean(delays[index] > 28) - mean(delays[-index] > 28)
}
pvalue <- (sum(diffs <= OS) + 1)/(SIMS + 1)
pvalue
