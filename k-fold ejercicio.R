crx <- read.csv("Machine Learning/crx.data", header=FALSE)

colNumericas<-c(2, 3, 8, 11, 14, 15)
#HACER este proceso para todas las columnas que son numericas y existen missing values
#  -------------------------------------#
for (ncol in colNumericas){
  # Imputar datos cuando los valores son ? #
  # 1. Localizar las posiciones de las filas que tienen los missing values
  posNO<-which(crx[,ncol] == "?")
  # 2. Debido a que la columna es tipo factor, convertir a numerico aquellas
  #    filas que son diferentes a NA´s o ?´s
  vecNumeric<-as.numeric(as.character(crx[which(crx[,ncol] != "?"),ncol]))
  # 3. Obtener la media solo de los datos que no son missing values
  mediaV<-mean(vecNumeric)
  # 4. Convertir a numérico toda la columna deseada
  crx[,ncol]<-as.numeric(as.character(crx[,ncol]))
  # 5. Asignar la media de la columna deseada a las filas donde existen missing values
  crx[posNO,ncol]<-mediaV
}

min_max_norm <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

crxNormal<-crx
#apply Min-Max normalization 
crxNormal[,colNumericas] <- as.data.frame(lapply(crxNormal[,colNumericas], min_max_norm))


standarizacion<-function(x) {
  (x - mean(x))/sd(x)
}

crxEstandar<-crx
#estandardiza todas las columnas numéricas
crxEstandar[,colNumericas] <- as.data.frame(lapply(crxEstandar[,colNumericas], standarizacion))

summary(crx)
summary(crxNormal)
summary(crxEstandar)

#OPCION 1
ind = sample(2, nrow(crxNormal), replace = TRUE, prob = c(0.8, 0.2))
random.train = crxNormal[ind==1,]
random.test = crxNormal[ind==2,]