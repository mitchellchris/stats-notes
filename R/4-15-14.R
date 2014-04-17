site <- "http://www1.appstate.edu/~arnholta/Data/Girls2004.csv"
Girls <- read.csv(file=url(site))
AK <- Girls[Girls$State == "AK",]$Weight
WY <- Girls[Girls$State == "WY",]$Weight

# (a) Perform some exploratory data analysis and obtain summary statistics on the
# weights of baby girls born in Wyoming and Arkansas (do separate analyses
# for each state).
str(Girls)
summary(AK)
summary(WY)
head(AK)
head(WY)

tapply(Girls$Weight, Girls$State, mean)


# (b) Bootstrap the difference in means, plot the distribution, and give the summary statistics.
# Obtain a 95% bootstrap percentile confidence interval and interpret this interval.
B <- 10^4
ths <- numeric(B) # theta hat star
set.seed(13)
for (i in 1:B) {
  aks <- sample(AK, size = length(AK), replace = TRUE)
  wys <- sample(WY, size = length(WY), replace = TRUE)
  ths[i] <- mean(aks) - mean(wys) # distribution of theta hat stars
}

hist(ths, breaks = "Scott", freq = FALSE)
summary(ths)

CI <- quantile(ths, probs = c(0.025, 0.975))
CI

# We are 95% confident that the weight of arkansas babies are, on average, between 87.97 and 524
# grams more than wyoming babies

# (c) What is the bootstrap estimate of the bias? What fraction of the bootstrap standard error does 
# it represent?

BIAS <- mean(ths) - (mean(AK) - mean(WY))
BIAS
sd(ths)

BIAS / sd(ths)

# (d) Conduct a permutatino test to calculate the difference in mean weights and state
# your conclusion.

# (e) For what population(s), if any, does this conclucsion hold? Explain