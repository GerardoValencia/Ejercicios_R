df = iris
set.seed(1234)

#OPCION 1
ind = sample(2, nrow(df), replace = TRUE, prob = c(0.7, 0.3))
random.train = df[ind==1,]
random.test = df[ind==2,]

#OPCION 2
trainTestSplit = floor(nrow(df)*0.7)

#Asignación de los datos de entrenamiento
train = df[1:trainTestSplit,]
#Datos de prueba
test = df[-(1:trainTestSplit),]


#Cross validation

dfTemp = iris
nFolds = 5

sizeTest = nrow(dfTemp)/nFolds
sizeTrain = nrow(dfTemp)-sizeTest
indicesDFTrain = matrix(nrow = sizeTrain, ncol = nFolds)
indicesDFTest = matrix(nrow = sizeTest, ncol = nFolds)
indDF = seq(1,nrow(dfTemp))

for (i in 1:nFolds){
  inicioTest = ((nFolds-i)*sizeTest)+1
  indicesDFTest[,i] = seq(inicioTest, (inicioTest-1 + sizeTest))

  indicesDFT = indDF[-indicesDFTest[,i]]
  indicesDFTrain[,i] = indicesDFT
}
