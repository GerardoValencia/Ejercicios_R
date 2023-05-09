iris2 <- iris
iris2$Species <- NULL
(kmeans.result <- kmeans(iris2, 3))
kmeans.result$betweenss/kmeans.result$totss

table(iris$Species, kmeans.result$cluster)
plot(iris2[c("Sepal.Length", "Sepal.Width")], col = kmeans.result$cluster)
# plot cluster centers
points(kmeans.result$centers[,c("Sepal.Length", "Sepal.Width")], col = 1:3, pch = 8, cex=2)

new.result = cbind(iris, kmeans.result$cluster)

write.table(new.result, file = "C:\\Users\\ISND89\\Documents\\ISND\\Ejercicios R\\dfIRisWithClusters.txt", sep = "\t", eol = "\n", dec = ".")

calculaWithinss = function(clusterVar, df, kmax)
{
  clusterWithSS = NULL
  for (k in 1:kmax) 
  {
    res = 0
    for (i in 1:length(df)) 
    {
      res = res + sum((df[clusterVar$cluster == k,i]-clusterVar$centers[k,i])^2)
    }
    clusterWithSS[k] = res
  }
  clusterWithSS
}

#Determina el valor de betweenss
kmax = 2
calculaBetweenSS = function(clusterVar, df, kmax)
{
  betweenSS = 0
  for (k in 1:kmax) {
    res = 0
    sumTemp = 0
    for (i in 1:length(df)) {
      sumTemp = sumTemp + ((clusterVar$centers[k,i]-mean(df[,i]))^2)
    }
    res = sumTemp * clusterVar$size[k]
    betweenSS = betweenSS + res
  }
  betweenSS
}

kmeans.result$withinss
calculaWithinss(kmeans.result, iris2, 3)
kmeans.result$betweenss
calculaBetweenSS(kmeans.result, iris2, 3)

kmeans.result$centers
