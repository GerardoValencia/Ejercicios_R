df<-iris
set.seed(1234)

#OPCION 1
ind <- sample(2, nrow(df), replace=TRUE, prob=c(0.7, 0.3))
random.train <- df[ind==1,]
random.test <- df[ind==2,]


#OPCION 2
trainTestSplit<-floor(nrow(df)*0.7)

#Asignacion de los datos de entrenamiento
train = df[1:trainTestSplit,]
#Datos de prueba
test = df[-(1:trainTestSplit),]


# cross fold validation (example)
# enlace: https://www.statology.org/k-fold-cross-validation-in-r/
df <- data.frame(y=c(6, 8, 12, 14, 14, 15, 17, 22, 24, 23),
                 x1=c(2, 5, 4, 3, 4, 6, 7, 5, 8, 9),
                 x2=c(14, 12, 12, 13, 7, 8, 7, 4, 6, 5))

library(caret)

#specify the cross-validation method
ctrl <- trainControl(method = "cv", number = 5)

#fit a regression model and use k-fold CV to evaluate performance
model <- train(y ~ x1 + x2, data = df, method = "lm", trControl = ctrl)

#view summary of k-fold CV               
print(model)
