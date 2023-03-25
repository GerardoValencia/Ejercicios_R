library(MASS)
library(e1071)
library(caret)
library(kernlab)

# Cargar los datos
forestF <- read.csv("C:/Users/jerry/OneDrive/Documentos/GitHub/Ejercicios_R/forestfires.csv", header = TRUE)

model = svm(area ~ ., data = forestF)
print(model)

model <- train(
  area ~ .,
  data = forestF,
  method = 'svmRadial'
)
model

set.seed(1)
model2 <- train(
  area ~ .,
  data = forestF,
  method = 'svmRadial',
  preProcess = c("center", "scale")
)
model2

set.seed(1)
inTraining <- createDataPartition(forestF$area, p = .80, list = FALSE)
training <- forestF[inTraining,]
testing  <- forestF[-inTraining,]

set.seed(1)
model3 <- train(
  area ~ .,
  data = training,
  method = 'svmRadial',
  preProcess = c("center", "scale")
)
model3

test.features = subset(testing, select=-c(area))
test.target = subset(testing, select=area)[,1]

predictions = predict(model3, newdata = test.features)

# RMSE
sqrt(mean((test.target - predictions)^2))

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
  area ~ .,
  data = testing,
  method = 'svmRadial',
  preProcess = c("center", "scale"),
  trCtrl = ctrl
)
model4

test.features = subset(testing, select=-c(area))
test.target = subset(testing, select=area)[,1]

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
  area ~ .,
  data = training,
  method = 'svmRadial',
  preProcess = c("center", "scale"),
  trControl = ctrl,
  tuneGrid = tuneGrid
)
model5

plot(model5)
