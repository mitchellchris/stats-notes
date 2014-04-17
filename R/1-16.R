url <- "http://www1.appstate.edu/~arnholta/PASWR/CD/data/Poplar3.CSV"
poplar <- read.csv(file = url(url), na.strings = "-99")
head(poplar, n=5)
tail(poplar)
str(poplar)
summary(poplar)

poplarC <- read.csv(file = url(url), na.strings = "-99", colClasses = c(rep("factor", 3), rep("numeric", 3), "factor"))
str(poplarC)
poplarC$Height[1:10]
overNine <- poplarC$Height > 9
overNine
poplarC$Height[overNine]

#?matrix
# foo = matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, ncol=3, byrow=TRUE)
#?sample
# sample(x=1:6, size=2, replace=TRUE)
