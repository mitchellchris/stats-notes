site <- "http://www1.appstate.edu/~arnholta/Data/GSS2002.csv"
GSS <- read.csv(file=url(site))
T4 <- xtabs(~GunLaw + SpendMilitary, data=GSS)
T4
index <- which(is.na(GSS$GunLaw) | is.na(GSS$SpendMilitary))
GSS1 <- GSS[, c("GunLaw", "SpendMilitary")]
GSS2 <- GSS[-index,]
N <- 10^3 - 1
result <- numeric(N)
set.seed(2)
for (i in 1:N) {
  T2 <- xtabs(~sample(GunLaw) + SpendMilitary, data=GSS2)
  result[i] <- chisq.test(T2)$statistic
}
OBstat <- chisq.test(xtabs(~GunLaw + SpendMilitary, data=GSS2))$statistic
OBstat
pvalue3 <- (sum(result >= OBstat) + 1)/(N + 1)
pvalue3