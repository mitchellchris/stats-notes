#library(MASS)
#?quine
#head(quine)
#tapply(quine$Days, list(quine$Sex, quine$Lrn), mean)
# http://www1.appstate.edu/~arnholta/Data/
20:30
dog <- 1:5
dog+10
dog
3*dog
sum(dog)

FlightDelays <- read.csv(url("http://www1.appstate.edu/~arnholta/Data/FlightDelays.csv"))
names(FlightDelays)
head(FlightDelays)
tail(FlightDelays)
dim(FlightDelays)
table(FlightDelays$Carrier)
barplot(table(FlightDelays$Carrier))
table(FlightDelays$Carrier, FlightDelays$Delayed30)
hist(FlightDelays$Carrier, FlightDelays$Delayed30)

delay <- FlightDelays$Delay
mean(delay)
median(delay)
mean(delay, trim=.25)
max(delay)
min(delay)
range(delay)
var(delay)
sd(delay)
quantile(delay)
n <- length(delay)
(n - 1)/n * var(delay)
tapply(delay, FlightDelays$Carrier, mean)
tapply(delay, FlightDelays$DepartTime, median)
summary(delay)
boxplot(delay)

tapply(delay, FlightDelays$Day, summary)
boxplot(Delay ~ Day, data = FlightDelays)
tapply(delay, FlightDelays$DepartTime, summary)
boxplot(Delay ~ DepartTime, data = FlightDelays)

sd
fish25 <- 10:35
fish25

whale

whale <- 200
objects()
rm(whale)
objects()

3 +4
3+  4
mean(3+5)
mean ( 3 + 5 )


# Vectors

1:10
5:-3

seq(0, 3, by=.2)
seq(0, 3, length=15)
quantile(delay, seq(0, 1, by=.1))

c(1, 4, 8, 2, 9)
x <- c(2, 0, -4)
x
c(x, 0:5, x)

c("a", "b", "c", "d")
c(T, F, F, T, T, F)

rep("a", 5)
rep(c("a", "b"), 5)
rep(c("a", "b"), c(5, 2))

# class

state.name
data.class(state.name)
state.name == "Idaho"
data.class(state.name == "Idaho")
head(FlightDelays$Carrier)
data.class(FlightDelays$Carrier)

# Basic Arithmetic