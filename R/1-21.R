#N <- 10000
#means <- numeric(N)
#for (i in 1:N) {
#  means[i] <- mean(sample(x=1:6, size=2, replace=TRUE))
#}

#table(means)
#hist(means)

#for (name in vector) {
#  commands
#}

#s <- 0
#for (i in c(10, 20, 30)) {
#  s <- s + i
#}
#s

#C <- numeric()

#for (f in seq(-100, 100, by=10)) {
#  print(c(f, (f-32)*5/9))
#}

#set.seed(13)
#junk <- matrix(rnorm(30, 100, 10), nrow=3, byrow=TRUE)
#dim(junk)
#junk

#juunk <- apply(junk, 2, mean)
#juunk

#juuunk <- apply(junk, 1, sum)
#juuunk
set.seed(13)
N <- 10000
N2mat <- matrix(0,N,2)
i <- 1
while (i <= N) {
  N2mat[i,] <- sample(1:6, size=2, replace=TRUE)
  i <- i + 1
}
N2mat

means <- apply(N2mat, 1, mean)
table(means)