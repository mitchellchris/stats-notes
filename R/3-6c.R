set.seed(5)
stuff <-rgamma(100, 10, 5)
xbar <- mean(stuff)
VAR <- var(stuff)
c(xbar, VAR)
lambda <- xbar / VAR
alpha <- lambda * xbar
c(alpha, lambda)
qs <- qgamma(seq(0,1,by=0.1), alpha, lambda)
OB <- cut(stuff, breaks=qs, include.lowest=TRUE)
T1 <- xtabs(~OB)
OBS <- as.vector(T1)
OBS
EXP <- rep(10, 10)
X2obs <- sum((OBS - EXP)^2 / EXP)
X2obs
pvalue <- pchisq(X2obs, 7, lower=FALSE)
pvalue

plot(density(stuff))
median(stuff)
IQR(stuff)

stuff

library(ggplot2)
p <- ggplot(data=data.frame(x=stuff), aes(x=x))
p + geom_density() + theme_bw() + stat_function(fun=dgamma, args=list(alpha,lambda), lwd=2, lty="dashed")

