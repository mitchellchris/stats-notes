# Repeat 10 but trim the upper and lower 25%.

site <- "http://www1.appstate.edu/~arnholta/Data/Bangladesh.csv"
Bang <- read.csv(file=url(site))
Chlorine <- Bang$Chlorine
chlorine <- subset(Bang, select = Chlorine, subset = !is.na(Chlorine), drop = T)

# a) Conduct EDA on the chlorine concentrations and describe the salient features.
hist(chlorine, breaks="Scott")
summary(chlorine)
head(chlorine)
IQR(chlorine)

# b) Bootstrap the mean.
B <- 10000
n <- length(chlorine)
boot.mean <- numeric(B)
set.seed(13)
for (i in 1:B) {
  x <- sample(chlorine, size = n, replace = TRUE)
  boot.mean[i] <- mean(x, trim=.25)
}
#hist(boot.mean, main = "MEANS", col = "lightblue", breaks = "Scott", xlab = substitute(paste(bar(X), "*")))
#qqnorm(boot.mean, main = "QQNORM MEANS")
#qqline(boot.mean, col = "red")

# c) Find and interpret the 95% bootstrap percentile confidence interval.
quantile(boot.mean, probs = c(0.025, 0.975))
# We are 95% confident that the chlorine concentration is between 55.09 and 104.61

# d) What is the bootstrap estimate of the bias?
#    What fraction of the bootstrap standard error does it represent?
BIAS <- mean(boot.mean) - mean(chlorine)
BIAS

BIAS / sd(boot.mean)
