site <- "http://www1.appstate.edu/~arnholta/Data/NCBirths2004.csv"
Babies <- read.csv(file=url(site))
str(Babies)
head(Babies)
summary(Babies)
hist(Babies$Weight, col="orange", breaks="Scott")
library(ggplot2)
ggplot(data=Babies, aes(x=Weight)) + geom_density() + geom_density(fill="tomato4") + theme_bw() + facet_grid(Gender~.)
tapply(Babies$Weight, Babies$Gender, mean)
tapply(Babies$Weight, Babies$Gender, sd)


# Ch 5 prob 7
# normal dist
# mean = 36
# standard error = 8 / sqrt(200)

# xbar ~ N(36, 8/sqrt(200))

set.seed(13)
brent <- rnorm(200, 36, 8)
summary(brent)
hist(brent)
mean(brent)
sd(brent)

B <- 10^4 - 1
ths <- numeric(B)
my.boot.statB <- numeric(B)
for (i in 1:B){
  x <- sample(brent, size=200, replace = TRUE) 
  ths[i] <- mean(x)
  my.boot.statB[i] <- mean(x)
}

mean(ths)
mean(brent)
BIAS <- mean(ths) - mean(brent)
BIAS
sd(ths)

hist(my.boot.statB, breaks = "Scott", col = 'lightblue', xlab = substitute(paste(bar(X),"* (g)")),freq= FALSE)
abline(v = mean(Babies$Weight), col = "blue")
abline(v = mean(my.boot.statB), col = "red")
boot.bias <- mean(my.boot.statB) - mean(brent)
boot.bias
ggplot(data = data.frame(x = my.boot.statB), aes(x =x)) + geom_density(fill = "lightblue") + labs(x = substitute(paste(bar(X),"* (g)"))) + theme_bw() 