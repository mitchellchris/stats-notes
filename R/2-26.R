M <- matrix(c(35, 146, 8, 97), nrow=2, byrow=T)
addmargins(M)
test <- chisq.test(M)
names(test)
test$expected
TS <- test$statistic
curve(dchisq(x, 1), 0, 8)
abline(v=TS, col="purple", lty="solid")
abline(h=0)
pvalue <- pchisq(TS, 1, lower=F)
pvalue
chisq.test(M)
