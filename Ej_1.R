x <- "Hello, World!"
class(x)

y <- 3.14
class(y)

z <- 15L
class(z)

c <- 5 +2i
class(c)

t <- TRUE
class(t)

x <- list(age=c(10, 21, 33), weight=c(30, 66, 80))

names(x)

length(x)

x = c("This", "is", "a", "character", "vector")
x

y = c(1, 2, 3, 5, 7)
y

class(x)

class(y)

# Initialization of logical vector with length of 5
x <- vector(mode="logical", length = 5)
x

x[1] <- TRUE
x

x = c("Hello World!", 1, TRUE)
x

y = c(TRUE, FALSE, 1)
y

as.logical(y)

x <- list("Hello World!", 2015, TRUE, 3.14)
x

class(x[[2]])

mat <- c(1, 3, 2, 4)
dim(mat) <- c(2, 2)
mat

temp = c(1, 2, 3, 7, 8, 9)
mat = matrix(temp, nrow = 2, ncol = 3, byrow = TRUE)
mat

# Default byrow = FALSE
mat = matrix(temp, nrow = 2, ncol = 3)
mat

t1 = c(1, 2, 3)
t2 = c(7, 8, 9)
# By Rows
rbind(t1, t2)

# By Columns
cbind(t1, t2)

factor(c("Yes", "No", "No", "Yes"))
f = factor(c("Yes", "No", "No", "Yes"), 
           levels = c("Yes"))
f

x = NA
is.na(x)

y = 0/0
y

is.nan(y)

x = c("mary", "bob", "george")
y = c(15, 16, 20)
z = c(FALSE, FALSE, TRUE)
z = as.factor(z)
dfr = data.frame(username = x, age = y, adult = z)
dfr
dfr[,3]

# First row
dfr[1,]

# First column
dfr[,1]

# Age column
dfr$age

data = read.csv()

library(readxl)
divorce <- read_excel("Ejercicios R/divorce.xlsx")
divorce

class(divorce)

divorce[1:5,1:5] #Fila, Columna

summary(divorce[,1:5])
divorce[,1] = as.factor(divorce[,1])

summary(divorce[,1:5])

x = seq(from=2, to=12, by=3)
x

x = seq(from=2, to=12, by=2)
x

x = seq(from=2, to=10, length=4)
x

x = rep(1:4, 4)
x

x = rep("hello", 5)
x

x = seq(1, 15, 2)
x

x[1:3]
x[2:5]

class(x)
class(x[2:5])

y = list("Hello", "Planet", "Earth!")
y[c(1,3)]

class(y[c(1,3)])

y[(1)]  
class(y[[1]])

y[[c(1,3)]]

y = list(age=c(18, 20, 28), height=c(1.60, 1.72, 1.79))
y

class(y)
y$age
class(y$age)

x = matrix(1:9, nrow=3, ncol=3, byrow=TRUE)
x

class(x[1,1])
class(x[1,1, drop=FALSE])

y = list(age=c(15, 19, 29), heigt=c(1.60, 1.68, 1.76))
y[["age"]]
y[["a", exact=FALSE]]

y = c(15, 22, 45, NA, NA, 51)
y
# We locate the NA values.
i = is.na(y)
i
# Reference to y subset with no(!) NA values.
y[!i]

# Vectorization
x = rnorm(10000000)
y = rnorm(10000000)

z = vector(mode="numeric", length = 10000000)

# Iteration
start = proc.time()
for (i in 1:10000000) {
  z[i] = x[i] + y[i]
}
proc.time()-start

# Vectorization
start = proc.time()
z = x + y
proc.time()-start

x = 20
if (x < 0) {
  print("Negative!")
}else if (x < 10){
  print("Positive, less than 10!")
}else{
  print("Number greater than 10!")
}

for (i in 1:10) {
  cat(i)
  cat(" ")
}

letters

for (x in letters) {
  cat(x)
  cat(" ")
}

x = -1
while (x < 5) {
  print(x)
  x = x+1
}

x = 1
repeat{
  print(x)
  if (x > 5){
    break
  }
  x = x+1
}

for (i in 1:100) {
  # Override the first 20 iterations
  if (i <= 20){
    next
  }
}

myPrinter = function(x){
  for (i in seq_len(x)) {
    print("Hello World")
  }
}
myPrinter(3)

volume = function(x=3, y=3, z=3){
  print(x*y*z)
}
volume(y=3, z=5, x=11)
volume()

myPrinter = function(..., mes){
  print(sum(...))
  print(mes)
}
myPrinter(3, 5, 11, mes = "Hi")

str(lapply)
x = list(a=rnorm(10), b=rnorm(20), c=rnorm(30))
lapply(x, mean)

str(sapply)
x = list(a=rnorm(10), b=rnorm(20), c=rnorm(30))
z = sapply(x, mean)
class(z)

dat = data.frame(subject=1:6, age=c(15,17,16,20,21,23),
                 adult=c(FALSE,FALSE,FALSE,TRUE,TRUE,TRUE))
s = split(dat, dat$adult)
s

sapply(s, function(x){
  mean(x[["age"]])
})

str(tapply)
x = c(rnorm(10), rnorm(10), rnorm(10), rnorm(10))
f = gl(4, 10)
f

tapply(x, f, mean)
