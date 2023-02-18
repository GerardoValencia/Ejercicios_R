#metodo KNN aplicada al conjunto iris

df = iris
set.seed(1234)

#OPCION 1
ind = sample(2, nrow(df), replace = TRUE, prob = c(0.7, 0.3))
random.train = df[ind==1,]
random.test = df[ind==2,]

instTrain = random.train[1, 1:4]
instTest = random.test[1, 1:4]

distanciaManhattan = function(x, y){
  result = sum(abs(x-y))
}

dist = distanciaManhattan(instTrain, instTest)
