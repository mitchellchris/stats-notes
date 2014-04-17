set.seed(13)
sims <- 10000
n <- 4
mean_param <- 100
sd_param <- 10
Zs <- numeric(sims)
Ts <- numeric(sims)
for (i in 1:sims) {
   xs <- rnorm(n, mean_param, sd_param) # n values with normal with mean = 100 sd = 10
   xbar <- mean(xs)
   Zs[i] <- (xbar - mean_param) / (sd_param/sqrt(n))
   SD <- sd(xs)
   Ts[i] <- (xbar - mean_param) / (SD/sqrt(n))
 }
 
mean(Zs) # should be ~~ 0
sd(Zs) # should be ~~ 1   
quantile(Zs, prob=c(.025, 0.975))
mean(Ts)
sd(Ts)
quantile(Ts, prob=c(.025, 0.975))

plot(density(Ts), xlim=c(-6,6), ylim=c(0,.4))
lines(density(Zs), col="red")
qt(.975, 3)


cz = qnorm(0.975)
n <- 5
sigma <- 1
ages <- c(37, 32, 20, 21, 18)
xbar <- mean(ages)

CI <- c(xbar + c(-1,1) * cz * sigma/sqrt(n))
CI