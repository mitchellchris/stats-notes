set.seed(13)
rolls <- sample(6, 60, replace=TRUE)
T1 <- xtabs(~rolls)
OBS <- as.vector(T1)
OBS
EXP <- rep(10, 6)
EXP

X2 <- sum((OBS-EXP)^2 / EXP)
X2

pchisq(X2, 5, lower=FALSE) # or 1 - pchisq(X2, 5)
curve(dchisq(x, 5), 0, 15)
abline(v=X2)

# Ho: X ~ N(100, 10) -- X is described by norma(100, 10)
# Ha: Data is not N(100, 10)
set.seed(13)
stuff <- rnorm(100, 100, 10)
# inverse cumulative distribution function
# give it area and it gives you quantile
qs <- qnorm(c(0,.2,.4,.6,.8,1), 100, 10)
qs

cuts <- (cut(stuff, breaks=qs))
T1 <- xtabs(~cuts)
OBS <- as.vector(T1)
EXP <- rep(20, 5)
X2 <- sum((OBS-EXP)^2/EXP)
X2
pchisq(X2, 4, lower=FALSE)
curve(dchisq(x,4),0,10)
abline(v=X2)
  
set.seed(13)
stuff <- rnorm(100, 100, 10)
xbar <- mean(stuff)
SD <- sd(stuff)
c(xbar, SD)
qs <- qnorm(seq(0, 1, .1), xbar, SD)
qs
cuts <- cut(stuff, breaks=qs)
T1 <- xtabs(~cuts)
OBS <- as.vector(T1)
EXP <- rep(10, 10)
X2 <- sum((OBS-EXP)^2/EXP)
X2
pchisq(X2, 7, lower=FALSE)
