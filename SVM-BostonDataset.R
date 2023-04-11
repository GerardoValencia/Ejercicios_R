library(MASS)

data(Boston)

str(Boston)

library(e1071)
model = svm(medv ~ ., data = Boston)
print(model)

set.seed(1)
library(caret)
library(kernlab)
model <- train(
  medv ~ .,
  data = Boston,
  method = 'svmRadial'
)
model

set.seed(1)
model2 <- train(
  medv ~ .,
  data = Boston,
  method = 'svmRadial',
  preProcess = c("center", "scale")
)
model2

set.seed(1)
inTraining <- createDataPartition(Boston$medv, p = .80, list = FALSE)
training <- Boston[inTraining,]
testing  <- Boston[-inTraining,]

set.seed(1)
model3 <- train(
  medv ~ .,
  data = training,
  method = 'svmRadial',
  preProcess = c("center", "scale")
)
model3

test.features = subset(testing, select=-c(medv))
test.target = subset(testing, select=medv)[,1]

predictions = predict(model3, newdata = test.features)

# RMSE
sqrt(mean((test.target - predictions)^2))

df = cbind(predictions, test.target)
write.table(df, file = "RMSECalcular.txt", sep = "\t", eol = "\n")

# R2
cor(test.target, predictions) ^ 2

### CROSS-VALIDATION
set.seed(1)
ctrl <- trainControl(
  method = "cv",
  number = 10,
)

set.seed(1)
model4 <- train(
  medv ~ .,
  data = testing,
  method = 'svmRadial',
  preProcess = c("center", "scale"),
  trCtrl = ctrl
)
model4

test.features = subset(testing, select=-c(medv))
test.target = subset(testing, select=medv)[,1]

predictions = predict(model4, newdata = test.features)

# RMSE
sqrt(mean((test.target - predictions)^2))

# R2
cor(test.target, predictions) ^ 2


set.seed(1)

tuneGrid <- expand.grid(
  C = c(0.25, .5, 1),
  sigma = 0.1
)

model5 <- train(
  medv ~ .,
  data = training,
  method = 'svmRadial',
  preProcess = c("center", "scale"),
  trControl = ctrl,
  tuneGrid = tuneGrid
)
model5

plot(model5)


