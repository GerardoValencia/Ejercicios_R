# Import Required packages
set.seed(500)
library(neuralnet)
library(MASS)

# Boston dataset from MASS
forestF <- read.csv("C:/Users/ISND89/Documents/ISND 8°/Machine Learning/forestfires.csv", header = TRUE)

# Eliminar las columnas "month" y "day"
forestF <- forestF[, c(1:2, 5:13)]

# Normalize the data
maxs <- apply(forestF, 2, max)
mins <- apply(forestF, 2, min)
scaled <- as.data.frame(scale(forestF, center = mins,
                              scale = maxs - mins))

# Split the data into training and testing set
index <- sample(1:nrow(forestF), round(0.75 * nrow(forestF)))
train_ <- scaled[index,]
test_ <- scaled[-index,]

# Build Neural Network
nn <- neuralnet(area ~ X + Y + FFMC + DMC + DC
                + ISI + temp + RH + wind + rain +
                  area,
                data = train_, hidden = c(5, 3),
                linear.output = TRUE)

# Predict on test data
pr.nn <- compute(nn, test_[,1:11])

# Compute mean squared error
pr.nn_ <- pr.nn$net.result * (max(forestF$area) - min(forestF$area)) + min(forestF$area)
test.r <- (test_$area) * (max(forestF$area) - min(forestF$area)) + min(forestF$area)
MSE.nn <- sum((test.r - pr.nn_)^2) / nrow(test_)

# Plot the neural network
plot(nn)

# Plot regression line
plot(test_$area, pr.nn_, col = "red",
     main = 'Real vs Predicted')
abline(0, 1, lwd = 2)

