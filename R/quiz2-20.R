site <- "http://www1.appstate.edu/~arnholta/Data/Spruce.csv"
Spruce <- read.csv(file=url(site))
summary(Spruce)
OBS <- tapply(Spruce$Ht.change, Spruce$Competition, mean)
OBS
OBSstat <- OBS[1] - OBS[2]
OBSstat
growth <- Spruce$Ht.change
xtabs(~Competition, data=Spruce)
m <- xtabs(~Competition, data=Spruce)[1]
n <- xtabs(~Competition, data=Spruce)[2]
N <- 10^4 -1
RESULT <- numeric(N)
set.seed(12)
for (i in 1:N) {
  index <- sample(m+n, m, replace=TRUE)
  RESULT[i] <- mean(growth[index]) - mean(growth[-index])
}
pvalue <- ((sum(RESULT <= OBSstat) + 1)/(N + 1)) * 2
pvalue

hist(RESULT)
