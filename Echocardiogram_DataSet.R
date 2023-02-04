x = echocardiogram
class(echocardiogram)

is.na(x)
# Lo de Mario
x[x == ""] <- NA
View(x)

pos = which(x$V13 == "?")
length(pos)

x[pos,2] = "Private"

mfv(x$V3)

V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13

?which

dim(echocardiogram)

sum(is.na(x))

x$V1
mean(x$V1)

mean(as.integer(x$V1), na.rm = TRUE)

set.seed(3147)
x = rnorm(100)
summary(x)

# outliers
boxplot.stats(x)$out

boxplot(x)
