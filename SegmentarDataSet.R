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