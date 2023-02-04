datos <- read.csv("C:/Users/ISND89/Documents/Ejercicios R/divorce.csv", stringsAsFactors = FALSE, sep=";")

class(data)

suma = sum(datos[,1])
suma

promedio = mean(datos[,5])
promedio

x = seq(from=2, to=170, by=2)
x2 = sum(datos[x,1])
x2

print(datos[x,1])


lista = list(datos[,1], datos[,2], datos[,3], datos[,4], datos[,5])
lista

