set.seed(13)
stuff <- rgamma(100, 3, 6) # random gamma dist (count=100, alpha=3, lambda=6)

# Base graphics
plot(density(stuff)) # shape - skewed right
median(stuff) # center
IQR(stuff) # spread

# ggplot2
library(ggplot2)
p <- ggplot(data=data.frame(x=stuff), aes(x=x))
p + geom_density(fill="peru") + theme_bw() + stat_function(fun=dgamma, args=list(3,6),color="tomato3", lwd=2, lty="dashed")


# Ho: Values in "stuff" are consistent with a gamma distribution that has unknown parameters.
# Ha: Values in "stuff" are not consistent with a gamma distribution that has unknown parameters.

xbar <- mean(stuff)
VAR <- var(stuff)
xbar
VAR

# xbar = alpha / lambda
# VAR = alpha / lambda^2

# xbar lambda = VAR lambda^2
# lambda = xbar / VAR

lambda <- xbar / VAR

# alpha = xbar^2 / VAR
alpha <- xbar^2 / VAR
alpha
lambda

qs = qgamma(seq(0,1,.1), alpha, lambda) # quantiles
qs

OB <- cut(stuff, breaks=qs) # observed values
T1 <- xtabs(~OB)
T1

OBS <- as.vector(T1)
EXP <- rep(10, 10)

X2obs <- sum((OBS - EXP)^2 / EXP)
X2obs

# compare to chi^2 _(c-1-2) [c - 1 - # params estimated]

pvalue <- pchisq(X2obs, 7, lower=FALSE)
pvalue

# pvalue > .05 - fail to reject the null hypothesis, fail to find any evidence to suppor the alternative
p <- ggplot(data=data.frame(x=stuff), aes(x=x))
p + geom_density(fill="peru") + theme_bw() + stat_function(fun=dgamma, args=list(alpha,lambda),color="tomato3", lwd=2, lty="dashed")

# Ho: Values in "stuff" are consistent with a gamma dist that has alpha=3 and lambda=6
# Ha: Values in "stuff" are not consistent with a gamma dist that has alpha=3 and lambda=6
qs = qgamma(seq(0,1,.1), 3, 6) # quantiles
qs

OB <- cut(stuff, breaks=qs) # observed values
T1 <- xtabs(~OB)
T1

OBS <- as.vector(T1)
EXP <- rep(10, 10)

X2obs <- sum((OBS - EXP)^2 / EXP)
X2obs

# compare to chi^2 _(c-1-2) [c - 1 - # params estimated]

pvalue <- pchisq(X2obs, 9, lower=FALSE)
pvalue
