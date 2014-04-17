# problem 4.1
Pop <- c(1, 2, 5, 6, 10, 12)

#sample space
SS <- t(combn(Pop, 3))

# medians of samples
MD <- apply(SS, 1, median) # or SS[,2]

# probability distribution of the medians
xtabs(~MD)/20

# compare median of Pop to mean of medians
median(Pop)
MMD <- mean(MD)
MMD

# variance of medians
VMD <- sum((c(2,5,6,10) - MMD)^2 *c(.2,.3,.3,.2))
VMD

# sample variance
var(MD)

# statistics apply to samples
# parameters apply to populations


# problem 4.4
# integral[1,2] 2/(x^2) dx = -2/x [1,2] = -1 + 2 = 1

f <- function(x){2/x^2}
integrate(f, 1, 2)$val
curve(f, 1, 2)

# P(W < 1.5)
integrate(f, 1, 1.5)$val


# 4.5

f <- function(x){(3/8)*x^2}
integrate(f, 0, 2)$val
integrate(f, 0, 1/5)

# 4.21

f <- function(x){2/x^2}

# f(xmax) = what
# F(x) = integral[1,x] 2/t^2 dt
# = -2/x + 2
# fmax(x) = 2(2 - 2/x)^(2-1) * 2/x^2

f <- function(x){8/x - 8/x^2}
integrate(f, 1, 2)

