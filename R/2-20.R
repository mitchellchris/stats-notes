# create 3000 random indices from 1:4000
# basically, we are swapping randomly between the partition to generate a sample set
# that is randomly distributed... we can see the probability of our original observation
# compared to what would happen if we did the above a bunch of times
index <- sample(4000, 3000, replace=FALSE)
mean(Delay[index])

# when calculating the pvalue, if it is a two-sided hypothesis, you multiply the pvalue by two

FD <- read.csv(url("http://www1.appstate.edu/~arnholta/Data/FlightDelays.csv"))
tapply(FD$Delay, FD$Carrier, mean, trim=.35)

tapply(FD$Delay > 20, FD$Month, mean)
tapply(FD$Delay, FD$Month, var)