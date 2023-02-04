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
media = mean(x)
desvEst = sd(x)
desv_3 = 3 * desvEst - media
desv_2 = 2 * desvEst - media

y = rnorm(100)
df = data.frame(x, y)
rm(x, y)
head(df)
tail(df)
attach(df)
# find the index of outliers from x
(a = which(x %in% boxplot.stats(x)$out))

# find the index of outliers from y
(b = which(y %in% boxplot.stats(y)$out))

detach(df)
# outliers in both x and y
(outlier.list1 = intersect(a,b))

plot(df)
points(df[outlier.list1,], col="red", pch="+", cex=2.5)

# outliers in either x or y
(outlier.list2 = union(a,b))


plot(df)
points(df[outlier.list2,], col="blue", pch="x", cex=2)

# remove "Species", which is a categorical column
iris2 = iris[,1:4]
outlier.scores = lofactor(iris2, k=5)
plot(density(outlier.scores))

# pick top 5 as outliers
outliers = order(outlier.scores, decreasing = T)[1:5]
# who are outliers
print(outliers)

print(iris2[outliers,])
n = nrow(iris2)
labels = 1:n
labels[-outliers] = "."
biplot(prcomp(iris2), cex=.8, xlabels=labels)
pch = rep(".", n)
pch[outliers] = "+"
col = rep("black", n)
col[outliers] = "red"
pairs(iris2, pch=pch, col=col)

library(Rlof)
outlier.scores <- lof(iris2, k=5)
# try with different number of neighbors (k = 5,6,7,8,9 and 10)
outlier.scores <- lof(iris2, k=c(5:10))
# remove species from the data to cluster
iris2 <- iris[,1:4]
kmeans.result <- kmeans(iris2, centers=3)
# cluster centers
kmeans.result$centers
# cluster IDs
kmeans.result$cluster
# calculate distances between objects and cluster centers
centers <- kmeans.result$centers[kmeans.result$cluster, ]
distances <- sqrt(rowSums((iris2 - centers)^2))
# pick top 5 largest distances
outliers <- order(distances, decreasing=T)[1:5]
# who are outliers
print(outliers)
print(iris2[outliers,])
# plot clusters
plot(iris2[,c("Sepal.Length", "Sepal.Width")], pch="o", + col=kmeans.result$cluster, cex=0.3)
# plot cluster centers
points(kmeans.result$centers[,c("Sepal.Length", "Sepal.Width")], col=1:3,
           + pch=8, cex=1.5)
# plot outliers
points(iris2[outliers, c("Sepal.Length", "Sepal.Width")], pch="+", col=4, cex=1.5)
