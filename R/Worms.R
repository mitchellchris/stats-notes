nums <- c(1, 2, 2, 7, 7, 10, 10, 10, 16, 17)
avgs <- vector(length=100)

for (i in 1:100) {
  randums <- sample(nums, 10)
  avgs[i] <- mean(randums[1:5]) - mean(randums[5:10])
}

sort(avgs)
mean(avgs)
sd(avgs)