# P(X^2_4 >= 2) = x
1 - pchisq(2, 4)
pchisq(2, 4, lower=F)

# P(X^2_10 <= x) = .90
qchisq(.9, 10)

# Given X ~ N(100,10)

# P(80 <= X <= 120) = x
pnorm(120, 100, 10) - pnorm(80, 100, 10)


# P(75 <= X <= x) = .60
qnorm(.60 + pnorm(75, 100, 10), 100, 10)

pnorm(qnorm(.60 + pnorm(75, 100, 10), 100, 10), 100, 10) - pnorm(75, 100, 10)