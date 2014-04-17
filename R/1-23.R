library(MASS)
#str(quine) #structure

MSL <- quine$Days[quine$Sex == "M" & quine$Lrn == "SL"]
#summary(MSL)

#tapply(quine$Days, list(quine$Sex, quine$Lrn), median)

#hist(MSL, col="tomato2", xlab="Days Missed", main="Male Slow Learners", breaks="scott")
#hist(MSL, col="tomato2", xlab="Days Missed", main="Male Slow Learners", breaks="FD")
#hist(MSL, col="tomato2", xlab="Days Missed", main="Male Slow Learners", breaks=seq(0, 70, 2))

#boxplot(MSL, col="tomato", horizontal=T, main="Male Slow Learners", xlab="Days Missed")

#IQR = Q3 - Q1
#top = Q3 + 1.5 * IQR
#bottom = Q1 - 1.5 * IQR
#outliers are above/below fences

#plot(density(MSL, bw=3))

#table(quine$Sex, quine$Lrn)
#T1 <- xtabs(~Sex + Lrn, data=quine)
#barplot(T1, legend=T, col=c("peachpuff2", "cornsilk3"), beside=T)

library(lattice)

#histogram(~Days, data=quine, col="tomato2")
#histogram(~Days|Sex, data=quine, col="tomato2")
#histogram(~Days|Sex, data=quine, col="tomato2", layout=c(1,2)) # 1 column, 2 rows
#histogram(~Days|Sex*Age, data=quine, col="tomato2", layout=c(4,2))
#densityplot(~Days|Sex*Age, data=quine, col="tomato2", layout=c(4,2))
#bwplot(Sex~Days, data=quine) #boxwhiskers plot
#bwplot(Sex~Days|Lrn, data=quine) #boxwhiskers plot

library(PASWR) #probability and statistics with R

#xyplot(kg~cm, data=EPIDURALf)
xyplot(kg~cm|Treatment, data=EPIDURALf, layout=c(1,2))
xyplot(kg~cm|Treatment, data=EPIDURALf, layout=c(1,2), type=c("p","r")) # points and regression line (least squares regression)