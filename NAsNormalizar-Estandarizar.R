crx <- read.csv("Machine Learning/crx.data", header=FALSE, na.strings="?")

colNumericas<-c(2, 3, 8, 11, 14, 15)
for (i in colNumericas){
  posV<-which(is.na(crx[,i]))
  mediaV<-mean(!is.na(crx[,i]))
  crx[posV,i]<-mediaV
}
summary(crx)

#función para normalizar
min_max_norm <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

crxNormal<-crx
#apply Min-Max normalization 
crxNormal[,colNumericas] <- as.data.frame(lapply(crxNormal[,colNumericas], min_max_norm))

# Vaciar los datos a un archivo
write.table(crxNormal, file = "C:/Users/ISND89/Documents/Machine Learning/normalizar.txt", sep = "\t", eol= "\n", dec = ".")

standarizacion<-function(x) {
  (x - mean(x))/sd(x)
}

crxEstandar<-crx
#estandardiza todas las columnas numéricas
crxEstandar[,colNumericas] <- as.data.frame(lapply(crxEstandar[,colNumericas], standarizacion))

#estandardiza solo una columna
#crx[,2] <- (crx[,2] - mean(crx[,2])) / sd(crx[,2])

# Vaciar los datos a un archivo
write.table(crxEstandar, file = "C:/Users/ISND89/Documents/Machine Learning/estandar.txt", sep = "\t", eol= "\n", dec = ".")

summary(crx)
summary(crxNormal)
summary(crxEstandar)

#OPCION 1
ind = sample(2, nrow(crxNormal), replace = TRUE, prob = c(0.7, 0.3))
random.train = crxNormal[ind==1,]
random.test = crxNormal[ind==2,]

#OPCION 2
trainTestSplit = floor(nrow(crxNormal)*0.7)

#Asignaci�n de los datos de entrenamiento
train = crxNormal[1:trainTestSplit,]

#Datos de prueba
test = crxNormal[-(1:trainTestSplit),]

