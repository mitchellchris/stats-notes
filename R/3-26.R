# 1)Let X1, X2, ... , X9 ~ N(20,9)
#     Y1, Y2, ... , Y16 ~ N(16,4)
#     Z1, Z2, ... , Z25 ~ N(16,5)
#
#   	W1 = X_bar + Y_bar
#   	W2 = 4X - 2Y
#   	W3 = 2X_bar - 3Y_bar + Z_bar
#
#   a) What is the exact distribution of W1?
#   b) P(W1 < 33) = ?
#   c) What is the exact distribution of W2?
#   d) P(0 < W2 < 64) = ?
#   e) What is the exact distribution of W3?
#   f) P(W3 <= q) == 0.05 | q = ?
#
# 2) A friend claims that she has drawn a random
# 	sample of size 24 from a uniform distribution
# 	with a=0 and b=6.
#   
#   a) What is the expected value of the sample mean?
#   b) What is the variance of the sample mean?
#   c) What is the standard deviation of the sample mean?
#
# 1-continued) Simulate the sampling distribution of
#           	W1. Use a seed of 13, and create 10k
#           	samples. Answer b, c, and d based on
#           	The simulated sample distribution.

# 1
# a
# X_bar = mean(X) = 20
# Y_bar = mean(Y) = 16
# mean(X_bar + Y_bar) = 20 + 16
# var(X_bar + Y_bar) = 9^2 / 9 + 4^2 / 16
W1 ~ N(36, sqrt(10))

# b
pnorm(33,36,sqrt(10))

# c
# V[W2] = V[4X - 2Y]
# 4^2 * V[X] + 2^2 * V[Y]
# 16 * 9^2 + 4 * 4^2
# 1316
# 48 = 2 * 20 - 2 * 16
W2 ~ N(48,sqrt(1316))

# d
.5713

# e
# 8 = 2 * 20 - 3 * 16 + 16
W3 ~ N(8, sqrt(46)) # 46?

# f
-3.156

# 2
# a) 3
# b) 1/8
# c) sqrt(1/8)

# 1-continued
set.seed(13)
samples <- 10000
xbar <- numeric(samples)
ybar <- numeric(samples)
zbar <- numeric(samples)
for (i in 1:samples) {
  xbar[i] <- mean(rnorm(9,20,9))
  ybar[i] <- mean(rnorm(16,16,4))
  zbar[i] <- mean(rnorm(25,16,5))
}
W1 <- xbar+ybar
mean(W1)
var(W1)
sd(W1)
mean(W1<33)