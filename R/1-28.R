# ggplot2 (grammar of graphics - better than lattice)
#   objects in ggplot2 have to be a dataframe
#var1 | var2 | ... | var10 | QUART
#---------------------------------
# ...    ...   ...    ...     ...
#
# append quartile to var1..var10

# var10 quartile

# cutpoints <- quantile(DF$var10, probs=c(0, .25, .5, .75, 1), na.rm=T)
# DF$QUART <- cut(DF$var10, cutpoints)

# Accessing things in a dataframe
# -------------------------------
# DF$var
# with(data=DF, var)
# attach(DF) -- puts all the fields of DF in the search list, replicates these globals from the dataframe
#   detach(DF) -- take DF fields off the search path

# Always set seed before generating random values
# set.seed(13)
# x <- rnorm(100)

library(PASWR)
EPI <- EPIDURALf
head(EPI)
str(EPI)
EPI$BMI <- (EPI$kg / (EPI$cm/100)^2)
head(EPI)

cutpoints <- quantile(EPI$BMI, probs=c(0, .25, .5, .75, 1), na.rm=T)
cutpoints
EPI$QUAR <- cut(EPI$BMI, cutpoints)
head(EPI)

#What are the mean BMI values for the 1,2,3,4th quartiles?

# (18.4, 27.9] (27.9, 30.8] (30.8, 34.3] (34.3, 59.5]

tapply(EPI$BMI, EPI$QUAR, mean) # apply mean on BMI based on QUAR

###

# Three S's to characterize some data
# -----------------------------------
# - Shape 
#     density
#     histogram
#     (boxplot [kinda, can hide multi-modality])
# - Center
#     Skewed -> (median)
#     Symmetric -> (mean)
# - Spread
#     Skewed -> Inner Quartile Range (IQR)
#     Symmetric -> std dev (sd)
library(ggplot2)

p <- ggplot(data=EPI, aes(x=BMI))
#p + geom_histogram() # skewed right because there is a  lower limit on BMI of 0
#p + geom_density() + facet_grid(Treatment ~ .) # Rows ~ columns (just one column is .)

p <- ggplot(data=EPI, aes(x=Treatment,y=BMI))
p + geom_boxplot() + facet_grid(. ~ QUAR) # Rows ~ columns (just one column is .)

