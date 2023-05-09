# Carga el conjunto de datos ForestFires
library(readr)
fires <- read_csv("C:/Users/ISND89/Documents/ISND/Machine Learning/forestfires.csv")

# Selecciona las variables X e Y (coordenadas) y la variable de respuesta (área quemada)
data <- subset(fires, select=c(X, Y, area))

# Normaliza los datos
data_norm <- scale(data)

# Implementa el algoritmo k-means con 3 clusters
set.seed(123)
kmeans_fit <- kmeans(data_norm, 3)

# Visualiza los resultados
library(ggplot2)
ggplot(data, aes(x=X, y=Y, color=factor(kmeans_fit$cluster))) + 
  geom_point(size=3) +
  scale_color_manual(values=c("red", "blue", "green")) +
  labs(title="k-means clustering", x="X coordinate", y="Y coordinate", color="Cluster")
