library(tidyverse)

dia<-diamonds
summary(dia)

class(dia$clarity)

dia$clarity
levels(dia$clarity)

summary(diamonds)

diamonds %>% count(clarity)

nfila = c(as.numeric(1.75), "Premium", "G", "IF", as.numeric(67.05), as.numeric(89), as.numeric(7895), as.numeric(4.860), as.numeric(79.84), as.numeric(12.654))

dia = rbind(nfila)

dia = rbind(diamonds, nfila)

summary(dia)

dia = as.data.frame(dia)

dia[,1] = as.numeric(dia[,1])


head(dia)
tail(dia)

class(dia)
class(datos)

unlist(dia$carat)
unlist(dia[,1])
