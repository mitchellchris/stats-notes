# Bootstrap the patch dataset
# Problem 16 is a quiz replacement grade
library(bootstrap)
patch

thetaHat <- mean(patch$y) / mean(patch$z)
thetaHat
n <- dim(patch)[1]
n
B <- 10^4 - 1
ths <- numeric(B)
set.seed(13)

for (b in 1:B) {
  i <- sample(1:n, size=n, replace=TRUE)
  ys <- patch$y[i]
  zs <- patch$z[i]
  ths[b] <- mean(ys) / mean(zs)
}