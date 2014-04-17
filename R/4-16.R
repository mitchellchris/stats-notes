# 3 ways to bootstrap (sample with replacement)
# 1) for loop
# 2) boot package
# 3) replicate() function


# 7: Pop with normal dist mean = 36, sd = 8.

set.seed(13)
rs <- rnorm(200, 36, 8) # 200 samples from normal dist with mean=36 and sd=8
DF <- data.frame(x = rs)

# density plot
p1 <- ggplot(data=DF, aes(x=x)) + geom_density(fill="pink") + theme_bw()
p1

# quantile quantile plot
p2 <- ggplot(data=DF, aes(sample=x)) + stat_qq() + theme_bw()
p2

# bootstrap those 200 values

B <- 10000
theta.hat.star <- numeric(B)
for (i in 1:B) {
  bss <- sample(rs, size=200, replace=TRUE) # boot strap sample
  theta.hat.star[i] <- mean(bss)
}

mean(theta.hat.star)
mean(rs)
sd(theta.hat.star)
8/sqrt(200)

CI <- quantile(theta.hat.star, probs=c(.025, .975))
CI


# Replicate

set.seed(12)
B <- 10000
xbar <- replicate(B, mean(sample(Fish$mercury ,size=length(Fish$Mercury), replace=TRUE)))
SE <- sd(xbar)
CI <- quantile(x=xbar, probs=c(0.025, 0.975))

# Boot

mercury <- sort(Fish$Mercury)[-30]
require(boot)
FishMean <- function(data, i) {
  d <- data[i]
  M <- mean(d)
  M
}
boot.obj <- boot(data=mercury, statistic=FishMean, R=B)
boot.obj

boot.ci(boot.obj, type="perc")

site <- "http://www1.appstate.edu/~arnholta/Data/FlightDelays.csv"
FD <- read.csv(site)
head(FD)
UA <- FD[FD$Carrier == "UA",]$Delay
AA <- FD[FD$Carrier == "AA",]$Delay

UA
AA

set.seed(13)
B <- 10000
ths <- numeric(B)

for (i in 1:B) {
  ua <- sample(UA, size=length(UA), replace=T)
  aa <- sample(AA, size=length(AA), replace=T)
  ths[i] <- mean(ua)/mean(aa)
}

mean(ths)
sd(ths)
mean(UA)/mean(AA)

CI <- quantile(ths, probs=c(0.025, 0.975))
CI

BIAS <- mean(ths) - (mean(UA)/mean(AA))
BIAS

BIAS/sd(ths)
