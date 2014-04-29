height <- c(60, 65, 67, 64, 63, 62)
qqnorm(height)
qqline(height)
xbar <- mean(height)
Z <- qnorm(0.95)
n <- length(height)
sigma <- 2.5
CI <- xbar + c(-1, 1) * Z * sigma/sqrt(n)
CI
library(PASWR)
z.test(x=height, sigma.x=sigma, conf.level=0.90)
pnorm(62.217, lower=F) * 2 # p-value


CL = .83

# CT of 1- .17/2 (.915) with 5 degrees of freedom
CT = qt(1 - (1 - CL)/2, n - 1)
CI = xbar + c(-1, 1) * CT * sd(height)/sqrt(n)
CI

t.test(x=height, conf.level=0.83) # equivalent to above


str(House)
t.test(x=House$Price, conf.level=.947)
qqnorm(House$Price)
qqline(House$Price)


qt(.80, 5) # t_.80,5 -- t value with 80% of values to the left with 5 degrees of freedom
qnorm(.125) # Z_.125 -- Z value with 12.5% of values to the left